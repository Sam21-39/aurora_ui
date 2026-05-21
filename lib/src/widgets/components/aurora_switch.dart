import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';

/// Glass-backed switch tile.
class AuroraSwitch extends StatelessWidget {
  /// Creates an Aurora switch row.
  const AuroraSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.material = AuroraMaterial.regular,
  });

  /// Switch value.
  final bool value;

  /// Change callback.
  final ValueChanged<bool>? onChanged;

  /// Optional label.
  final String? label;

  /// Material style.
  final AuroraMaterial material;

  @override
  Widget build(BuildContext context) {
    return AuroraContainer(
      material: material,
      borderRadius: BorderRadius.circular(14),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: <Widget>[
          if (label != null) ...<Widget>[Expanded(child: Text(label!))],
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
