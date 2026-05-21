import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.children,
    required this.onToggleTheme,
  });

  final List<Widget> children;
  final VoidCallback onToggleTheme;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.children[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onToggleTheme,
        child: const Icon(Icons.brightness_6),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (int value) => setState(() => _index = value),
        destinations: const <NavigationDestination>[
          NavigationDestination(icon: Icon(Icons.layers), label: 'Materials'),
          NavigationDestination(icon: Icon(Icons.widgets), label: 'Components'),
        ],
      ),
    );
  }
}
