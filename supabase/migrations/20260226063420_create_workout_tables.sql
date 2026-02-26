-- extensions
create extension if not exists "pgcrypto";

-- updated_at 자동 갱신 함수
create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

-- 1) workout_sessions
create table if not exists public.workout_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  exercise_id text not null,
  start_time timestamptz not null,
  end_time timestamptz null,
  duration_seconds integer not null default 0 check (duration_seconds >= 0),
  repetition_count integer not null default 0 check (repetition_count >= 0),
  is_completed boolean not null default false,
  points_awarded integer not null default 0 check (points_awarded >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists idx_workout_sessions_user_id on public.workout_sessions(user_id);
create index if not exists idx_workout_sessions_start_time on public.workout_sessions(start_time desc);

drop trigger if exists trg_workout_sessions_updated_at on public.workout_sessions;
create trigger trg_workout_sessions_updated_at
before update on public.workout_sessions
for each row execute function public.set_updated_at();

-- 2) session_exercises
create table if not exists public.session_exercises (
  id uuid primary key default gen_random_uuid(),
  session_id uuid not null references public.workout_sessions(id) on delete cascade,
  exercise_id text not null,
  sequence integer not null check (sequence >= 1),
  target_reps integer null check (target_reps is null or target_reps >= 0),
  actual_reps integer not null default 0 check (actual_reps >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (session_id, sequence)
);

create index if not exists idx_session_exercises_session_id on public.session_exercises(session_id);

drop trigger if exists trg_session_exercises_updated_at on public.session_exercises;
create trigger trg_session_exercises_updated_at
before update on public.session_exercises
for each row execute function public.set_updated_at();

-- 3) repetition_logs
create table if not exists public.repetition_logs (
  id uuid primary key default gen_random_uuid(),
  session_id uuid not null references public.workout_sessions(id) on delete cascade,
  session_exercise_id uuid not null references public.session_exercises(id) on delete cascade,
  rep_index integer not null check (rep_index >= 1),
  logged_at timestamptz not null,
  elapsed_seconds integer not null check (elapsed_seconds >= 0),
  created_at timestamptz not null default now(),
  unique (session_exercise_id, rep_index)
);

create index if not exists idx_repetition_logs_session_id on public.repetition_logs(session_id);
create index if not exists idx_repetition_logs_session_exercise_id on public.repetition_logs(session_exercise_id);
create index if not exists idx_repetition_logs_logged_at on public.repetition_logs(logged_at);

-- RLS 활성화
alter table public.workout_sessions enable row level security;
alter table public.session_exercises enable row level security;
alter table public.repetition_logs enable row level security;

-- 정책: 본인 소유 세션만 접근 가능
drop policy if exists "workout_sessions_owner_all" on public.workout_sessions;
create policy "workout_sessions_owner_all"
on public.workout_sessions
for all
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

drop policy if exists "session_exercises_owner_all" on public.session_exercises;
create policy "session_exercises_owner_all"
on public.session_exercises
for all
to authenticated
using (
  exists (
    select 1
    from public.workout_sessions ws
    where ws.id = session_exercises.session_id
      and ws.user_id = auth.uid()
  )
)
with check (
  exists (
    select 1
    from public.workout_sessions ws
    where ws.id = session_exercises.session_id
      and ws.user_id = auth.uid()
  )
);

drop policy if exists "repetition_logs_owner_all" on public.repetition_logs;
create policy "repetition_logs_owner_all"
on public.repetition_logs
for all
to authenticated
using (
  exists (
    select 1
    from public.workout_sessions ws
    where ws.id = repetition_logs.session_id
      and ws.user_id = auth.uid()
  )
)
with check (
  exists (
    select 1
    from public.workout_sessions ws
    where ws.id = repetition_logs.session_id
      and ws.user_id = auth.uid()
  )
);