# Atomix Design Flutter

[![pub package](https://img.shields.io/pub/v/atomix_design_flutter.svg)](https://pub.dev/packages/atomix_design_flutter)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A modern, scalable **Design System for Flutter** built with **Atomic Design** principles and powered by **Material Design 3**. Atomix provides a comprehensive set of reusable components with consistent styling, theming, and interactive documentation.

## ✨ Features

- 🎨 **Material 3 Foundation** - Built on top of Flutter's Material Design 3
- ⚛️ **Atomic Design Architecture** - Organized into Atoms, Molecules, and Organisms
- 🌓 **Light & Dark Themes** - Full support for both themes with seamless switching
- 🎯 **Design Tokens** - Consistent colors, spacing, typography, radius, and elevation
- 📦 **13 Components** - Production-ready, customizable components
- 🧪 **Tested** - Comprehensive test coverage
- 📚 **Well Documented** - Complete DartDoc for all public APIs

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  atomix_design_flutter: ^0.1.0
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

### 1. Apply the Theme

```dart
import 'package:flutter/material.dart';
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: AtomixTheme.light(),
      darkTheme: AtomixTheme.dark(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
```

### 2. Use Components

```dart
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

// Use design tokens
Container(
  padding: const EdgeInsets.all(AtomixSpacing.md),
  decoration: BoxDecoration(
    color: AtomixColors.primary,
    borderRadius: AtomixRadius.mdBorderRadius,
  ),
)

// Use components
AtomixButton(
  label: 'Click Me',
  onPressed: () {},
  variant: AtomixButtonVariant.primary,
)

AtomixTextField(
  label: 'Email',
  hint: 'Enter your email',
  prefixIcon: Icons.email,
)

AtomixCard(
  variant: AtomixCardVariant.elevated,
  child: Padding(
    padding: const EdgeInsets.all(AtomixSpacing.lg),
    child: Text('Card content'),
  ),
)
```

## 📚 Components

### Foundation (Design Tokens)
- `AtomixColors` - Semantic color palette
- `AtomixSpacing` - 4px-based spacing scale
- `AtomixRadius` - Border radius values
- `AtomixElevation` - Material elevation scale
- `AtomixTypography` - Text style system
- `AtomixTheme` - Light/dark theme configuration

### Atoms
- `AtomixText` - Text with typography
- `AtomixIcon` - Icon component
- `AtomixDivider` - Visual separator
- `AtomixSpacer` - Spacing helper
- `AtomixBadge` - Status badges

### Molecules
- `AtomixButton` - Buttons with variants and states
- `AtomixTextField` - Text input with validation
- `AtomixChip` - Selectable chips
- `AtomixListTile` - List items

### Organisms
- `AtomixAppBar` - Application bar
- `AtomixCard` - Cards with variants
- `AtomixDialog` - Modal dialogs
- `AtomixBottomSheet` - Bottom sheets

## 🎨 Customization

Create custom themes:

```dart
final customTheme = AtomixTheme.themeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  secondaryColor: Colors.orange,
);
```

## 📖 Documentation

For complete documentation, examples, and interactive component gallery:
- **[Interactive Widgetbook](https://osmanjimenez.github.io/atomix_design_flutter/)** - Live component demos
- **[API Documentation](https://pub.dev/documentation/atomix_design_flutter/latest/)** - Complete API reference
- **[GitHub Repository](https://github.com/OsmanJimenez/atomix_design_flutter)** - Source code and examples

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Osman Armando Jimenez Cortes**
- Email: osman98125@gmail.com
- GitHub: [@OsmanJimenez](https://github.com/OsmanJimenez)

## 🐛 Issues

Found a bug or have a feature request? Please open an issue on [GitHub](https://github.com/OsmanJimenez/atomix_design_flutter/issues).
