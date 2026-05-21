import 'package:flutter/material.dart';

import '../../materials/aurora_vibrancy.dart';

/// Icon wrapper with vibrancy-aware color defaults.
class AuroraIcon extends StatelessWidget {
  /// Creates an Aurora icon.
  const AuroraIcon(
    this.icon, {
    super.key,
    this.vibrancy = AuroraVibrancy.label,
    this.size,
    this.color,
  });

  /// Icon data.
  final IconData icon;

  /// Vibrancy style when `color` is not provided.
  final AuroraVibrancy vibrancy;

  /// Icon size.
  final double? size;

  /// Optional color override.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color ?? AuroraVibrancyResolver.resolve(context, vibrancy),
    );
  }
}
