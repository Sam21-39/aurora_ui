import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import '../materials/aurora_border.dart';
import '../materials/aurora_material.dart';
import 'aurora_render_strategy.dart';

/// iOS native strategy using `UIVisualEffectView` via `UiKitView`.
class NativeGlassStrategy implements AuroraRenderStrategy {
  /// Creates a const strategy.
  const NativeGlassStrategy();

  static const String _viewType = 'aurora_ui/visual_effect_view';

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

    return ClipRRect(
      borderRadius: borderRadius,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: shadows,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            UiKitView(
              viewType: _viewType,
              creationParams: <String, Object>{
                'style': material.uiBlurEffectStyle,
              },
              creationParamsCodec: const StandardMessageCodec(),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: border.toBoxBorder(brightness),
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
