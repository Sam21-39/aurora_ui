import 'package:flutter/material.dart';

import '../../materials/aurora_material.dart';
import '../primitives/aurora_container.dart';

/// Glass-styled alert dialog content.
class AuroraAlert extends StatelessWidget {
  /// Creates an Aurora alert.
  const AuroraAlert({
    super.key,
    required this.title,
    required this.message,
    this.actions = const <Widget>[],
    this.material = AuroraMaterial.thick,
  });

  /// Title content.
  final Widget title;

  /// Message body.
  final Widget message;

  /// Action widgets.
  final List<Widget> actions;

  /// Material style.
  final AuroraMaterial material;

  @override
  Widget build(BuildContext context) {
    return AuroraContainer(
      material: material,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DefaultTextStyle.merge(
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
            child: title,
          ),
          const SizedBox(height: 8),
          DefaultTextStyle.merge(
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
            child: message,
          ),
          if (actions.isNotEmpty) ...<Widget>[
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: actions),
          ],
        ],
      ),
    );
  }
}

/// Shows an Aurora-styled alert dialog.
Future<T?> showAuroraAlert<T>({
  required BuildContext context,
  required Widget title,
  required Widget message,
  List<Widget> actions = const <Widget>[],
  AuroraMaterial material = AuroraMaterial.thick,
}) {
  return showDialog<T>(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: AuroraAlert(
        title: title,
        message: message,
        actions: actions,
        material: material,
      ),
    ),
  );
}
