import 'package:flutter/widgets.dart';

/// Semantic Apple-style material levels for glass rendering.
enum AuroraMaterial {
  /// iOS `systemUltraThinMaterial`.
  ultraThin,

  /// iOS `systemThinMaterial`.
  thin,

  /// iOS `systemMaterial`.
  regular,

  /// iOS `systemThickMaterial`.
  thick,

  /// A denser style than `thick` for high-separation surfaces.
  ultraThick,

  /// iOS `systemMaterialDark` equivalent.
  dark,

  /// iOS `systemMaterialLight` equivalent.
  light,

  /// iOS system chrome style.
  chromeMaterial,

  /// Desktop title bar-inspired style.
  titleBar,

  /// Future-facing liquid glass effect token.
  liquidGlass,
}

/// Material rendering parameters used in Flutter fallback rendering.
class AuroraMaterialSpec {
  /// Creates a material specification.
  const AuroraMaterialSpec({
    required this.blurRadius,
    required this.tintLight,
    required this.tintDark,
    required this.tintOpacityLight,
    required this.tintOpacityDark,
    required this.saturation,
  });

  /// Backdrop blur radius (sigma).
  final double blurRadius;

  /// Light mode tint base.
  final Color tintLight;

  /// Dark mode tint base.
  final Color tintDark;

  /// Light mode tint opacity.
  final double tintOpacityLight;

  /// Dark mode tint opacity.
  final double tintOpacityDark;

  /// Saturation multiplier for color vibrancy.
  final double saturation;

  /// Builds a vertical tint gradient that approximates native material depth.
  LinearGradient buildGradient(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    final Color tint = isDark ? tintDark : tintLight;
    final double opacity = isDark ? tintOpacityDark : tintOpacityLight;

    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        tint.withValues(alpha: (opacity + 0.08).clamp(0.0, 1.0)),
        tint.withValues(alpha: opacity.clamp(0.0, 1.0)),
        tint.withValues(alpha: (opacity - 0.1).clamp(0.0, 1.0)),
      ],
      stops: const <double>[0.0, 0.5, 1.0],
    );
  }
}

/// Mapping from semantic materials to Flutter rendering and iOS style tokens.
extension AuroraMaterialX on AuroraMaterial {
  /// Native iOS blur style string used by the platform view.
  String get uiBlurEffectStyle {
    switch (this) {
      case AuroraMaterial.ultraThin:
        return 'systemUltraThinMaterial';
      case AuroraMaterial.thin:
        return 'systemThinMaterial';
      case AuroraMaterial.regular:
        return 'systemMaterial';
      case AuroraMaterial.thick:
        return 'systemThickMaterial';
      case AuroraMaterial.ultraThick:
        return 'systemChromeMaterial';
      case AuroraMaterial.dark:
        return 'systemMaterialDark';
      case AuroraMaterial.light:
        return 'systemMaterialLight';
      case AuroraMaterial.chromeMaterial:
        return 'systemChromeMaterial';
      case AuroraMaterial.titleBar:
        return 'systemThickMaterial';
      case AuroraMaterial.liquidGlass:
        return 'systemUltraThinMaterial';
    }
  }

  /// Fallback Flutter material spec used outside native iOS rendering.
  AuroraMaterialSpec get spec {
    switch (this) {
      case AuroraMaterial.ultraThin:
        return const AuroraMaterialSpec(
          blurRadius: 20,
          tintLight: Color(0xFFFFFFFF),
          tintDark: Color(0xFF1C1C1E),
          tintOpacityLight: 0.55,
          tintOpacityDark: 0.55,
          saturation: 1.8,
        );
      case AuroraMaterial.thin:
        return const AuroraMaterialSpec(
          blurRadius: 24,
          tintLight: Color(0xFFFFFFFF),
          tintDark: Color(0xFF2C2C2E),
          tintOpacityLight: 0.60,
          tintOpacityDark: 0.60,
          saturation: 1.8,
        );
      case AuroraMaterial.regular:
        return const AuroraMaterialSpec(
          blurRadius: 28,
          tintLight: Color(0xFFFFFFFF),
          tintDark: Color(0xFF3A3A3C),
          tintOpacityLight: 0.72,
          tintOpacityDark: 0.72,
          saturation: 1.8,
        );
      case AuroraMaterial.thick:
        return const AuroraMaterialSpec(
          blurRadius: 32,
          tintLight: Color(0xFFFFFFFF),
          tintDark: Color(0xFF48484A),
          tintOpacityLight: 0.80,
          tintOpacityDark: 0.80,
          saturation: 1.8,
        );
      case AuroraMaterial.ultraThick:
        return const AuroraMaterialSpec(
          blurRadius: 36,
          tintLight: Color(0xFFFFFFFF),
          tintDark: Color(0xFF636366),
          tintOpacityLight: 0.88,
          tintOpacityDark: 0.88,
          saturation: 1.8,
        );
      case AuroraMaterial.dark:
        return const AuroraMaterialSpec(
          blurRadius: 28,
          tintLight: Color(0xFFFFFFFF),
          tintDark: Color(0xFF1C1C1E),
          tintOpacityLight: 0.30,
          tintOpacityDark: 0.78,
          saturation: 1.6,
        );
      case AuroraMaterial.light:
        return const AuroraMaterialSpec(
          blurRadius: 28,
          tintLight: Color(0xFFFFFFFF),
          tintDark: Color(0xFF1C1C1E),
          tintOpacityLight: 0.84,
          tintOpacityDark: 0.30,
          saturation: 1.7,
        );
      case AuroraMaterial.chromeMaterial:
        return const AuroraMaterialSpec(
          blurRadius: 30,
          tintLight: Color(0xFFF7F7F9),
          tintDark: Color(0xFF2C2C2E),
          tintOpacityLight: 0.80,
          tintOpacityDark: 0.76,
          saturation: 1.7,
        );
      case AuroraMaterial.titleBar:
        return const AuroraMaterialSpec(
          blurRadius: 22,
          tintLight: Color(0xFFF2F2F7),
          tintDark: Color(0xFF1F1F23),
          tintOpacityLight: 0.82,
          tintOpacityDark: 0.82,
          saturation: 1.5,
        );
      case AuroraMaterial.liquidGlass:
        return const AuroraMaterialSpec(
          blurRadius: 34,
          tintLight: Color(0xFFFFFFFF),
          tintDark: Color(0xFF141417),
          tintOpacityLight: 0.44,
          tintOpacityDark: 0.52,
          saturation: 2.0,
        );
    }
  }

  /// Returns a solid fallback color used for reduced-transparency modes.
  Color solidFallback(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    switch (this) {
      case AuroraMaterial.light:
        return const Color(0xFFF2F2F7);
      case AuroraMaterial.dark:
        return const Color(0xFF1C1C1E);
      default:
        return isDark ? const Color(0xFF1C1C1E) : const Color(0xFFF2F2F7);
    }
  }
}
