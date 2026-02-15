import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/ColorPicker',
  type: AtomixColorPicker,
)
Widget atomixColorPickerPlayground(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: _ColorPickerWrapper(),
    ),
  );
}

class _ColorPickerWrapper extends StatefulWidget {
  @override
  State<_ColorPickerWrapper> createState() => _ColorPickerWrapperState();
}

class _ColorPickerWrapperState extends State<_ColorPickerWrapper> {
  Color selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    final code = '''AtomixColorPicker(
  selectedColor: selectedColor,
  onColorChanged: (color) => setState(() => selectedColor = color),
)''';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AtomixColorPicker(
          selectedColor: selectedColor,
          onColorChanged: (color) {
            setState(() {
              selectedColor = color;
            });
          },
        ),
        const SizedBox(height: 24),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: selectedColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
        ),
        const SizedBox(height: 24),
        CodeSnippet(code: code),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Primary Colors',
  path: '[Molecules]/ColorPicker',
  type: AtomixColorPicker,
)
Widget atomixColorPickerPrimary(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: _ColorPickerPrimaryWrapper(),
    ),
  );
}

class _ColorPickerPrimaryWrapper extends StatefulWidget {
  const _ColorPickerPrimaryWrapper();

  @override
  State<_ColorPickerPrimaryWrapper> createState() =>
      _ColorPickerPrimaryWrapperState();
}

class _ColorPickerPrimaryWrapperState
    extends State<_ColorPickerPrimaryWrapper> {
  Color selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixColorPicker(
          selectedColor: selectedColor,
          onColorChanged: (color) => setState(() => selectedColor = color),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixColorPicker(
  selectedColor: selectedColor,
  onColorChanged: (color) => setState(() => selectedColor = color),
)''',
        ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Theme Color',
  path: '[Molecules]/ColorPicker',
  type: AtomixColorPicker,
)
Widget atomixColorPickerTheme(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: _ColorPickerThemeWrapper(),
    ),
  );
}

class _ColorPickerThemeWrapper extends StatefulWidget {
  const _ColorPickerThemeWrapper();

  @override
  State<_ColorPickerThemeWrapper> createState() =>
      _ColorPickerThemeWrapperState();
}

class _ColorPickerThemeWrapperState extends State<_ColorPickerThemeWrapper> {
  Color selectedColor = const Color(0xFF6200EE);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixColorPicker(
          selectedColor: selectedColor,
          onColorChanged: (color) => setState(() => selectedColor = color),
        ),
        const SizedBox(height: 24),
        Text(
          'Selected: #${selectedColor.value.toRadixString(16).substring(2).toUpperCase()}',
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixColorPicker(
  selectedColor: Color(0xFF6200EE),
  onColorChanged: (color) => setState(() => selectedColor = color),
)''',
        ),
      ],
    );
  }
}
