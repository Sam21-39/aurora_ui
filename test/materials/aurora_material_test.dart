import 'package:aurora_ui/aurora_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('all materials provide a style and spec', () {
    for (final AuroraMaterial material in AuroraMaterial.values) {
      expect(material.uiBlurEffectStyle, isNotEmpty);
      expect(material.spec.blurRadius, greaterThan(0));
      expect(material.spec.saturation, greaterThan(0));
    }
  });
}
