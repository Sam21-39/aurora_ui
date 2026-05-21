import 'package:aurora_ui/aurora_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AuroraRenderStrategy.of returns a strategy', (
    WidgetTester tester,
  ) async {
    late AuroraRenderStrategy strategy;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            strategy = AuroraRenderStrategy.of(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(strategy, isNotNull);
  });
}
