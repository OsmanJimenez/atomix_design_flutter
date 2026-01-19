import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

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

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Color',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            AtomixColors.primary,
            AtomixColors.secondary,
            AtomixColors.textSecondary,
            AtomixColors.border,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  final code =
      '''AtomixDivider(
  height: $height,
  thickness: $thickness,
  indent: $indent,
  endIndent: $endIndent,
  color: ${useFoundationColor ? '...' : 'null'},
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text('Text Above'),
          AtomixDivider(
            height: height,
            thickness: thickness,
            indent: indent,
            endIndent: endIndent,
            color: foundationColor,
          ),
          const Text('Text Below'),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
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
