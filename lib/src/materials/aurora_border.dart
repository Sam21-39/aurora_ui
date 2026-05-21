import 'package:flutter/widgets.dart';

import 'aurora_material.dart';

/// Glass edge border tuned for translucent surfaces.
class AuroraBorder {
  /// Creates a configurable Aurora border.
  const AuroraBorder({
    required this.width,
    required this.colorLight,
    required this.colorDark,
  });

  /// Border line width.
  final double width;

  /// Border color in light mode.
  final Color colorLight;

  /// Border color in dark mode.
  final Color colorDark;

  /// Returns a default border tuned for the selected material.
  static AuroraBorder fromMaterial(AuroraMaterial material) {
    switch (material) {
      case AuroraMaterial.ultraThin:
      case AuroraMaterial.thin:
        return const AuroraBorder(
          width: 0.5,
          colorLight: Color(0x99FFFFFF),
          colorDark: Color(0x50FFFFFF),
        );
      case AuroraMaterial.ultraThick:
      case AuroraMaterial.chromeMaterial:
      case AuroraMaterial.titleBar:
        return const AuroraBorder(
          width: 0.5,
          colorLight: Color(0x80FFFFFF),
          colorDark: Color(0x44FFFFFF),
        );
      default:
        return const AuroraBorder(
          width: 0.5,
          colorLight: Color(0x80FFFFFF),
          colorDark: Color(0x40FFFFFF),
        );
    }
  }

  /// Converts to Flutter border using ambient brightness.
  Border toBoxBorder(Brightness brightness) {
    final Color color = brightness == Brightness.dark ? colorDark : colorLight;
    return Border.all(color: color, width: width);
  }
}
