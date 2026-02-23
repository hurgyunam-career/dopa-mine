# DDD (Domain-Driven Design) 컨벤션

이 문서는 프로젝트의 아키텍처 일관성을 유지하기 위한 구체적인 규칙을 정의한다.

## 1. 디렉토리 구조 (Feature-first)
모든 기능(Feature)은 `lib/src/features/{feature_name}` 하위에 위치하며, 각 기능은 다음 4개의 계층으로 분리한다.

- **domain/**: 비즈니스 로직의 핵심. 외부 라이브러리(패키지) 의존성을 최소화한다.
  - `entities/`: 고유 식별자를 가진 객체
  - `value_objects/`: 속성으로만 정의되는 객체
  - `repositories/`: 데이터 처리를 위한 추상 인터페이스
- **application/**: 유저의 행위(Use Case)를 정의.
  - `services/` 또는 `use_cases/`: 비즈니스 흐름 제어
- **infrastructure/**: 외부 시스템과의 통신 구현.
  - `repositories/`: domain의 인터페이스를 실제 구현 (Data Source 연동)
  - `models/`: API 통신이나 로컬 DB를 위한 DTO (Data Transfer Object)
  - `datasources/`: 실제 API 호출부 (http, dio, shared_preferences 등)
- **presentation/**: UI 및 상태 관리.
  - `screens/` 또는 `pages/`: 전체 화면 위젯
  - `widgets/`: 재사용 가능한 작은 컴포넌트
  - `providers/` 또는 `controllers/`: 상태 관리 로직 (Riverpod/Provider 등)

## 2. 의존성 방향 (Dependency Rule)
- 의존성은 항상 외부에서 내부로 향해야 한다.
- **Presentation -> Application -> Domain <- Infrastructure**
- Domain 계층은 그 어떤 계층에도 의존하지 않아야 한다. (Pure Dart)

## 3. 명명 규칙 (Naming Convention)
- **Entities**: `{Name}Entity` (예: `ExerciseEntity`)
- **Repositories (Interface)**: `I{Name}Repository` (예: `IExerciseRepository`)
- **Repositories (Implementation)**: `{Name}RepositoryImpl` (예: `ExerciseRepositoryImpl`)
- **DTOs**: `{Name}Dto` 또는 `{Name}Model` (예: `ExerciseDto`)

## 4. 데이터 흐름 (Data Flow)
1. UI에서 사용자의 액션 발생.
2. Application(Use Case) 호출.
3. Infrastructure에서 데이터를 가져와 DTO를 생성.
4. DTO를 Domain Entity로 변환(Mapper)하여 반환.
5. UI는 Entity를 전달받아 화면을 갱신.