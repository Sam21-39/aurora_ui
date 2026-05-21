import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';

/// Popup menu item model.
class AuroraMenuItem<T> {
  /// Creates a menu item.
  const AuroraMenuItem({required this.value, required this.label, this.icon});

  /// Selected value.
  final T value;

  /// Item label.
  final String label;

  /// Optional icon.
  final IconData? icon;
}

/// Glass-styled context menu trigger.
class AuroraMenu<T> extends StatelessWidget {
  /// Creates an Aurora menu.
  const AuroraMenu({
    super.key,
    required this.items,
    required this.child,
    this.onSelected,
    this.material = AuroraMaterial.regular,
  });

  /// Menu items.
  final List<AuroraMenuItem<T>> items;

  /// Trigger widget.
  final Widget child;

  /// Selection callback.
  final ValueChanged<T>? onSelected;

  /// Material style.
  final AuroraMaterial material;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        return items
            .map((AuroraMenuItem<T> item) {
              return PopupMenuItem<T>(
                value: item.value,
                child: AuroraContainer(
                  material: material,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Row(
                    children: <Widget>[
                      if (item.icon != null) ...<Widget>[
                        Icon(item.icon, size: 16),
                        const SizedBox(width: 8),
                      ],
                      Text(item.label),
                    ],
                  ),
                ),
              );
            })
            .toList(growable: false);
      },
      child: child,
    );
  }
}
