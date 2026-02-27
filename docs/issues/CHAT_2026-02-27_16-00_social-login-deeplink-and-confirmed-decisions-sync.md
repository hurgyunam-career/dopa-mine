# Chat Log - 2026-02-27 16:00 - 소셜 로그인 딥링크 규격 및 확정 이슈 동기화

## 왜 기록하나
- AI 제안과 사용자 결정을 구분해 남긴다. 딥링크 규격·스킴 선택·문서 반영·확정 이슈 동기화 규칙 결정이 포함됨.

## 결정 요약
- 결론: 역도메인 스킴(com.heokyunam.dopamine) 확정, README §앱 식별 추가, 05_confirmed_decisions 반영 및 동기화용 mdc 규칙 신설.
- 이유: 스킴 고유성·충돌 방지, 에이전트/개발자 발견 용이(README), 확정 이슈 단일 진입점(05) 유지 및 자동 동기화.

## 제안 출처
### AI 제안
- Supabase URL 설정 전 딥링크 작업 선행 필요, 진행 순서 및 Flutter/Android 딥링크 추가 방법.
- 02_social_login.md TODO 순서 재정렬(의존성 반영) 및 딥링크 규격 초안(scheme/host/path, 환경별 안 A·B).
- 스킴 비교: dopamine(짧음/단순) vs 역도메인(고유성·충돌 방지).
- 역도메인은 문서에 없으면 알 수 없으므로 README §앱 식별 추가 제안.
- 05_confirmed_decisions.md에 딥링크 스킴 확정 행 추가 및, 확정 시 자동 반영을 위한 .cursor/rules mdc 작성.

### 사용자 결정
- 스킴: 역도메인으로 할 것. 실제 도메인 com.heokyunam.dopamine 사용.
- README에 앱 식별(딥링크 스킴) 추가하는 것에 동의.
- 05에 추가하는 것이 맞다 판단, 앞으로 자동 판단·반영하도록 mdc 작성 요청.

## 반영
- 변경 문서: docs/todo/02_social_login.md, README.md, docs/context/05_confirmed_decisions.md, .cursor/rules/confirmed-decisions-sync.mdc
- 상태: done

## 취합용 요약
- 결론: 소셜 로그인 콜백 딥링크를 역도메인 com.heokyunam.dopamine으로 확정하고, README·05·mdc 규칙으로 반영·자동 동기화까지 적용함.
- AI 제안 핵심: 딥링크 순서·규격 초안·스킴 장단점·README/05 반영·확정 시 05 자동 동기화용 mdc 규칙 제안.
- 사용자 결정 핵심: 역도메인 선택, 실제 도메인 com.heokyunam.dopamine 확정, 05 추가 및 mdc로 자동 판단·반영 요청.
