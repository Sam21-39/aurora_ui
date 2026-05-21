import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';

/// A glass navigation bar matching iOS UINavigationBar intent.
class AuroraNavBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates an Aurora navigation bar.
  const AuroraNavBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.material = AuroraMaterial.chromeMaterial,
    this.large = false,
    this.height,
  });

  /// Title widget.
  final Widget title;

  /// Optional leading widget.
  final Widget? leading;

  /// Optional trailing actions.
  final List<Widget>? actions;

  /// Material style for nav bar.
  final AuroraMaterial material;

  /// Large title style.
  final bool large;

  /// Override height.
  final double? height;

  @override
  Size get preferredSize => Size.fromHeight(height ?? (large ? 96 : 64));

  @override
  Widget build(BuildContext context) {
    final double barHeight = preferredSize.height;
    return AuroraContainer(
      material: material,
      borderRadius: BorderRadius.zero,
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: MediaQuery.paddingOf(context).top + 8,
        bottom: 8,
      ),
      child: SizedBox(
        height: barHeight - MediaQuery.paddingOf(context).top - 16,
        child: Row(
          children: <Widget>[
            SizedBox(width: 40, child: leading),
            Expanded(
              child: DefaultTextStyle.merge(
                style: TextStyle(
                  fontSize: large ? 30 : 17,
                  fontWeight: large ? FontWeight.w700 : FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                child: title,
              ),
            ),
            SizedBox(
              width: 40,
              child: actions == null || actions!.isEmpty
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: actions!,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
