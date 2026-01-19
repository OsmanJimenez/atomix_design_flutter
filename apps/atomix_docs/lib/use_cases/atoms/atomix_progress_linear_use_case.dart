import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

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

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            AtomixColors.primary,
            AtomixColors.success,
            AtomixColors.warning,
            AtomixColors.error,
            AtomixColors.info,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  String colorName(Color? c) {
    if (c == AtomixColors.primary) return 'AtomixColors.primary';
    if (c == AtomixColors.success) return 'AtomixColors.success';
    if (c == AtomixColors.error) return 'AtomixColors.error';
    if (c == AtomixColors.warning) return 'AtomixColors.warning';
    if (c == AtomixColors.info) return 'AtomixColors.info';
    return 'null';
  }

  final colorStr = foundationColor != null
      ? '\n  color: ${colorName(foundationColor)},'
      : '';

  final code =
      '''AtomixProgressLinear(
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
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixProgressLinear(value: 0.9, color: AtomixColors.error, height: 12),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixProgressLinear(
  value: 0.9,
  color: AtomixColors.error,
)''',
        ),
      ],
    ),
  );
}
