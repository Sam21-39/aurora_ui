import 'package:flutter/foundation.dart';

/// Platform utility helpers used across Aurora widgets.
class PlatformCheck {
  /// True if current platform is iOS and not web.
  static bool get isNativeIOS =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  /// True if running in a browser.
  static bool get isWeb => kIsWeb;
}
