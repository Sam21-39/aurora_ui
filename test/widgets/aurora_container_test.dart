import 'package:aurora_ui/aurora_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AuroraContainer renders child', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light().copyWith(
          extensions: <ThemeExtension<dynamic>>[AuroraTheme.system()],
        ),
        home: const Scaffold(body: AuroraContainer(child: Text('hello'))),
      ),
    );

    expect(find.text('hello'), findsOneWidget);
  });
}
