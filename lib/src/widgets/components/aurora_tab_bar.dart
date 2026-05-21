import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';
import '../primitives/aurora_icon.dart';
import '../primitives/aurora_text.dart';

/// Data model for tab bar items.
class AuroraTabItem {
  /// Creates a tab item.
  const AuroraTabItem({required this.icon, required this.label});

  /// Tab icon.
  final IconData icon;

  /// Tab label.
  final String label;
}

/// Frosted bottom tab bar.
class AuroraTabBar extends StatelessWidget {
  /// Creates an Aurora tab bar.
  const AuroraTabBar({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onTap,
    this.material = AuroraMaterial.chromeMaterial,
  });

  /// Items to display.
  final List<AuroraTabItem> items;

  /// Selected index.
  final int currentIndex;

  /// Tap callback.
  final ValueChanged<int>? onTap;

  /// Material style.
  final AuroraMaterial material;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: AuroraContainer(
        material: material,
        borderRadius: BorderRadius.zero,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: List<Widget>.generate(items.length, (int index) {
            final AuroraTabItem item = items[index];
            final bool selected = index == currentIndex;
            return Expanded(
              child: GestureDetector(
                onTap: onTap == null ? null : () => onTap!(index),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 180),
                  opacity: selected ? 1 : 0.7,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        AuroraIcon(item.icon, size: 20),
                        const SizedBox(height: 2),
                        AuroraText(
                          item.label,
                          style: const TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
