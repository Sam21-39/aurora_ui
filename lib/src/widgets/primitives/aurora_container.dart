import 'package:flutter/material.dart';

import '../../animation/aurora_animation.dart';
import '../../materials/aurora_border.dart';
import '../../materials/aurora_material.dart';
import '../../materials/aurora_shadow.dart';
import '../../rendering/aurora_render_strategy.dart';
import '../../theme/aurora_theme.dart';
import '../../utils/accessibility_utils.dart';

/// The foundational Aurora glass surface.
class AuroraContainer extends StatelessWidget {
  /// Creates an Aurora glass container.
  const AuroraContainer({
    super.key,
    this.material = AuroraMaterial.regular,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.border,
    this.shadows,
    this.appearAnimation = true,
  });

  /// Semantic material level.
  final AuroraMaterial material;

  /// Corner radius.
  final BorderRadius borderRadius;

  /// Child content.
  final Widget child;

  /// Inner padding.
  final EdgeInsets padding;

  /// Optional border override.
  final AuroraBorder? border;

  /// Optional shadow override.
  final List<BoxShadow>? shadows;

  /// Enables initial appear animation.
  final bool appearAnimation;

  @override
  Widget build(BuildContext context) {
    final AuroraRenderStrategy strategy = AuroraRenderStrategy.of(context);
    final Widget built = strategy.buildContainer(
      context: context,
      material: material,
      borderRadius: borderRadius,
      border: border ?? AuroraBorder.fromMaterial(material),
      shadows: shadows ?? AuroraShadow.fromMaterial(material),
      child: Padding(padding: padding, child: child),
    );

    final AuroraTheme theme = AuroraTheme.of(context);
    final bool disableAnimations = AccessibilityUtils.disableAnimations(
      context,
    );

    if (!appearAnimation || !theme.enableAnimations || disableAnimations) {
      return built;
    }

    return TweenAnimationBuilder<double>(
      duration: AuroraAnimation.standardDuration,
      curve: AuroraAnimation.appear,
      tween: Tween<double>(begin: 0.96, end: 1),
      child: built,
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: Transform.scale(scale: value, child: child),
        );
      },
    );
  }
}
