import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(name: 'Playground', path: '[Atoms]/Dot', type: AtomixDot)
Widget dotPlayground(BuildContext context) {
  final size = context.knobs.double.slider(
    label: 'Dot > Size',
    min: 4,
    max: 64,
    initialValue: 12,
  );

  final isPulsing = context.knobs.boolean(
    label: 'Dot > Is Pulsing',
    initialValue: true,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Color',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            AtomixColors.success,
            AtomixColors.error,
            AtomixColors.warning,
            AtomixColors.primary,
            AtomixColors.info,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : AtomixColors.primary;

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      BorderRadius.zero,
      AtomixRadius.xsBorderRadius,
      AtomixRadius.smBorderRadius,
      BorderRadius.circular(size),
    ],
    initialOption: BorderRadius.circular(12),
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

  String radiusName(BorderRadius? r) {
    if (r == AtomixRadius.xsBorderRadius) return 'AtomixRadius.xsBorderRadius';
    if (r == AtomixRadius.smBorderRadius) return 'AtomixRadius.smBorderRadius';
    if (r == BorderRadius.zero) return 'BorderRadius.zero';
    return 'BorderRadius.circular($size)';
  }

  final colorStr = useFoundationColor
      ? '\n  color: ${colorName(foundationColor)},'
      : '';
  final radiusStr = foundationRadius != BorderRadius.circular(size)
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''AtomixDot(
  size: $size,
  isPulsing: $isPulsing,$colorStr$radiusStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixDot(
            size: size,
            color: foundationColor,
            isPulsing: isPulsing,
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
  name: 'Pulsing Success',
  path: '[Atoms]/Dot',
  type: AtomixDot,
)
Widget dotPulsingSuccess(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixDot(size: 16, color: AtomixColors.success, isPulsing: true),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixDot(
  size: 16,
  color: AtomixColors.success,
  isPulsing: true,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Error Static', path: '[Atoms]/Dot', type: AtomixDot)
Widget dotErrorStatic(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixDot(size: 12, color: AtomixColors.error),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixDot(
  size: 12,
  color: AtomixColors.error,
)''',
        ),
      ],
    ),
  );
}
