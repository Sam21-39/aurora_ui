import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../materials/aurora_border.dart';
import '../materials/aurora_material.dart';
import '../theme/aurora_theme.dart';
import '../utils/accessibility_utils.dart';
import 'flutter_glass_strategy.dart';
import 'native_glass_strategy.dart';

/// Platform-adaptive render strategy for Aurora glass surfaces.
abstract class AuroraRenderStrategy {
  /// Resolves the best strategy for the current context.
  factory AuroraRenderStrategy.of(BuildContext context) {
    final AuroraTheme theme = AuroraTheme.of(context);
    final bool canUseNative =
        !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
    if (canUseNative && theme.useNativeGlass) {
      return const NativeGlassStrategy();
    }
    return const FlutterGlassStrategy();
  }

  /// Builds a glass container using the underlying strategy implementation.
  Widget buildContainer({
    required BuildContext context,
    required AuroraMaterial material,
    required BorderRadius borderRadius,
    required AuroraBorder border,
    required List<BoxShadow> shadows,
    required Widget child,
  });

  /// Returns a solid background color when transparency must be reduced.
  static Color solidFallback(BuildContext context, AuroraMaterial material) {
    final Brightness brightness = Theme.of(context).brightness;
    return material.solidFallback(brightness);
  }

  /// True when platform/user settings request transparency reduction.
  static bool reduceTransparency(BuildContext context) {
    return AccessibilityUtils.reduceTransparency(context);
  }
}
