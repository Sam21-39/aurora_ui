import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';

/// Glass-backed progress indicator.
class AuroraProgressBar extends StatelessWidget {
  /// Creates an Aurora progress bar.
  const AuroraProgressBar({
    super.key,
    this.value,
    this.material = AuroraMaterial.regular,
    this.minHeight = 8,
  });

  /// Progress value from 0 to 1. `null` for indeterminate.
  final double? value;

  /// Material style.
  final AuroraMaterial material;

  /// Progress bar height.
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    return AuroraContainer(
      material: material,
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: LinearProgressIndicator(
          value: value,
          minHeight: minHeight,
          backgroundColor: Theme.of(context).dividerColor,
        ),
      ),
    );
  }
}
