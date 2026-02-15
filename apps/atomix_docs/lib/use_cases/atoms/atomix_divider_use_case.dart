import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Divider',
  type: AtomixDivider,
)
Widget atomixDividerPlayground(BuildContext context) {
  final height = context.knobs.double.slider(
    label: 'Divider > Height',
    initialValue: 16,
    min: 1,
    max: 64,
  );

  final thickness = context.knobs.double.slider(
    label: 'Divider > Thickness',
    initialValue: 1,
    min: 1,
    max: 10,
  );

  final indent = context.knobs.double.slider(
    label: 'Divider > Indent',
    initialValue: 0,
    min: 0,
    max: 100,
  );

  final endIndent = context.knobs.double.slider(
    label: 'Divider > End Indent',
    initialValue: 0,
    min: 0,
    max: 100,
  );

  final labelText = context.knobs.string(
    label: 'Divider > Label',
    initialValue: 'OR',
  );

  final direction = context.knobs.list(
    label: 'Divider > Direction',
    options: [Axis.horizontal, Axis.vertical],
    initialOption: Axis.horizontal,
    labelBuilder: (axis) => axis == Axis.horizontal ? 'Horizontal' : 'Vertical',
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Color',
    initialValue: false,
  );

  final theme = AtomixTheme.of(context);

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            theme.colors.primary,
            theme.colors.secondary,
            theme.colors.textSecondary,
            theme.colors.border,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.secondary) return 'Secondary';
            if (c == theme.colors.textSecondary) return 'Text Secondary';
            if (c == theme.colors.border) return 'Border';
            return 'Custom';
          },
        )
      : null;

  String colorName(Color? c) {
    if (c == theme.colors.primary) return 'theme.colors.primary';
    if (c == theme.colors.secondary) return 'theme.colors.secondary';
    if (c == theme.colors.textSecondary) return 'theme.colors.textSecondary';
    if (c == theme.colors.border) return 'theme.colors.border';
    return 'null';
  }

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixDivider(
  height: $height,
  thickness: $thickness,
  indent: $indent,
  endIndent: $endIndent,
  color: ${useFoundationColor ? colorName(foundationColor) : 'null'},
  ${labelText.isNotEmpty ? "label: '$labelText'," : ""}
  direction: $direction,
)''';

  Widget buildDivider() {
    return AtomixDivider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: foundationColor,
      label: labelText.isNotEmpty ? labelText : null,
      direction: direction,
    );
  }

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: direction == Axis.horizontal
          ? Column(
              children: [
                const Text('Text Above'),
                buildDivider(),
                const Text('Text Below'),
                const SizedBox(height: 32),
                CodeSnippet(code: code),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Left'),
                SizedBox(
                  height: 200, // Fixed height for vertical demonstration
                  child: buildDivider(),
                ),
                const Text('Right'),
                const SizedBox(width: 32),
                Expanded(child: CodeSnippet(code: code)),
              ],
            ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Default',
  path: '[Atoms]/Divider',
  type: AtomixDivider,
)
Widget atomixDividerDefault(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Item 1'),
          AtomixDivider(),
          Text('Item 2'),
          SizedBox(height: 24),
          CodeSnippet(code: 'AtomixDivider()'),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Large Spacing',
  path: '[Atoms]/Divider',
  type: AtomixDivider,
)
Widget atomixDividerLarge(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Section A'),
          AtomixDivider(height: 48, thickness: 2),
          Text('Section B'),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixDivider(
  height: 48,
  thickness: 2,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Indent',
  path: '[Atoms]/Divider',
  type: AtomixDivider,
)
Widget atomixDividerIndent(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Indented Divider'),
          AtomixDivider(indent: 32, endIndent: 32),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixDivider(
  indent: 32,
  endIndent: 32,
)''',
          ),
        ],
      ),
    ),
  );
}
