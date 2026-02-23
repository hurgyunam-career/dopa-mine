import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dopa_mine/main.dart';

void main() {
  testWidgets('홈에서 운동 시작 버튼이 기본 비활성화된다', (WidgetTester tester) async {
    await tester.pumpWidget(const DopaMineApp());

    expect(find.text('운동 시작'), findsOneWidget);
    final Finder startButton = find.widgetWithText(FilledButton, '운동 시작');
    expect(tester.widget<FilledButton>(startButton).onPressed, isNull);
  });
}
