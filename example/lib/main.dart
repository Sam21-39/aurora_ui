import 'package:aurora_ui/aurora_ui.dart';
import 'package:flutter/material.dart';

import 'screens/components_screen.dart';
import 'screens/home_screen.dart';
import 'screens/materials_screen.dart';

void main() {
  runApp(const AuroraExampleApp());
}

class AuroraExampleApp extends StatefulWidget {
  const AuroraExampleApp({super.key});

  @override
  State<AuroraExampleApp> createState() => _AuroraExampleAppState();
}

class _AuroraExampleAppState extends State<AuroraExampleApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[AuroraTheme.system()],
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[AuroraTheme.system()],
      ),
      home: HomeScreen(
        onToggleTheme: () {
          setState(() {
            _themeMode = _themeMode == ThemeMode.dark
                ? ThemeMode.light
                : ThemeMode.dark;
          });
        },
        children: const <Widget>[MaterialsScreen(), ComponentsScreen()],
      ),
    );
  }
}
