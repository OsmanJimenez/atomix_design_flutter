import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Label',
  type: AtomixLabel,
)
Widget labelPlayground(BuildContext context) {
  final labelText = context.knobs.string(
    label: 'Label > Text',
    initialValue: 'Email Address',
  );

  final subLabel = context.knobs.string(
    label: 'Label > Sub Label',
    initialValue: 'We will never share your email.',
  );

  final isRequired = context.knobs.boolean(
    label: 'Label > Is Required',
    initialValue: true,
  );

  final isError = context.knobs.boolean(
    label: 'Label > Is Error',
    initialValue: false,
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
            AtomixColors.success,
            AtomixColors.warning,
            AtomixColors.error,
            AtomixColors.info,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  String colorName(Color? color) {
    if (color == AtomixColors.primary) return 'AtomixColors.primary';
    if (color == AtomixColors.secondary) return 'AtomixColors.secondary';
    if (color == AtomixColors.success) return 'AtomixColors.success';
    if (color == AtomixColors.warning) return 'AtomixColors.warning';
    if (color == AtomixColors.error) return 'AtomixColors.error';
    if (color == AtomixColors.info) return 'AtomixColors.info';
    return 'null';
  }

  final colorStr = foundationColor != null
      ? '\n  labelColor: ${colorName(foundationColor)},'
      : '';

  final code =
      '''AtomixLabel(
  label: '$labelText',
  subLabel: ${subLabel.isEmpty ? 'null' : "'$subLabel'"},
  isRequired: $isRequired,
  isError: $isError,$colorStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixLabel(
            label: labelText,
            subLabel: subLabel.isEmpty ? null : subLabel,
            isRequired: isRequired,
            isError: isError,
            labelColor: foundationColor,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Required', path: '[Atoms]/Label', type: AtomixLabel)
Widget labelRequired(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixLabel(label: 'Mandatory Field', isRequired: true),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixLabel(
  label: 'Mandatory Field',
  isRequired: true,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Sublabel',
  path: '[Atoms]/Label',
  type: AtomixLabel,
)
Widget labelWithSublabel(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixLabel(
          label: 'Password',
          subLabel: 'Must be at least 8 characters long.',
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixLabel(
  label: 'Password',
  subLabel: 'Must be at least 8 characters long.',
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Error', path: '[Atoms]/Label', type: AtomixLabel)
Widget labelError(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixLabel(
          label: 'Invalid Input',
          isError: true,
          subLabel: 'Please correct the error.',
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixLabel(
  label: 'Invalid Input',
  isError: true,
)''',
        ),
      ],
    ),
  );
}
