import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';
import '../primitives/aurora_icon.dart';
import '../primitives/aurora_text.dart';

/// Aurora button visual variants.
enum AuroraButtonVariant {
  /// Tinted filled glass button.
  filled,

  /// Transparent outlined button.
  outlined,

  /// Plain text-like button.
  plain,
}

/// Glass button with iOS-inspired styling.
class AuroraButton extends StatelessWidget {
  /// Creates a text button.
  const AuroraButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AuroraButtonVariant.filled,
    this.material = AuroraMaterial.regular,
    this.leading,
    this.icon,
    this.size,
  });

  /// Creates an icon-only button.
  const AuroraButton.icon({
    super.key,
    required this.icon,
    this.onPressed,
    this.variant = AuroraButtonVariant.filled,
    this.material = AuroraMaterial.regular,
    this.size = 20,
  })  : label = null,
        leading = null;

  /// Text label.
  final String? label;

  /// Icon for icon-only buttons.
  final IconData? icon;

  /// Tap callback.
  final VoidCallback? onPressed;

  /// Visual variant.
  final AuroraButtonVariant variant;

  /// Glass material for container variants.
  final AuroraMaterial material;

  /// Optional leading icon in text mode.
  final IconData? leading;

  /// Icon size for icon mode.
  final double? size;

  @override
  Widget build(BuildContext context) {
    final bool enabled = onPressed != null;

    Widget content;
    if (icon != null) {
      content = Center(child: AuroraIcon(icon!, size: size));
    } else {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (leading != null) ...<Widget>[
            AuroraIcon(leading!, size: 16),
            const SizedBox(width: 8),
          ],
          AuroraText(
            label ?? '',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      );
    }

    Widget button;
    switch (variant) {
      case AuroraButtonVariant.plain:
        button = TextButton(onPressed: onPressed, child: content);
      case AuroraButtonVariant.outlined:
        button = AuroraContainer(
          material: material,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: content,
        );
      case AuroraButtonVariant.filled:
        button = AuroraContainer(
          material: material,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: content,
        );
    }

    if (variant == AuroraButtonVariant.plain) {
      return Opacity(opacity: enabled ? 1 : 0.5, child: button);
    }

    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: GestureDetector(onTap: onPressed, child: button),
    );
  }
}
