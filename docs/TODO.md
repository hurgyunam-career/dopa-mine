# Docs TODO

문서 정합성과 유지보수성을 높이기 위한 작업 목록입니다.

## P0 (즉시 반영)
- [x] `docs/README.md` 생성 (문서 인덱스/우선순위/읽기 순서 정의)
- [x] `docs/context/01_current_understanding.md`에 As-Is/To-Be/전환 정책 구조 통일
- [x] `docs/product/01_use_cases.md`에 실패/예외/경계 시나리오 반영
- [x] `docs/product/02_core_spec.md`에 `Session.repetitionCount` 및 완료 규칙 명시
- [x] `docs/design/01_ui_design.md`에 구현 매핑 체크리스트 추가
- [x] `docs` 루트 정리: `README.md`, `TODO.md`만 유지

## P1 (다음 정비)
- [ ] 루트 `README.md`와 `docs` 문서 간 용어/구조 설명 동기화
- [ ] 포인트 계산식 상세 규칙을 `docs/product/02_core_spec.md`에 수식 수준으로 확정
- [ ] 세션 복구 정책(백그라운드/앱 종료)을 `docs/product/01_use_cases.md`와 구현 기준으로 연결
- [ ] `docs/architecture/01_api_design.md`에 인증/에러 응답 바디 표준 확정

## P2 (지속 개선)
- [ ] 문서 공통 Glossary 추가 (`Session`, `Exercise`, `Completed`, `Persist`)
- [ ] 각 문서에 변경 이력(날짜/요약) 정책 도입
- [ ] 릴리즈 단위로 문서 검토 체크리스트 운영

## 메모
- 기준 문서는 `docs/context/01_current_understanding.md`
- 아키텍처 규칙은 `docs/rules/01_ddd_convention.md`를 우선 적용
