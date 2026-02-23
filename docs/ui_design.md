# UI/UX Design Guidelines

이 문서는 'Dopa-mine' 프로젝트의 시각적 원칙과 레이아웃 규칙을 정의한다.

## 1. 플랫폼 및 화면 비율 (중요)
- **Target Device**: Mobile First (iOS/Android)
- **Desktop Debugging**: Windows 빌드 시 창 크기는 **400x800 (모바일 세로 모드 비율)**을 기본으로 한다.
- **Responsiveness**: 화면 너비가 넓어지더라도 컨텐츠는 중앙 최대 600px 이내로 제한하며, 배경만 확장한다.

## 2. 디자인 시스템 (Material 3)
- **Theme Mode**: Dark Mode 전용
- **Primary Color**: Deep Purple (도파민과 집중력을 상징)
- **Background**: `Color(0xFF121212)` (완전한 블랙보다는 피로도가 적은 다크 그레이)
- **Typography**: 미니멀하고 가독성이 높은 Sans-serif 계열 (Pretendard 추천)

## 3. 핵심 UI 원칙
- **Minimalism**: 누워있는 유저를 위해 불필요한 장식과 애니메이션을 배제한다.
- **One Action Per Screen**: 한 화면에서 유저가 고민하지 않도록 핵심 버튼은 하나만 강조한다.
- **Thumb Zone**: 모든 주요 상호작용 버튼(시작, 완료)은 화면 하단 1/3 영역(엄지손가락 범위)에 배치한다.

## 4. 컴포넌트 스타일
- **Cards**: `BorderRadius.circular(16)`, 선택 시 `BorderSide`로 하이라이트.
- **Buttons**: 하단 고정형(Sticky Bottom Button), 최소 높이 `60px`.