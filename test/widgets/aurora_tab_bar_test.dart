import 'package:aurora_ui/aurora_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AuroraTabBar renders items', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          bottomNavigationBar: AuroraTabBar(
            items: <AuroraTabItem>[
              AuroraTabItem(icon: Icons.home, label: 'Home'),
              AuroraTabItem(icon: Icons.search, label: 'Search'),
            ],
            currentIndex: 0,
          ),
        ),
      ),
    );

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
  });
}
