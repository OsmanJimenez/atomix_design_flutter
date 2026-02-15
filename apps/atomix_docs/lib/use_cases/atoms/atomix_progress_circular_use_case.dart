import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Progress/Circular',
  type: AtomixProgressCircular,
)
Widget progressCircularPlayground(BuildContext context) {
  final value = context.knobs.double.slider(
    label: 'Progress > Value',
    min: 0,
    max: 1,
    initialValue: 0.7,
  );

  final isIndeterminate = context.knobs.boolean(
    label: 'Progress > Is Indeterminate',
    initialValue: false,
  );

  final size = context.knobs.double.slider(
    label: 'Progress > Size',
    min: 16,
    max: 120,
    initialValue: 40,
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
AtomixProgressCircular(
  value: ${isIndeterminate ? 'null' : value.toStringAsFixed(2)},
  size: $size,$colorStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixProgressCircular(
            value: isIndeterminate ? null : value,
            size: size,
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
  path: '[Atoms]/Progress/Circular',
  type: AtomixProgressCircular,
)
Widget progressCircularIndeterminate(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixProgressCircular(value: null, size: 48),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixProgressCircular(
  value: null,
  size: 48,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Determinate Success',
  path: '[Atoms]/Progress/Circular',
  type: AtomixProgressCircular,
)
Widget progressCircularDeterminateSuccess(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixProgressCircular(
          value: 1.0,
          color: AtomixTheme.of(context).colors.success,
          size: 48,
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
AtomixProgressCircular(
  value: 1.0,
  color: theme.colors.success,
)''',
        ),
      ],
    ),
  );
}
