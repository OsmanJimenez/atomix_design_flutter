# Atomix Design System for Flutter 🚀

[![pub package](https://img.shields.io/pub/v/atomix_design_flutter.svg)](https://pub.dev/packages/atomix_design_flutter)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.16.0-blue.svg)](https://flutter.dev)
[![Atomic Design](https://img.shields.io/badge/Design-Atomic-orange.svg)](https://atomicdesign.bradfrost.com/)
[![Style](https://img.shields.io/badge/Style-Material_3-blue.svg)](https://m3.material.io/)

A world-class, enterprise-ready **Design System for Flutter** engineered with **Atomic Design** principles. Atomix provides a sophisticated library of **101 handcrafted components** and a revolutionary **Multi-Strategy Theming System**.

> **v1.0.0 Stable Release**: Built for developers who demand consistency, performance, and aesthetic excellence.

---

## 🏗️ Architecture & Directory Structure

Atomix follows a strict **Atomic Design** hierarchy to manage complexity at scale. The project is structured as a monorepo containing the core package and the documentation app.

```text
atomix_design_flutter/
├── apps/
│   └── atomix_docs/               # Widgetbook Documentation App
├── packages/
│   └── atomix_design_flutter/     # Core Design System Package
│       ├── lib/
│       │   ├── src/
│       │   │   ├── foundation/    # Design tokens (Colors, Typography, Spacing, Radius)
│       │   │   ├── theme/         # Multi-strategy theme engine (Material, Glass, Expressive)
│       │   │   ├── atoms/         # Primitives (45 components - Icons, Badges, Text)
│       │   │   ├── molecules/     # Functional groups (30 components - Buttons, Inputs)
│       │   │   ├── organisms/     # Complex modules (20 components - Cards, Forms, Menus)
│       │   │   └── templates/     # Page scaffolds (6 components - Dashboards, Auth)
│       │   └── atomix_design_flutter.dart
│       └── test/                  # Comprehensive test suite
└── README.md
```

### The Atomic Layers
1. **Foundation**: The sub-atomic particles. Definitions for colors, typography, spacing (4px grid), and motion.
2. **Atoms**: Indivisible UI elements. If you break them, they lose meaning (e.g., an Icon or a Label).
3. **Molecules**: Groups of atoms working together (e.g., a TextField with a Label and an Error message).
4. **Organisms**: Complex, distinct sections of an interface (e.g., a Navigation Bar or a Data Table).
5. **Templates**: Page-level layouts that define the content structure (e.g., a Dashboard Grid or Login Screen).

---

## ✨ Key Features

- **101 Handcrafted Components**: A massive library covering every UI need from basic text to full admin dashboards.
- **Multi-Identity Theming**: Instantly swap between **Material 3**, **Apple Glass**, and **Expressive** aesthetics.
- **Native Dark Mode**: Best-in-class dark mode support for all strategies, auto-switching with system settings.
- **Precision Tokens**: Centralized control over:
    - **Colors**: Semantic palettes (Primary, Secondary, Success, Error).
    - **Spacing**: Strict 4px grid system (`xs` to `xxl`).
    - **Typography**: Hierarchical text styles (`Display`, `Headline`, `Body`).
    - **Radius**: Consistent shape system.
- **Developer Experience**: Interactive **Widgetbook** with real-time playgrounds and copy-paste code snippets.
- **Performance**: Optimized for 120fps rendering with `const` constructors and efficient build cycles.

---

## 📦 Installation

Add the package to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  atomix_design_flutter: ^1.0.0
```

Then install it by running:

```bash
flutter pub get
```

---

## 🚀 Quick Start Guide

### 1. Initialize the Theme
Wrap your application with `AtomixTheme` to inject the design tokens.

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
      title: 'Atomix App',
      // Default Strategy: Material 3
      theme: AtomixTheme.light(),
      darkTheme: AtomixTheme.dark(),
      themeMode: ThemeMode.system, 
      home: const HomePage(),
    );
  }
}
```

### 2. Using Components
Build your UI using Atomix components instead of raw Flutter widgets.

```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AtomixAppBar(title: 'Dashboard'),
      body: Padding(
        padding: const EdgeInsets.all(AtomixSpacing.md),
        child: Column(
          children: [
            const AtomixHeading.h1('Welcome Back'),
            const AtomixSpacer.lg(),
            AtomixCard(
              child: AtomixButton(
                label: 'Get Started',
                onPressed: () {},
                variant: AtomixButtonVariant.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 🎨 Advanced Theming Strategies

Atomix allows you to change the entire look and feel of your app by swapping the **Theme Strategy**.

### 🔷 Materialize (Default)
The gold standard for enterprise applications. Follows pure Material Design 3 guidelines.
- **Usage**: `AtomixTheme.light()`
- **Vibe**: Clean, familiar, professional.

### 🧊 Apple Glass
A premium aesthetic inspired by iOS. Features heavy usage of background blurs, translucency, and rounded geometry.
- **Usage**:
  ```dart
  theme: AtomixTheme.strategy(AtomixThemeGlass(brightness: Brightness.light))
  ```
- **Vibe**: Futuristic, premium, depth-aware.

### 🎨 Design Expressive
A bold, high-contrast theme for brand-heavy applications. Uses vibrant colors and sharper shapes.
- **Usage**:
  ```dart
  theme: AtomixTheme.strategy(AtomixThemeExpressive(brightness: Brightness.light))
  ```
- **Vibe**: Energetic, loud, unique.

---

## 📚 Complete Component Catalog (101 Components)

### ⚛️ Atoms (45)
*Base building blocks.*

| Component | Description | Component | Description |
| :--- | :--- | :--- | :--- |
| `AtomixActionIcon` | IconButton wrapper | `AtomixAvatar` | User images |
| `AtomixBackdrop` | Blur overlay | `AtomixBadge` | Status markers |
| `AtomixBreadcrumbItem`| Path segment | `AtomixBullet` | List marker |
| `AtomixCaption` | Helper text | `AtomixCheckbox` | Selection box |
| `AtomixCircle` | Round container | `AtomixColorBox` | Color preview |
| `AtomixCornerIndicator`| Corner badge | `AtomixCounter` | Numeric count |
| `AtomixDataPoint` | Label-Value pair | `AtomixDivider` | Line separator |
| `AtomixDot` | Status dot | `AtomixFade` | Animation |
| `AtomixGradient` | Gradient box | `AtomixHandle` | Drag handle |
| `AtomixHeading` | Title text | `AtomixIcon` | Vector icon |
| `AtomixIndicator` | State pill | `AtomixKey` | Keyboard key |
| `AtomixLabel` | Form label | `AtomixLink` | Nav link |
| `AtomixMask` | clipper | `AtomixOverlay` | Floating layer |
| `AtomixOverline` | Header label | `AtomixPlaceholder` | Loading block |
| `AtomixPriceText` | Currency text | `AtomixProgressCircular`| Circle loader |
| `AtomixProgressLinear` | Bar loader | `AtomixPulse` | Pulse animation |
| `AtomixRadio` | Radio button | `AtomixScrollbar` | Scrollbar |
| `AtomixShimmer` | Skeleton load | `AtomixSkeleton` | Structural load |
| `AtomixSpacer` | Layout space | `AtomixStepIndicator`| Wizard step |
| `AtomixStroke` | Border box | `AtomixSwitch` | Toggle |
| `AtomixTabIndicator` | Tab marker | `AtomixTag` | Category tag |
| `AtomixText` | Body text | `AtomixThumbnail` | Image preview |
| `AtomixTooltip` | Popup help | | |

### 🧬 Molecules (30)
*Functional groups.*

| Component | Description | Component | Description |
| :--- | :--- | :--- | :--- |
| `AtomixAlert` | Feedback banner | `AtomixAvatarGroup` | Stacked users |
| `AtomixBreadcrumb` | Path nav | `AtomixButton` | Action button |
| `AtomixButtonGroup` | Action stack | `AtomixCheckboxGroup`| Multi-select |
| `AtomixChip` | Filter tag | `AtomixChipGroup` | Filter set |
| `AtomixCodeBlock` | Syntax code | `AtomixColorPicker` | Color grid |
| `AtomixDatePicker` | Calendar | `AtomixDropdown` | Select menu |
| `AtomixEmptyState` | No data view | `AtomixExpansionTile`| Collapsible |
| `AtomixListTile` | List row | `AtomixMenuItem` | Menu action |
| `AtomixPagination` | Page nav | `AtomixProgressBar` | Tracked load |
| `AtomixRadioGroup` | Single select | `AtomixRating` | Star review |
| `AtomixSearchField` | Search input | `AtomixSlider` | Value track |
| `AtomixStatCard` | KPI metric | `AtomixStepper` | Workflow |
| `AtomixTabs` | Tab bar | `AtomixTextField` | Input field |
| `AtomixTextFormField` | Form input | `AtomixTimelineItem` | History row |
| `AtomixToast` | SnackBar | `AtomixUserProfile` | User card |

### 🫁 Organisms (20)
*Complex modules.*

| Component | Description | Component | Description |
| :--- | :--- | :--- | :--- |
| `AtomixActivityFeed` | Event stream | `AtomixAppBar` | Top bar |
| `AtomixBottomNav` | Mobile nav | `AtomixBottomSheet` | Modal sheet |
| `AtomixCalendar` | Full calendar | `AtomixCard` | Content box |
| `AtomixCarousel` | Image slider | `AtomixComments` | Chat thread |
| `AtomixDataTable` | Data grid | `AtomixDialog` | Modal alert |
| `AtomixFileUploader` | File drop | `AtomixFooter` | Page footer |
| `AtomixForm` | Logic form | `AtomixHeader` | Site header |
| `AtomixHero` | Marketing banner | `AtomixPricingCard` | Price plan |
| `AtomixProductCard` | Shop item | `AtomixSettingsList` | Config list |
| `AtomixSideMenu` | Nav rail | `AtomixWizard` | Multi-step |

### 🖼️ Templates (6)
*Page layouts.*
- **Auth**: Login / Register / Forgot Password.
- **Dashboard**: Admin panel with sidebar and grid.
- **Landing**: Product marketing homepage.
- **List**: Searchable collection view.
- **Detail**: Single item inspection view.
- **Settings**: User preference configuration.

---

## 🛠️ Developer Experience (DX)

### Widgetbook Documentation
We provide a full-featured documentation app.
1. `cd apps/atomix_docs`
2. `flutter run -d chrome`

Features:
- **Playground**: Tweak knobs to see changes instantly.
- **Snippets**: Copy code directly to your clipboard.
- **Dark Mode**: Test components in all themes.

---

## 🤝 Contributing & Governance

### Contributing
We welcome contributions! Please follow these steps:
1. Fork the repo.
2. Create a standardized component in the correct atomic folder.
3. Add a Widgetbook use case.
4. Submit a PR with screenshots.

### License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

### Support
For questions and support, please open an issue in the repository.


---
**Atomix Design System v1.0.0** — *Architecture for the ambitious.*
