import 'package:flutter/animation.dart';

/// Preconfigured animation curves and durations for Aurora components.
class AuroraAnimation {
  /// Standard iOS-like duration.
  static const Duration standardDuration = Duration(milliseconds: 320);

  /// Fast transition duration.
  static const Duration fastDuration = Duration(milliseconds: 180);

  /// Spring-like default animation curve.
  static const Curve systemDefault = Curves.easeOutCubic;

  /// Gentle entry curve.
  static const Curve appear = Curves.easeOutQuart;

  /// Dismiss curve.
  static const Curve dismiss = Curves.easeInCubic;
}
