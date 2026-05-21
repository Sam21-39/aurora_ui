import 'package:aurora_ui/aurora_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AuroraNavBar implements PreferredSizeWidget', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(appBar: AuroraNavBar(title: Text('Home'))),
      ),
    );

    expect(find.text('Home'), findsOneWidget);
  });
}
