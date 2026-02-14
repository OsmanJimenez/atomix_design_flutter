# Atomix Design System for Flutter

A modern, scalable Design System for Flutter built with **Atomic Design** principles and powered by **Material Design 3**. Atomix provides a comprehensive set of reusable components with consistent styling, theming, and documentation.

## ✨ Features

- 🎨 **Material 3 Foundation** - Built on top of Flutter's Material Design 3
- ⚛️ **Atomic Design Architecture** - Organized into Atoms, Molecules, and Organisms
- 🌓 **Light & Dark Themes** - Full support for both themes with seamless switching
- 📚 **Widgetbook Documentation** - Interactive component gallery with live examples
- 🎯 **Design Tokens** - Consistent colors, spacing, typography, and more
- 🧪 **Tested** - Includes smoke tests for core components
- 📦 **Monorepo Structure** - Package and documentation app in one repository

## 🏗️ Architecture

Atomix follows the **Atomic Design** methodology:

```
packages/atomix_design_flutter/
├── lib/
│   ├── src/
│   │   ├── foundation/      # Design tokens and theme
│   │   ├── atoms/           # Basic building blocks
│   │   ├── molecules/       # Simple component groups
│   │   └── organisms/       # Complex components
│   └── atomix_design_flutter.dart
```

### Foundation (Design Tokens)

- **AtomixColors** - Semantic color palette with light/dark variants
- **AtomixSpacing** - 4px-based spacing scale (4, 8, 12, 16, 20, 24, 32, 40)
- **AtomixRadius** - Border radius values (4, 8, 12, 16, 24)
- **AtomixElevation** - Material elevation scale (0-12)
- **AtomixTypography** - Complete text style system
- **AtomixTheme** - Light and dark theme configurations

### Atoms

Simple, single-purpose components:

- `AtomixText`, `AtomixIcon`, `AtomixDivider`, `AtomixSpacer`, `AtomixBadge`, `AtomixActionIcon`, `AtomixBackdrop`, `AtomixBullet`, `AtomixCaption`, `AtomixCircle`, `AtomixColorBox`, `AtomixCornerIndicator`, `AtomixDataPoint`, `AtomixFade`, `AtomixGradient`, `AtomixHandle`, `AtomixHeading`, `AtomixIndicator`, `AtomixKey`, `AtomixMask`, `AtomixOverline`, `AtomixPlaceholder`, `AtomixPulse`, `AtomixStepIndicator`, `AtomixStroke`.

### Molecules

Combinations of atoms forming functional components:

- `AtomixButton` - Buttons with variants (primary, secondary, tertiary), sizes, and states
- `AtomixTextField` - Simple text inputs
- `AtomixTextFormField` - Text inputs with native validation support
- `AtomixChip` - Chips with selection states
- `AtomixListTile` - List items with leading/trailing elements

### Organisms

Complex, feature-rich components:

- `AtomixAppBar` - Application bar with actions
- `AtomixCard` - Cards with variants (filled, outlined, elevated)
- `AtomixDialog` - Modal dialogs
- `AtomixBottomSheet` - Bottom sheets with drag handle
- `AtomixForm` - Flexible form layout and management

## 📦 Installation

### Using as a Local Package

Add to your `pubspec.yaml`:

```yaml
dependencies:
  atomix_design_flutter:
    path: ../packages/atomix_design_flutter
```

### Future: pub.dev (Coming Soon)

```yaml
dependencies:
  atomix_design_flutter: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

### 1. Apply the Theme

Wrap your app with Atomix themes:

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AtomixAppBar(
        title: 'Home',
      ),
      body: Padding(
        padding: const EdgeInsets.all(AtomixSpacing.md),
        child: Column(
          children: [
            AtomixCard(
              child: Padding(
                padding: const EdgeInsets.all(AtomixSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AtomixText(
                      'Welcome to Atomix',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const AtomixSpacer.md(),
                    const AtomixText('A modern design system for Flutter'),
                    const AtomixSpacer.lg(),
                    AtomixButton(
                      label: 'Get Started',
                      onPressed: () {},
                      icon: Icons.arrow_forward,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 📚 Documentation with Widgetbook

Atomix includes a comprehensive **Widgetbook** documentation app showcasing all components with interactive examples.

### Running Widgetbook

1. Navigate to the docs app:
   ```bash
   cd apps/atomix_docs
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Generate Widgetbook directories:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. Run the documentation app:
   ```bash
   flutter run
   ```

The Widgetbook app includes:
- 🎨 Theme switcher (Light/Dark)
- 📱 Device frame preview
- 🔍 Component search and navigation
- 📖 Use cases for all components with variants and states

## 🧪 Testing

Run tests for the design system:

```bash
cd packages/atomix_design_flutter
flutter test
```

Included tests:
- `AtomixTheme` - Theme creation and configuration
- `AtomixButton` - Button rendering and interactions
- `AtomixTextField` - Text field rendering and validation

## 🎨 Customization

### Custom Theme

Create a custom theme with your brand colors:

```dart
final customTheme = AtomixTheme.themeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  secondaryColor: Colors.orange,
);
```

### Using Design Tokens

Access design tokens directly:

```dart
Container(
  padding: const EdgeInsets.all(AtomixSpacing.lg),
  decoration: BoxDecoration(
    color: AtomixColors.primary,
    borderRadius: AtomixRadius.mdBorderRadius,
  ),
  child: const AtomixText('Custom Container'),
)
```

## 📁 Repository Structure

```
atomix_design_flutter/
├── packages/
│   └── atomix_design_flutter/     # Design system package
│       ├── lib/
│       │   ├── src/
│       │   │   ├── foundation/
│       │   │   ├── atoms/
│       │   │   ├── molecules/
│       │   │   └── organisms/
│       │   └── atomix_design_flutter.dart
│       ├── test/
│       └── pubspec.yaml
├── apps/
│   └── atomix_docs/               # Widgetbook documentation app
│       ├── lib/
│       │   ├── use_cases/
│       │   │   ├── atoms/
│       │   │   ├── molecules/
│       │   │   └── organisms/
│       │   └── main.dart
│       └── pubspec.yaml
├── LICENSE
└── README.md
```

## 🛠️ Development

### Adding New Components

1. Create the component in the appropriate directory (`atoms/`, `molecules/`, or `organisms/`)
2. Export it from `atomix_design_flutter.dart`
3. Create use cases in `apps/atomix_docs/lib/use_cases/`
4. Regenerate Widgetbook: `flutter pub run build_runner build -d`
5. Add tests in `test/`

### Design Principles

- **Consistency** - Use design tokens for all styling
- **Accessibility** - Follow Material Design accessibility guidelines
- **Simplicity** - Keep component APIs clean and minimal
- **Documentation** - Document all components with DartDoc and Widgetbook examples

## 📝 Component Overview

| Category | Component | Description |
|----------|-----------|-------------|
| **Foundation** | AtomixTheme | Theme configuration with light/dark modes |
| **Atoms** | AtomixText | Text with typography system |
| | AtomixIcon | Icons with consistent styling |
| | AtomixDivider | Visual separators |
| | AtomixSpacer | Spacing helpers |
| | AtomixBadge | Status badges with variants |
| | AtomixActionIcon | Clickable icons with tooltips |
| | AtomixBackdrop | Background overlays for modals |
| | AtomixBullet | Small indicators for lists |
| | AtomixCaption | Styled small descriptive text |
| | AtomixCircle | Circular container atom |
| | AtomixColorBox | Color preview component |
| | AtomixCornerIndicator | Anchored indicators for corners |
| | AtomixDataPoint | Label-value pair display |
| | AtomixFade | Entry fade-in animation |
| | AtomixGradient | Customizable gradient containers |
| | AtomixHandle | Drag handles for sheets/lists |
| | AtomixHeading | Standardized heading text |
| | AtomixIndicator | Multi-state pill indicators |
| | AtomixKey | Keyboard key representation |
| | AtomixMask | Shape-clipping container |
| | AtomixOverline | Styled all-caps labels |
| | AtomixPlaceholder | Content loading placeholders |
| | AtomixPulse | Visual pulsating animation |
| | AtomixStepIndicator | Progress step indicators |
| | AtomixStroke | Bordered container with child support |
| **Molecules** | AtomixButton | Buttons with variants and states |
| | AtomixTextField | Simple text inputs |
| | AtomixTextFormField | Text inputs with native validation |
| | AtomixChip | Selectable chips |
| | AtomixListTile | List items |
| **Organisms** | AtomixAppBar | Application bar |
| | AtomixCard | Cards with variants |
| | AtomixDialog | Modal dialogs |
| | AtomixBottomSheet | Bottom sheets |
| | AtomixForm | Flexible form layout and management |

## 🚀 Roadmap

- [ ] Add more organisms (Navigation, Forms, etc.)
- [ ] Implement templates for common layouts
- [ ] Add animation utilities
- [ ] Publish to pub.dev
- [ ] Add more comprehensive tests
- [ ] Create migration guides
- [ ] Add accessibility testing

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 💬 Support

For questions and support, please open an issue in the repository.

---

**Built with ❤️ using Flutter and Material Design 3**
