import 'package:flutter/material.dart';

import '../../materials/aurora_vibrancy.dart';

/// Text with vibrancy-aware color defaults for glass surfaces.
class AuroraText extends StatelessWidget {
  /// Creates vibrant Aurora text.
  const AuroraText(
    this.data, {
    super.key,
    this.vibrancy = AuroraVibrancy.label,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });

  /// Text content.
  final String data;

  /// Vibrancy style token.
  final AuroraVibrancy vibrancy;

  /// Optional style override.
  final TextStyle? style;

  /// Optional max lines.
  final int? maxLines;

  /// Optional overflow behavior.
  final TextOverflow? overflow;

  /// Optional text align.
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final Color color = AuroraVibrancyResolver.resolve(context, vibrancy);
    return Text(
      data,
      style: (style ?? DefaultTextStyle.of(context).style).copyWith(
        color: color,
      ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
