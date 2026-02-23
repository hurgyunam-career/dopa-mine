# Current Understanding

프로젝트의 현재 구현 상태와 아키텍처 전환 방향을 기록하는 기준 문서입니다.

## 1) 현재 구현 상태
- `UC-01` 동작: 홈에서 5개 운동 종목 중 하나 선택 -> `운동 시작` 버튼 활성화 -> 세션 화면 이동
- `UC-02` 동작: 세션 화면에서 시간(타이머)과 횟수(수동 카운트) 수집
- `운동 완료` 시 세션 데이터(운동 ID, 시작 시각, 소요 시간, 횟수, 완료 여부) 저장 후 리포트 화면 이동
- 저장 성공 이후 리포트 진입 시 포인트 지급 알림(SnackBar) 즉시 노출

## 2) 아키텍처 현황
### As-Is (현재)
- 주요 코드 구조: `app_flutter/lib/{data,models,providers,screens,services,widgets}`
- 상태 관리: `Provider`
- 저장소: 인터페이스 기반이지만 구현은 Mock(`MockSupabaseSessionRepository`) 중심

### To-Be (목표)
- DDD Feature-first 구조: `lib/src/features/{feature}/{domain,application,infrastructure,presentation}`
- 의존성 규칙: `Presentation -> Application -> Domain <- Infrastructure`
- Domain은 Pure Dart 유지, Flutter/외부 의존성은 `presentation`/`infrastructure`로 제한

## 3) 점진 전환 정책 (Migration Policy)
- 전체 리라이트 대신 기능 단위로 점진 전환
- 기존 기능 수정 시 동작 보존을 우선하고 변경 범위 내 구조 개선만 수행
- 신규 유스케이스/복잡한 로직은 `application/use_cases` + `domain` 우선 배치
- 기존 `providers`/`screens`는 당분간 공존 허용, 리팩터링 시 `presentation`으로 이동
- Domain 계층에서 Flutter/Provider/DTO 의존성 금지

## 4) 다음 단계
- `MockSupabaseSessionRepository`를 실제 Supabase 연동 구현으로 교체
- 횟수 수집을 센서 입력까지 확장하고 수동/센서 모드 UX 정리
- `lib/src/features/...` 구조로 점진 리팩터링 (entities/repositories/use_cases/presentation 분리)
