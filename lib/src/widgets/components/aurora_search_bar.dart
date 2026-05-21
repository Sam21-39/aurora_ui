import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';

/// Frosted search bar.
class AuroraSearchBar extends StatelessWidget {
  /// Creates an Aurora search bar.
  const AuroraSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText = 'Search',
    this.material = AuroraMaterial.regular,
  });

  /// Text controller.
  final TextEditingController? controller;

  /// Text change callback.
  final ValueChanged<String>? onChanged;

  /// Placeholder text.
  final String hintText;

  /// Material style.
  final AuroraMaterial material;

  @override
  Widget build(BuildContext context) {
    return AuroraContainer(
      material: material,
      borderRadius: BorderRadius.circular(14),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: const Icon(Icons.search),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
