# dopa_mine

짧은 운동을 빠르게 시작하고 기록하는 Flutter 기반 프로젝트입니다.

## 1) 프로젝트 개요
- 사용자는 운동을 선택하고 즉시 세션을 시작할 수 있습니다.
- 세션 시간과 반복 횟수를 수집하고 완료 시 저장합니다.
- 리포트 화면에서 수행 결과와 포인트를 확인합니다.

## 2) 현재 구현 범위
- 홈 화면: 운동 목록 선택 및 `운동 시작` 진입
- 세션 화면: 타이머/횟수 수집, `운동 완료` 처리
- 리포트 화면: 시간/횟수/포인트 표시
- 저장 흐름: 현재 Mock 저장소 기반 검증

문서 상세 상태와 우선순위는 `docs/README.md`를 기준으로 확인합니다.

## 3) 문서 안내
- `docs` 폴더는 프로젝트 문서의 단일 진입점이다.
- 문서 구조, 읽기 순서, 우선순위, 상세 참조는 `docs/README.md`에서 관리한다.
- 루트 `README.md`는 개요만 제공하고 문서 상세는 `docs`로 위임한다.
- 도메인 관련 상세 설명은 `docs/product` 하위 문서에서 확인한다.

## 4) 기술 스택
- Framework: Flutter
- Language: Dart
- State Management: Provider
- Runtime Target: Mobile First (Desktop는 디버깅 용도)

## 5) 코드 구조 (As-Is)
현재 `app_flutter/lib`는 다음 구조를 사용합니다.
- `data`: 기본 운동 데이터
- `models`: 도메인 모델
- `providers`: 상태 관리
- `screens`: 화면
- `services`: 저장소 인터페이스 및 구현
- `widgets`: 공용 컴포넌트

목표 구조(To-Be)는 DDD Feature-first이며 상세 규칙은 `docs/rules/01_ddd_convention.md`를 따릅니다.

## 6) 실행 방법
```bash
cd app_flutter
flutter pub get
flutter run
```

## 7) 다음 단계
- Mock 저장소를 실제 백엔드 연동으로 교체
- 센서 기반 입력 확장 및 수동/센서 UX 정리
- DDD 구조(`lib/src/features/...`)로 점진 리팩터링