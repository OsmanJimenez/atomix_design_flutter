import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

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
      '''AtomixProgressCircular(
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
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixProgressCircular(
          value: 1.0,
          color: AtomixColors.success,
          size: 48,
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixProgressCircular(
  value: 1.0,
  color: AtomixColors.success,
)''',
        ),
      ],
    ),
  );
}
