import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

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
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Atomix Light', data: AtomixTheme.light()),
            WidgetbookTheme(name: 'Atomix Dark', data: AtomixTheme.dark()),
          ],
        ),
        // Device frame addon
        DeviceFrameAddon(
          devices: [Devices.ios.iPhone13, Devices.android.samsungGalaxyS20],
        ),
        // Text scale addon
        TextScaleAddon(scales: [1.0, 1.5, 2.0]),
      ],
    );
  }
}
