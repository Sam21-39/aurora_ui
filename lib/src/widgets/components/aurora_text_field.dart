import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';

/// Frosted text input field.
class AuroraTextField extends StatelessWidget {
  /// Creates an Aurora text field.
  const AuroraTextField({
    super.key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.onChanged,
    this.obscureText = false,
    this.material = AuroraMaterial.regular,
  });

  /// Controller.
  final TextEditingController? controller;

  /// Placeholder text.
  final String? hintText;

  /// Keyboard type.
  final TextInputType? keyboardType;

  /// Text change callback.
  final ValueChanged<String>? onChanged;

  /// Obscure text.
  final bool obscureText;

  /// Material style.
  final AuroraMaterial material;

  @override
  Widget build(BuildContext context) {
    return AuroraContainer(
      material: material,
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
