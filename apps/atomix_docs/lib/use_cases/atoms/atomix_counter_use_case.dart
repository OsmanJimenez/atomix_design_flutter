import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Counter',
  type: AtomixCounter,
)
Widget counterPlayground(BuildContext context) {
  final count = context.knobs.int.slider(
    label: 'Counter > Count',
    min: 0,
    max: 150,
    initialValue: 12,
  );

  final maxCount = context.knobs.int.slider(
    label: 'Counter > Max Count',
    min: 10,
    max: 999,
    initialValue: 99,
  );

  final size = context.knobs.double.slider(
    label: 'Counter > Size',
    min: 16,
    max: 48,
    initialValue: 20,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Color',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Background',
          options: [
            AtomixColors.primary,
            AtomixColors.success,
            AtomixColors.error,
            AtomixColors.warning,
            AtomixColors.info,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      BorderRadius.zero,
      AtomixRadius.xsBorderRadius,
      AtomixRadius.smBorderRadius,
      AtomixRadius.mdBorderRadius,
      BorderRadius.circular(size),
    ],
    initialOption: BorderRadius.circular(20),
    labelBuilder: KnobHelpers.radiusLabel,
  );

  String colorName(Color? c) {
    if (c == AtomixColors.primary) return 'AtomixColors.primary';
    if (c == AtomixColors.success) return 'AtomixColors.success';
    if (c == AtomixColors.error) return 'AtomixColors.error';
    if (c == AtomixColors.warning) return 'AtomixColors.warning';
    if (c == AtomixColors.info) return 'AtomixColors.info';
    return 'null';
  }

  String radiusName(BorderRadius r) {
    if (r == AtomixRadius.xsBorderRadius) return 'AtomixRadius.xsBorderRadius';
    if (r == AtomixRadius.smBorderRadius) return 'AtomixRadius.smBorderRadius';
    if (r == AtomixRadius.mdBorderRadius) return 'AtomixRadius.mdBorderRadius';
    if (r == BorderRadius.zero) return 'BorderRadius.zero';
    return 'BorderRadius.circular($size)';
  }

  final colorStr = foundationColor != null
      ? '\n  backgroundColor: ${colorName(foundationColor)},'
      : '';
  final radiusStr = foundationRadius != BorderRadius.circular(size)
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''AtomixCounter(
  count: $count,
  maxCount: $maxCount,
  size: $size,$colorStr$radiusStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixCounter(
            count: count,
            maxCount: maxCount,
            size: size,
            backgroundColor: foundationColor,
            borderRadius: foundationRadius,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Small Count',
  path: '[Atoms]/Counter',
  type: AtomixCounter,
)
Widget counterSmall(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixCounter(count: 5),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixCounter(count: 5)'''),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Max Overflow',
  path: '[Atoms]/Counter',
  type: AtomixCounter,
)
Widget counterMax(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixCounter(count: 120, maxCount: 99),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixCounter(count: 120, maxCount: 99)'''),
      ],
    ),
  );
}
