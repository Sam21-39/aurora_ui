import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';

/// Sheet presentation sizes.
enum AuroraSheetDetent {
  /// Small detached sheet.
  small,

  /// Medium sheet.
  medium,

  /// Large sheet.
  large,

  /// Full-height sheet.
  full,
}

/// iOS-style bottom sheet with glass material.
class AuroraSheet extends StatelessWidget {
  /// Creates an Aurora sheet container.
  const AuroraSheet({
    super.key,
    required this.child,
    this.detent = AuroraSheetDetent.medium,
    this.showDragHandle = true,
    this.dismissible = true,
    this.material = AuroraMaterial.regular,
  });

  /// Content widget.
  final Widget child;

  /// Initial detent.
  final AuroraSheetDetent detent;

  /// Shows top drag indicator.
  final bool showDragHandle;

  /// Allows dismissal by gesture/tap outside.
  final bool dismissible;

  /// Material style.
  final AuroraMaterial material;

  @override
  Widget build(BuildContext context) {
    return AuroraContainer(
      material: material,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (showDragHandle)
            Container(
              width: 38,
              height: 5,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                color: Theme.of(context).dividerColor,
              ),
            ),
          child,
        ],
      ),
    );
  }
}

/// Presents an Aurora glass sheet.
Future<T?> showAuroraSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  AuroraSheetDetent detent = AuroraSheetDetent.medium,
  bool showDragHandle = true,
  bool dismissible = true,
  AuroraMaterial material = AuroraMaterial.regular,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isDismissible: dismissible,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black45,
    isScrollControlled: true,
    builder: (BuildContext context) {
      final double heightFactor = switch (detent) {
        AuroraSheetDetent.small => 0.3,
        AuroraSheetDetent.medium => 0.5,
        AuroraSheetDetent.large => 0.75,
        AuroraSheetDetent.full => 0.95,
      };
      return FractionallySizedBox(
        heightFactor: heightFactor,
        child: AuroraSheet(
          detent: detent,
          showDragHandle: showDragHandle,
          dismissible: dismissible,
          material: material,
          child: builder(context),
        ),
      );
    },
  );
}
