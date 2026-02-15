# Atomix Design Flutter (Package) 🚀

[![pub package](https://img.shields.io/pub/v/atomix_design_flutter.svg)](https://pub.dev/packages/atomix_design_flutter)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.16.0-blue.svg)](https://flutter.dev)

A modern, high-performance **Design System for Flutter** built with **Atomic Design** principles. This package provides the core implementation of **101 components** and the **Multi-Strategy Theming Engine**.

---

## 📦 Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  atomix_design_flutter: ^1.0.0
```

Install:

```bash
flutter pub get
```

---

## 🏗️ Core Architecture

This package is structured to promote scalability and reusability.

| Layer | Path | Description |
| :--- | :--- | :--- |
| **Foundation** | `src/foundation` | Tokens for Color, Spacing, Typography, Radius. |
| **Theme** | `src/theme` | Strategies for Material, Glass, and Expressive. |
| **Atoms** | `src/atoms` | 45 Primitives (Icon, Badge, Text). |
| **Molecules** | `src/molecules` | 30 Functional groups (Button, Input). |
| **Organisms** | `src/organisms` | 20 Complex modules (Card, Form). |
| **Templates** | `src/templates` | 6 Page layouts (Dashboard, Auth). |

---

## 🚀 Quick Usage

### Basic Material 3 App
```dart
import 'package:flutter/material.dart';
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      theme: AtomixTheme.light(), // Uses Material 3 defaults
      home: Scaffold(
        body: Center(
          child: AtomixButton(
            label: 'Hello World',
            onPressed: () {},
            variant: AtomixButtonVariant.primary,
          ),
        ),
      ),
    ),
  );
}
```

### Apple-Style Glass Theme
```dart
MaterialApp(
  theme: AtomixTheme.strategy(AtomixThemeGlass(brightness: Brightness.light)),
  home: MyGlassApp(),
);
```

---

## 📚 Component Catalog

### Atoms (45)
`ActionIcon`, `Avatar`, `Backdrop`, `Badge`, `BreadcrumbItem`, `Bullet`, `Caption`, `Checkbox`, `Circle`, `ColorBox`, `CornerIndicator`, `Counter`, `DataPoint`, `Divider`, `Dot`, `Fade`, `Gradient`, `Handle`, `Heading`, `Icon`, `Indicator`, `Key`, `Label`, `Link`, `Mask`, `Overlay`, `Overline`, `Placeholder`, `PriceText`, `ProgressCircular`, `ProgressLinear`, `Pulse`, `Radio`, `Scrollbar`, `Shimmer`, `Skeleton`, `Spacer`, `StepIndicator`, `Stroke`, `Switch`, `TabIndicator`, `Tag`, `Text`, `Thumbnail`, `Tooltip`.

### Molecules (30)
`Alert`, `AvatarGroup`, `Breadcrumb`, `Button`, `ButtonGroup`, `CheckboxGroup`, `Chip`, `ChipGroup`, `CodeBlock`, `ColorPicker`, `DatePicker`, `Dropdown`, `EmptyState`, `ExpansionTile`, `ListTile`, `MenuItem`, `Pagination`, `ProgressBar`, `RadioGroup`, `Rating`, `SearchField`, `Slider`, `StatCard`, `Stepper`, `Tabs`, `TextField`, `TextFormField`, `TimelineItem`, `Toast`, `UserProfile`.

### Organisms (20)
`ActivityFeed`, `AppBar`, `BottomNavigation`, `BottomSheet`, `Calendar`, `Card`, `Carousel`, `CommentsSection`, `DataTable`, `Dialog`, `FileUploader`, `Footer`, `Form`, `Header`, `Hero`, `PricingCard`, `ProductCard`, `SettingsList`, `SideMenu`, `Wizard`.

### Templates (6)
`AuthTemplate`, `DashboardTemplate`, `DetailTemplate`, `LandingTemplate`, `ListTemplate`, `SettingsTemplate`.

---

## 📖 Live Documentation
For interactive demos and API details, visit the **[Atomix Widgetbook](https://osmanjimenez.github.io/atomix_design_flutter/)**.

## 📄 License
MIT License.

## 👤 Author
**Osman Armando Jimenez Cortes**
- GitHub: [@OsmanJimenez](https://github.com/OsmanJimenez)
