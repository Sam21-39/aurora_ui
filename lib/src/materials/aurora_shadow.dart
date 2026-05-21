import 'package:flutter/widgets.dart';

import 'aurora_material.dart';

/// Shadows for glass elevation.
class AuroraShadow {
  /// Returns a shadow stack tuned for the given material.
  static List<BoxShadow> fromMaterial(AuroraMaterial material) {
    final double intensity = switch (material) {
      AuroraMaterial.ultraThin => 0.8,
      AuroraMaterial.thin => 0.9,
      AuroraMaterial.regular => 1.0,
      AuroraMaterial.thick => 1.1,
      AuroraMaterial.ultraThick => 1.2,
      AuroraMaterial.dark => 1.05,
      AuroraMaterial.light => 0.95,
      AuroraMaterial.chromeMaterial => 1.1,
      AuroraMaterial.titleBar => 0.7,
      AuroraMaterial.liquidGlass => 1.0,
    };

    return <BoxShadow>[
      BoxShadow(
        color: const Color(0x33000000).withValues(alpha: 0.08 * intensity),
        blurRadius: 16,
        spreadRadius: 0,
        offset: const Offset(0, 4),
      ),
      BoxShadow(
        color: const Color(0x22000000).withValues(alpha: 0.05 * intensity),
        blurRadius: 4,
        spreadRadius: 0,
        offset: const Offset(0, 1),
      ),
    ];
  }
}
