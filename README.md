# aurora_ui

Premium iOS glass UI for Flutter.

`aurora_ui` brings semantic Apple-style materials, vibrancy-aware text, and a
component-first API to Flutter apps.

## Highlights

- Semantic materials: `ultraThin`, `thin`, `regular`, `thick`, `ultraThick`
- Vibrancy system for labels/fills/separators
- Platform-adaptive rendering:
  - iOS: native `UIVisualEffectView` via `UiKitView`
  - Android/others: optimized `BackdropFilter` fallback
- Accessibility support for reduced transparency and reduced motion
- Component library: card, button, nav bar, tab bar, sheet, alert, menu,
  search bar, text field, segmented control, slider, switch, progress bar,
  popover, sidebar

## Installation

```yaml
dependencies:
  aurora_ui: ^1.0.0
```

## Quick Start

```dart
import 'package:aurora_ui/aurora_ui.dart';
import 'package:flutter/material.dart';

MaterialApp(
  theme: ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      AuroraTheme.system(),
    ],
  ),
  home: Scaffold(
    appBar: const AuroraNavBar(title: Text('Aurora')),
    body: Center(
      child: AuroraCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            AuroraText('Settings', vibrancy: AuroraVibrancy.label),
            SizedBox(height: 8),
            AuroraText(
              'App version 1.0.0',
              vibrancy: AuroraVibrancy.secondaryLabel,
            ),
          ],
        ),
      ),
    ),
  ),
);
```

## iOS Native Glass

When `AuroraTheme.useNativeGlass` is enabled (default), iOS builds use native
`UIVisualEffectView` for true system blur materials.

## License

MIT
