import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';

/// iOS-like segmented control on glass.
class AuroraSegmentedControl<T> extends StatelessWidget {
  /// Creates a segmented control.
  const AuroraSegmentedControl({
    super.key,
    required this.segments,
    required this.value,
    this.onValueChanged,
    this.material = AuroraMaterial.regular,
  });

  /// Segment map from value to display widget.
  final Map<T, Widget> segments;

  /// Current value.
  final T value;

  /// Value change callback.
  final ValueChanged<T>? onValueChanged;

  /// Material style.
  final AuroraMaterial material;

  @override
  Widget build(BuildContext context) {
    return AuroraContainer(
      material: material,
      borderRadius: BorderRadius.circular(10),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: segments.entries
            .map((MapEntry<T, Widget> entry) {
              final bool selected = entry.key == value;
              return Expanded(
                child: GestureDetector(
                  onTap: onValueChanged == null
                      ? null
                      : () => onValueChanged!(entry.key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    curve: Curves.easeOut,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: selected
                          ? Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.18)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: entry.value),
                  ),
                ),
              );
            })
            .toList(growable: false),
      ),
    );
  }
}
