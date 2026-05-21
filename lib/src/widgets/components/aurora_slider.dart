import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';

/// Glass-backed slider.
class AuroraSlider extends StatelessWidget {
  /// Creates an Aurora slider.
  const AuroraSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 1,
    this.material = AuroraMaterial.regular,
  });

  /// Current value.
  final double value;

  /// Change callback.
  final ValueChanged<double>? onChanged;

  /// Minimum value.
  final double min;

  /// Maximum value.
  final double max;

  /// Material style.
  final AuroraMaterial material;

  @override
  Widget build(BuildContext context) {
    return AuroraContainer(
      material: material,
      borderRadius: BorderRadius.circular(14),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Slider(value: value, onChanged: onChanged, min: min, max: max),
    );
  }
}
