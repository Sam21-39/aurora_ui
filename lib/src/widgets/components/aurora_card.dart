import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';

/// Translucent card surface matching Aurora material depth.
class AuroraCard extends StatelessWidget {
  /// Creates an Aurora card.
  const AuroraCard({
    super.key,
    required this.child,
    this.material = AuroraMaterial.regular,
    this.onTap,
    this.animate = true,
    this.padding = const EdgeInsets.all(16),
  });

  /// Card content.
  final Widget child;

  /// Card material.
  final AuroraMaterial material;

  /// Optional tap callback.
  final VoidCallback? onTap;

  /// Enables appear animation.
  final bool animate;

  /// Content padding.
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final Widget container = AuroraContainer(
      material: material,
      padding: padding,
      appearAnimation: animate,
      child: child,
    );

    if (onTap == null) {
      return container;
    }

    return GestureDetector(onTap: onTap, child: container);
  }
}
