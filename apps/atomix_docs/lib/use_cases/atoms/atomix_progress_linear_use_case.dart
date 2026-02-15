import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Progress/Linear',
  type: AtomixProgressLinear,
)
Widget progressLinearPlayground(BuildContext context) {
  final value = context.knobs.double.slider(
    label: 'Progress > Value',
    min: 0,
    max: 1,
    initialValue: 0.45,
  );

  final isIndeterminate = context.knobs.boolean(
    label: 'Progress > Is Indeterminate',
    initialValue: false,
  );

  final height = context.knobs.double.slider(
    label: 'Progress > Height',
    min: 2,
    max: 32,
    initialValue: 8,
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
            theme.colors.success,
            theme.colors.warning,
            theme.colors.error,
            theme.colors.info,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.success) return 'Success';
            if (c == theme.colors.warning) return 'Warning';
            if (c == theme.colors.error) return 'Error';
            if (c == theme.colors.info) return 'Info';
            return 'Custom';
          },
        )
      : null;

  String colorName(Color? c) {
    if (c == theme.colors.primary) return 'theme.colors.primary';
    if (c == theme.colors.success) return 'theme.colors.success';
    if (c == theme.colors.error) return 'theme.colors.error';
    if (c == theme.colors.warning) return 'theme.colors.warning';
    if (c == theme.colors.info) return 'theme.colors.info';
    return 'null';
  }

  final colorStr = foundationColor != null
      ? '\n  color: ${colorName(foundationColor)},'
      : '';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixProgressLinear(
  value: ${isIndeterminate ? 'null' : value.toStringAsFixed(2)},
  height: $height,$colorStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixProgressLinear(
            value: isIndeterminate ? null : value,
            height: height,
            color: foundationColor,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Indeterminate',
  path: '[Atoms]/Progress/Linear',
  type: AtomixProgressLinear,
)
Widget progressLinearIndeterminate(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixProgressLinear(value: null, height: 8),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixProgressLinear(
  value: null,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Determinate Error',
  path: '[Atoms]/Progress/Linear',
  type: AtomixProgressLinear,
)
Widget progressLinearDeterminateError(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixProgressLinear(
          value: 0.9,
          color: AtomixTheme.of(context).colors.error,
          height: 12,
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
AtomixProgressLinear(
  value: 0.9,
  color: theme.colors.error,
)''',
        ),
      ],
    ),
  );
}
