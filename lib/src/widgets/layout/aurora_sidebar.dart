import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';

/// Glass sidebar container for desktop/tablet layouts.
class AuroraSidebar extends StatelessWidget {
  /// Creates an Aurora sidebar.
  const AuroraSidebar({
    super.key,
    required this.child,
    this.width = 280,
    this.material = AuroraMaterial.titleBar,
  });

  /// Sidebar content.
  final Widget child;

  /// Sidebar width.
  final double width;

  /// Material style.
  final AuroraMaterial material;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: AuroraContainer(
        material: material,
        borderRadius: BorderRadius.zero,
        padding: const EdgeInsets.all(12),
        child: child,
      ),
    );
  }
}
