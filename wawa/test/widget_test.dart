import 'package:flutter_test/flutter_test.dart';

import 'package:movielog/main.dart';

void main() {
  testWidgets('MovieLogApp shows sign-up screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MovieLogApp());

    expect(find.text('회원가입'), findsOneWidget);
    expect(find.text('환영합니다!'), findsOneWidget);
  });
}
