import 'package:flutter/material.dart';

/// Semantic color tokens inspired by iOS system surfaces.
@immutable
class AuroraColorScheme {
  /// Creates a semantic Aurora color scheme.
  const AuroraColorScheme({
    required this.background,
    required this.foreground,
    required this.separator,
    required this.accent,
  });

  /// Surface background.
  final Color background;

  /// Primary foreground text/icon color.
  final Color foreground;

  /// Hairline/separator color.
  final Color separator;

  /// Interactive accent color.
  final Color accent;

  /// Returns a light semantic scheme.
  factory AuroraColorScheme.light() {
    return const AuroraColorScheme(
      background: Color(0xFFF2F2F7),
      foreground: Color(0xFF000000),
      separator: Color(0x33000000),
      accent: Color(0xFF007AFF),
    );
  }

  /// Returns a dark semantic scheme.
  factory AuroraColorScheme.dark() {
    return const AuroraColorScheme(
      background: Color(0xFF000000),
      foreground: Color(0xFFFFFFFF),
      separator: Color(0x55FFFFFF),
      accent: Color(0xFF0A84FF),
    );
  }
}
