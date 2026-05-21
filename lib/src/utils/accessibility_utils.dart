import 'package:flutter/material.dart';

/// Accessibility helpers for motion/transparency behavior.
class AccessibilityUtils {
  /// Returns true when motion should be reduced.
  static bool disableAnimations(BuildContext context) {
    final MediaQueryData? mediaQuery = MediaQuery.maybeOf(context);
    if (mediaQuery == null) {
      return false;
    }
    return mediaQuery.disableAnimations;
  }

  /// Returns true when transparency should be reduced.
  static bool reduceTransparency(BuildContext context) {
    final MediaQueryData? mediaQuery = MediaQuery.maybeOf(context);
    if (mediaQuery == null) {
      return false;
    }
    // Flutter does not currently expose an explicit reduce-transparency flag.
    // High-contrast mode is the closest cross-platform accessibility signal.
    return mediaQuery.highContrast;
  }
}
