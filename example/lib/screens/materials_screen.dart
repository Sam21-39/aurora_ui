import 'package:aurora_ui/aurora_ui.dart';
import 'package:flutter/material.dart';

class MaterialsScreen extends StatelessWidget {
  const MaterialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<AuroraMaterial> materials = <AuroraMaterial>[
      AuroraMaterial.ultraThin,
      AuroraMaterial.thin,
      AuroraMaterial.regular,
      AuroraMaterial.thick,
      AuroraMaterial.ultraThick,
      AuroraMaterial.light,
      AuroraMaterial.dark,
      AuroraMaterial.chromeMaterial,
      AuroraMaterial.liquidGlass,
    ];

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 24),
      itemBuilder: (_, int i) {
        final AuroraMaterial material = materials[i];
        return AuroraCard(
          material: material,
          child: Row(
            children: <Widget>[
              const Icon(Icons.blur_on),
              const SizedBox(width: 12),
              Expanded(
                child: AuroraText(
                  material.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemCount: materials.length,
    );
  }
}
