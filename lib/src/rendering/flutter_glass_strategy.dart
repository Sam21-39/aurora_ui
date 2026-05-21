import 'dart:ui';

import 'package:flutter/material.dart';

import '../materials/aurora_border.dart';
import '../materials/aurora_material.dart';
import '../theme/aurora_theme.dart';
import 'aurora_render_strategy.dart';

/// Flutter fallback strategy using BackdropFilter.
class FlutterGlassStrategy implements AuroraRenderStrategy {
  /// Creates a const strategy.
  const FlutterGlassStrategy();

  @override
  Widget buildContainer({
    required BuildContext context,
    required AuroraMaterial material,
    required BorderRadius borderRadius,
    required AuroraBorder border,
    required List<BoxShadow> shadows,
    required Widget child,
  }) {
    final Brightness brightness = Theme.of(context).brightness;
    final AuroraMaterialSpec spec = material.spec;
    final AuroraTheme theme = AuroraTheme.of(context);

    if (AuroraRenderStrategy.reduceTransparency(context)) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: AuroraRenderStrategy.solidFallback(context, material),
          borderRadius: borderRadius,
          border: border.toBoxBorder(brightness),
          boxShadow: shadows,
        ),
        child: child,
      );
    }

    final double sigma = spec.blurRadius
        .clamp(0, theme.maxBlurSigma)
        .toDouble();

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigma,
          sigmaY: sigma,
          tileMode: TileMode.clamp,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: spec.buildGradient(brightness),
            borderRadius: borderRadius,
            border: border.toBoxBorder(brightness),
            boxShadow: shadows,
          ),
          child: child,
        ),
      ),
    );
  }
}
