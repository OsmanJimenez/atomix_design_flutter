import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(
  name: 'Installation & Guide',
  path: '[Introduction]',
  type: AtomixTheme,
)
Widget buildIntroduction(BuildContext context) {
  return const _IntroductionPage();
}

class _IntroductionPage extends StatelessWidget {
  const _IntroductionPage();

  static const String _markdownData = '''
# Atomix Design System

Welcome to **Atomix Design System**, a modern, atomic-based design system for Flutter.

## 🚀 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  atomix_design_flutter: ^0.0.1
```

Or run:

```bash
flutter pub add atomix_design_flutter
```

## 🛠️ Setup

Wrap your application with `AtomixTheme` to provide design tokens:

```dart
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

void main() {
  runApp(
    AtomixTheme(
      // Choose a strategy: Materialize, Glass, Expressive
      strategy: const AtomixThemeMaterialize(), 
      child: const MyApp(),
    ),
  );
}
```

## 🎨 Themes & Customization

Atomix supports multiple theme strategies and modes (Light/Dark).

- **Materialize:** Clean, standard Material Design inspired.
- **Apple Glass:** Glassmorphism effects and iOS-like aesthetics.
- **Expressive:** Vibrant colors and bold typography.

You can switch themes in this documentation using the **Theme Addon** in the sidebar.

## 🏗️ Architecture

This library follows the **Atomic Design** methodology:

1.  **Atoms:** Basic building blocks (Buttons, Inputs, Icons).
2.  **Molecules:** Groups of atoms (Form Fields, Search Bars).
3.  **Organisms:** Complex UI sections (Cards, Dialogs, AppBars).
4.  **Templates:** Page-level layouts (Dashboard, Auth, Error).

Explore the components in the sidebar to implementation details.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AtomixTheme.of(context).colors.surface,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(32),
          child: Markdown(
            data: _markdownData,
            selectable: true,
            styleSheet: MarkdownStyleSheet(
              h1: AtomixTheme.of(context).typography.displaySmall.copyWith(
                color: AtomixTheme.of(context).colors.textPrimary,
              ),
              h2: AtomixTheme.of(context).typography.headlineMedium.copyWith(
                color: AtomixTheme.of(context).colors.primary,
                height: 2.0,
              ),
              h3: AtomixTheme.of(context).typography.titleLarge.copyWith(
                color: AtomixTheme.of(context).colors.textSecondary,
                height: 1.5,
              ),
              p: AtomixTheme.of(context).typography.bodyLarge.copyWith(
                color: AtomixTheme.of(context).colors.textPrimary,
              ),
              code: TextStyle(
                backgroundColor: AtomixTheme.of(context).colors.surfaceVariant,
                color: AtomixTheme.of(context).colors.primary,
                fontFamily: 'monospace',
              ),
              codeblockDecoration: BoxDecoration(
                color: AtomixTheme.of(context).colors.surfaceVariant,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AtomixTheme.of(context).colors.border,
                ),
              ),
              blockquoteDecoration: BoxDecoration(
                color: AtomixTheme.of(
                  context,
                ).colors.surfaceVariant.withAlpha(50),
                borderRadius: BorderRadius.circular(4),
                border: Border(
                  left: BorderSide(
                    color: AtomixTheme.of(context).colors.primary,
                    width: 4,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
