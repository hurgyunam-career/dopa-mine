# API Design

세션 저장/조회에 필요한 API 계약(Contract) 초안을 정의합니다.

## 1) 목적
- 앱의 세션 데이터를 백엔드에 일관된 형식으로 저장한다.
- 프론트엔드와 백엔드의 책임 경계를 명확히 한다.

## 2) 엔드포인트 초안
- `POST /sessions`: 세션 생성
- `GET /sessions/{id}`: 세션 단건 조회
- `GET /sessions?exerciseId={id}`: 운동 기준 세션 목록 조회

## 3) 요청/응답 모델 (초안)
### Create Session Request
- `exerciseId`: string
- `startTime`: ISO-8601 string
- `duration`: int (seconds)
- `repetitionCount`: int
- `isCompleted`: bool

### Create Session Response
- `id`: string
- `exerciseId`: string
- `startTime`: ISO-8601 string
- `duration`: int
- `repetitionCount`: int
- `isCompleted`: bool
- `pointsAwarded`: int

## 4) 에러 규약 (초안)
- `400`: 입력값 오류 (`duration < 0`, `repetitionCount < 0`)
- `409`: 중복 완료/멱등성 충돌
- `500`: 서버 내부 오류

## 5) 미정 항목
- 인증/권한 모델 (토큰 방식 여부)
- 포인트 계산을 서버/클라이언트 중 어디서 최종 확정할지
- 세션 중단/복구 상태를 API에 포함할지 여부
