import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

import 'package:atomix_design_flutter/src/theme/strategies/atomix_theme_strategy.dart';
import 'package:atomix_design_flutter/src/theme/strategies/atomix_theme_materialize.dart';
import 'package:atomix_design_flutter/src/theme/strategies/atomix_theme_glass.dart';
import 'package:atomix_design_flutter/src/theme/strategies/atomix_theme_expressive.dart';

// Import the generated directories file
import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        // Theme addon for light/dark mode switching
        // Theme addon for switching between Atomix Theme Strategies and Brightness
        ThemeAddon<AtomixThemeStrategy>(
          themes: [
            WidgetbookTheme(
              name: 'Materialize Light',
              data: const AtomixThemeMaterialize(brightness: Brightness.light),
            ),
            WidgetbookTheme(
              name: 'Materialize Dark',
              data: const AtomixThemeMaterialize(brightness: Brightness.dark),
            ),
            WidgetbookTheme(
              name: 'Apple Glass Light',
              data: const AtomixThemeGlass(brightness: Brightness.light),
            ),
            WidgetbookTheme(
              name: 'Apple Glass Dark',
              data: const AtomixThemeGlass(brightness: Brightness.dark),
            ),
            WidgetbookTheme(
              name: 'Expressive Light',
              data: const AtomixThemeExpressive(brightness: Brightness.light),
            ),
            WidgetbookTheme(
              name: 'Expressive Dark',
              data: const AtomixThemeExpressive(brightness: Brightness.dark),
            ),
          ],
          initialTheme: const WidgetbookTheme(
            name: 'Materialize Light',
            data: AtomixThemeMaterialize(brightness: Brightness.light),
          ),
          themeBuilder: (context, theme, child) {
            return AtomixTheme(strategy: theme, child: child);
          },
        ),
        // Device frame addon
        DeviceFrameAddon(
          devices: [Devices.ios.iPhone13, Devices.android.samsungGalaxyS20],
        ),
        // Text scale addon
        TextScaleAddon(scales: [1.0, 1.5, 2.0]),
        // Inspector addon - shows widget tree and properties
        InspectorAddon(),
        // Grid addon - overlay grid for alignment
        GridAddon(),
        // Alignment addon - shows alignment guides
        AlignmentAddon(),
      ],
    );
  }
}
