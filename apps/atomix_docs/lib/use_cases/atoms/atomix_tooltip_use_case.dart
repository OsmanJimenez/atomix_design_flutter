import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Tooltip',
  type: AtomixTooltip,
)
Widget tooltipPlayground(BuildContext context) {
  final message = context.knobs.string(
    label: 'Tooltip > Message',
    initialValue: 'This is a helpful hint',
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
            AtomixColors.secondary,
            AtomixColors.info,
            AtomixColors.success,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      AtomixRadius.xsBorderRadius,
      AtomixRadius.smBorderRadius,
      AtomixRadius.mdBorderRadius,
      BorderRadius.zero,
    ],
    initialOption: AtomixRadius.xsBorderRadius,
    labelBuilder: KnobHelpers.radiusLabel,
  );

  String colorName(Color? c) {
    if (c == AtomixColors.primary) return 'AtomixColors.primary';
    if (c == AtomixColors.secondary) return 'AtomixColors.secondary';
    if (c == AtomixColors.info) return 'AtomixColors.info';
    if (c == AtomixColors.success) return 'AtomixColors.success';
    return 'null';
  }

  String radiusName(BorderRadius r) {
    if (r == AtomixRadius.xsBorderRadius) return 'AtomixRadius.xsBorderRadius';
    if (r == AtomixRadius.smBorderRadius) return 'AtomixRadius.smBorderRadius';
    if (r == AtomixRadius.mdBorderRadius) return 'AtomixRadius.mdBorderRadius';
    return 'BorderRadius.zero';
  }

  final colorStr = foundationColor != null
      ? '\n  backgroundColor: ${colorName(foundationColor)},'
      : '';
  final radiusStr = foundationRadius != AtomixRadius.xsBorderRadius
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''AtomixTooltip(
  message: '$message',$colorStr$radiusStr
  child: Icon(Icons.help_outline),
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixTooltip(
            message: message,
            backgroundColor: foundationColor,
            borderRadius: foundationRadius,
            child: const Icon(Icons.help_outline, size: 48),
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Default Long Press',
  path: '[Atoms]/Tooltip',
  type: AtomixTooltip,
)
Widget tooltipDefault(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixTooltip(
          message: 'Default tooltip',
          child: AtomixBadge(label: 'Long Press Me'),
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixTooltip(
  message: 'Default tooltip',
  child: AtomixBadge(label: 'Long Press Me'),
)''',
        ),
      ],
    ),
  );
}
