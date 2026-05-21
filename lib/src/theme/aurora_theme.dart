import 'dart:ui';

import 'package:flutter/material.dart';

/// Theme extension for Aurora rendering behavior and defaults.
@immutable
class AuroraTheme extends ThemeExtension<AuroraTheme> {
  /// Creates an Aurora theme extension.
  const AuroraTheme({
    required this.useNativeGlass,
    required this.maxBlurSigma,
    required this.enableParallax,
    required this.enableAnimations,
  });

  /// Creates a system default Aurora theme.
  factory AuroraTheme.system() {
    return const AuroraTheme(
      useNativeGlass: true,
      maxBlurSigma: 28,
      enableParallax: true,
      enableAnimations: true,
    );
  }

  /// Enables `UiKitView` rendering on iOS.
  final bool useNativeGlass;

  /// Blur sigma cap used to protect performance on constrained devices.
  final double maxBlurSigma;

  /// Enables parallax-capable interactions when supported by widgets.
  final bool enableParallax;

  /// Enables motion for Aurora components globally.
  final bool enableAnimations;

  /// Reads theme from context or returns system fallback.
  static AuroraTheme of(BuildContext context) {
    return Theme.of(context).extension<AuroraTheme>() ?? AuroraTheme.system();
  }

  @override
  AuroraTheme copyWith({
    bool? useNativeGlass,
    double? maxBlurSigma,
    bool? enableParallax,
    bool? enableAnimations,
  }) {
    return AuroraTheme(
      useNativeGlass: useNativeGlass ?? this.useNativeGlass,
      maxBlurSigma: maxBlurSigma ?? this.maxBlurSigma,
      enableParallax: enableParallax ?? this.enableParallax,
      enableAnimations: enableAnimations ?? this.enableAnimations,
    );
  }

  @override
  AuroraTheme lerp(ThemeExtension<AuroraTheme>? other, double t) {
    if (other is! AuroraTheme) {
      return this;
    }
    return AuroraTheme(
      useNativeGlass: t < 0.5 ? useNativeGlass : other.useNativeGlass,
      maxBlurSigma:
          lerpDouble(maxBlurSigma, other.maxBlurSigma, t) ?? maxBlurSigma,
      enableParallax: t < 0.5 ? enableParallax : other.enableParallax,
      enableAnimations: t < 0.5 ? enableAnimations : other.enableAnimations,
    );
  }
}
