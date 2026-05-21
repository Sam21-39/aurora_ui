import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';

/// Lightweight popover container with glass styling.
class AuroraPopover extends StatelessWidget {
  /// Creates an Aurora popover.
  const AuroraPopover({
    super.key,
    required this.child,
    this.material = AuroraMaterial.regular,
    this.padding = const EdgeInsets.all(12),
  });

  /// Popover content.
  final Widget child;

  /// Material style.
  final AuroraMaterial material;

  /// Popover content padding.
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return AuroraContainer(
      material: material,
      borderRadius: BorderRadius.circular(14),
      padding: padding,
      child: child,
    );
  }
}
