# Docs TODO

문서 정합성과 유지보수성을 높이기 위한 작업 목록입니다.
마지막 업데이트: 2026-02-23

## P0 (즉시 반영)
- [x] `docs/README.md` 생성 (문서 인덱스/우선순위/읽기 순서 정의)
- [x] `docs/context/01_current_understanding.md`에 As-Is/To-Be/전환 정책 구조 통일
- [x] `docs/product/02_use_cases.md`에 실패/예외/경계 시나리오 반영
- [x] `docs/product/03_core_spec.md`에 `Session.repetitionCount` 및 완료 규칙 명시
- [x] `docs/design/01_ui_design.md`에 구현 매핑 체크리스트 추가
- [x] `docs` 루트 정리: `README.md`, `TODO.md`만 유지

## P1 (다음 정비)
- [x] 루트 `README.md`와 `docs` 문서 간 용어/구조 설명 동기화
  - [x] 용어 표준안 확정 (`운동/Exercise`, `세션/Session`, `횟수/repetitionCount`, `완료/Completed`, `저장/save`)
  - [x] 루트 `README.md`의 구조 설명 수준 확정 (루트는 개요만, 문서 상세는 `docs/README.md`로 위임)
  - [x] Source of Truth 표기 방식 확정 (우선순위 체계 채택, 전역 기준은 `docs/README.md`, 용어 기준은 `docs/product/01_glossary.md`)
  - [x] 문서 링크 정책 확정 (루트는 `docs/README.md` 중심으로 안내, 상세 정의는 `docs`에만 작성)
  - [x] 산출물 반영 완료 (용어 매핑 표 1개 + 루트 `README.md` 섹션 2/3/5 동기화 + 검토 체크리스트)
- [ ] 포인트 계산식 상세 규칙을 `docs/product/03_core_spec.md`에 수식 수준으로 확정
- [ ] 세션 복구 정책(백그라운드/앱 종료)을 `docs/product/02_use_cases.md`와 구현 기준으로 연결
- [ ] `docs/architecture/01_api_design.md`에 인증/에러 응답 바디 표준 확정

## P2 (지속 개선)
- [x] 문서 공통 Glossary 추가 (`docs/product/01_glossary.md`)
- [ ] 각 문서에 변경 이력(날짜/요약) 정책 도입
- [ ] 릴리즈 단위로 문서 검토 체크리스트 운영

## 메모
- 기준 문서는 `docs/context/01_current_understanding.md`
- 아키텍처 규칙은 `docs/rules/01_ddd_convention.md`를 우선 적용
