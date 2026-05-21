import 'package:aurora_ui/aurora_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AuroraCard renders content', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: AuroraCard(child: Text('card'))),
      ),
    );

    expect(find.text('card'), findsOneWidget);
  });
}
