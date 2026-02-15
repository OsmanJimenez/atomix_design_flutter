import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

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

  final theme = AtomixTheme.of(context);

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            theme.colors.primary,
            theme.colors.secondary,
            theme.colors.success,
            theme.colors.warning,
            theme.colors.error,
            theme.colors.info,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.secondary) return 'Secondary';
            if (c == theme.colors.success) return 'Success';
            if (c == theme.colors.warning) return 'Warning';
            if (c == theme.colors.error) return 'Error';
            if (c == theme.colors.info) return 'Info';
            return 'Custom';
          },
        )
      : null;

  String colorName(Color? color) {
    if (color == theme.colors.primary) return 'theme.colors.primary';
    if (color == theme.colors.secondary) return 'theme.colors.secondary';
    if (color == theme.colors.success) return 'theme.colors.success';
    if (color == theme.colors.warning) return 'theme.colors.warning';
    if (color == theme.colors.error) return 'theme.colors.error';
    if (color == theme.colors.info) return 'theme.colors.info';
    return 'null';
  }

  final colorStr = foundationColor != null
      ? '\n  labelColor: ${colorName(foundationColor)},'
      : '';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixLabel(
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
