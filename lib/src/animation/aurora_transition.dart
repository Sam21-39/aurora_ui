import 'package:flutter/material.dart';

import 'aurora_animation.dart';

/// Utility transitions matching Aurora motion defaults.
class AuroraTransition {
  /// Creates a route with fade + slight upward translation.
  static PageRoute<T> cupertinoGlass<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: AuroraAnimation.standardDuration,
      reverseTransitionDuration: AuroraAnimation.fastDuration,
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        final CurvedAnimation curved = CurvedAnimation(
          parent: animation,
          curve: AuroraAnimation.appear,
          reverseCurve: AuroraAnimation.dismiss,
        );
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.02),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          ),
        );
      },
    );
  }
}
