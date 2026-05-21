import 'package:aurora_ui/aurora_ui.dart';
import 'package:flutter/material.dart';

class ComponentsScreen extends StatefulWidget {
  const ComponentsScreen({super.key});

  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
  int _tab = 0;
  double _slider = 0.35;
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 24),
      children: <Widget>[
        AuroraCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const AuroraText(
                'Aurora Buttons',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: <Widget>[
                  AuroraButton(label: 'Default', onPressed: () {}),
                  AuroraButton.icon(icon: Icons.favorite, onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const AuroraTextField(hintText: 'Type on glass...'),
        const SizedBox(height: 12),
        const AuroraSearchBar(),
        const SizedBox(height: 12),
        AuroraSlider(
          value: _slider,
          onChanged: (double value) => setState(() => _slider = value),
        ),
        const SizedBox(height: 12),
        AuroraProgressBar(value: _slider),
        const SizedBox(height: 12),
        AuroraSwitch(
          value: _enabled,
          label: 'Enable option',
          onChanged: (bool value) => setState(() => _enabled = value),
        ),
        const SizedBox(height: 12),
        AuroraTabBar(
          items: const <AuroraTabItem>[
            AuroraTabItem(icon: Icons.home, label: 'Home'),
            AuroraTabItem(icon: Icons.search, label: 'Search'),
            AuroraTabItem(icon: Icons.person, label: 'Profile'),
          ],
          currentIndex: _tab,
          onTap: (int index) => setState(() => _tab = index),
        ),
      ],
    );
  }
}
