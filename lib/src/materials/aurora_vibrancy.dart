import 'package:flutter/material.dart';

/// Vibrancy semantic levels for text/fills on glass.
enum AuroraVibrancy {
  /// Primary label.
  label,

  /// Secondary label.
  secondaryLabel,

  /// Tertiary label.
  tertiaryLabel,

  /// Quaternary label.
  quaternaryLabel,

  /// Primary fill.
  fill,

  /// Secondary fill.
  secondaryFill,

  /// Tertiary fill.
  tertiaryFill,

  /// Hairline separators.
  separator,
}

/// Resolves semantic vibrancy to context-aware colors.
class AuroraVibrancyResolver {
  /// Returns the resolved color for the provided vibrancy token.
  static Color resolve(BuildContext context, AuroraVibrancy vibrancy) {
    final Brightness brightness = Theme.of(context).brightness;
    final bool isDark = brightness == Brightness.dark;
    final bool highContrast =
        MediaQuery.maybeOf(context)?.highContrast ?? false;

    Color color;
    switch (vibrancy) {
      case AuroraVibrancy.label:
        color = isDark ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
      case AuroraVibrancy.secondaryLabel:
        color = isDark ? const Color(0xCCFFFFFF) : const Color(0x99000000);
      case AuroraVibrancy.tertiaryLabel:
        color = isDark ? const Color(0x99FFFFFF) : const Color(0x66000000);
      case AuroraVibrancy.quaternaryLabel:
        color = isDark ? const Color(0x66FFFFFF) : const Color(0x44000000);
      case AuroraVibrancy.fill:
        color = isDark ? const Color(0x52FFFFFF) : const Color(0x52000000);
      case AuroraVibrancy.secondaryFill:
        color = isDark ? const Color(0x3DFFFFFF) : const Color(0x3D000000);
      case AuroraVibrancy.tertiaryFill:
        color = isDark ? const Color(0x29FFFFFF) : const Color(0x29000000);
      case AuroraVibrancy.separator:
        color = isDark ? const Color(0x55FFFFFF) : const Color(0x33000000);
    }

    if (highContrast) {
      return Color.alphaBlend(isDark ? Colors.white : Colors.black, color);
    }

    return color;
  }
}
