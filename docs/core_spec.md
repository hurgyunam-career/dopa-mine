# 프로젝트명: Dopa-mine (도파민)

## 1. 개요
- 타겟: 무기력증으로 누워있는 유저
- 핵심 가치: 아주 작은 성취감을 통한 행동 유도

## 2. 기술 스택
- Frontend: Flutter (Windows Desktop 및 Mobile)
- State Management: Provider 또는 Riverpod
- Design System: Material 3 (Dark Mode 우선)

## 3. UI/UX 요구사항
- 미니멀리즘: 복잡한 메뉴 배제, 한 화면에 하나의 핵심 액션만.
- 운동 목록: Bird-dog, Superman, Bridge, T-Raise, Y-Raise (5종)

## 4. 데이터 구조 (Model)
- Exercise: id, name, description, targetCount, metPoints
- Session: id, exerciseId, startTime, duration, isCompleted

## 5. 구현 우선순위
1. 홈 화면: 운동 리스트 및 선택 로직
2. 세션 화면: 선택한 운동의 타이머 및 시작/종료 처리