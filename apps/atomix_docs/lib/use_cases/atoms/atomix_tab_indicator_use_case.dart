import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/TabIndicator',
  type: AtomixTabIndicator,
)
Widget tabIndicatorPlayground(BuildContext context) {
  final isActive = context.knobs.boolean(
    label: 'TabIndicator > Is Active',
    initialValue: true,
  );

  final height = context.knobs.double.slider(
    label: 'TabIndicator > Height',
    min: 1,
    max: 10,
    initialValue: 3,
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
            AtomixColors.info,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      BorderRadius.zero,
      BorderRadius.circular(height),
      BorderRadius.vertical(top: Radius.circular(height)),
    ],
    initialOption: BorderRadius.vertical(top: Radius.circular(3)),
    labelBuilder: KnobHelpers.radiusLabel,
  );

  String colorName(Color? c) {
    if (c == AtomixColors.primary) return 'AtomixColors.primary';
    if (c == AtomixColors.secondary) return 'AtomixColors.secondary';
    if (c == AtomixColors.success) return 'AtomixColors.success';
    if (c == AtomixColors.info) return 'AtomixColors.info';
    return 'null';
  }

  String radiusName(BorderRadius r) {
    if (r == BorderRadius.zero) return 'BorderRadius.zero';
    if (r.topLeft.x == r.bottomLeft.x) return 'BorderRadius.circular($height)';
    return 'BorderRadius.vertical(top: Radius.circular($height))';
  }

  final colorStr = foundationColor != null
      ? '\n  color: ${colorName(foundationColor)},'
      : '';
  final radiusStr =
      foundationRadius != BorderRadius.vertical(top: Radius.circular(height))
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''AtomixTabIndicator(
  isActive: $isActive,
  height: $height,$colorStr$radiusStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          SizedBox(
            width: 100,
            child: AtomixTabIndicator(
              isActive: isActive,
              height: height,
              color: foundationColor,
              borderRadius: foundationRadius,
            ),
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Active',
  path: '[Atoms]/TabIndicator',
  type: AtomixTabIndicator,
)
Widget tabIndicatorActive(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 100, child: AtomixTabIndicator(isActive: true)),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixTabIndicator(isActive: true)'''),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Success Variant',
  path: '[Atoms]/TabIndicator',
  type: AtomixTabIndicator,
)
Widget tabIndicatorSuccess(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: AtomixTabIndicator(
            isActive: true,
            color: AtomixColors.success,
            height: 4,
          ),
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixTabIndicator(
  isActive: true,
  color: AtomixColors.success,
  height: 4,
)''',
        ),
      ],
    ),
  );
}
