import 'package:flutter_test/flutter_test.dart';

import 'package:movielog/main.dart';

void main() {
  testWidgets('MovieLogApp shows profile screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MovieLogApp());

    expect(find.text('내 프로필'), findsOneWidget);
    expect(find.text('무비러버'), findsOneWidget);
  });
}
