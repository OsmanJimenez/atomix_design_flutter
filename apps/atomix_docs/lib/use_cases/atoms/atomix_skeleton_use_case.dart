import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Skeleton',
  type: AtomixSkeleton,
)
Widget skeletonPlayground(BuildContext context) {
  final width = context.knobs.double.slider(
    label: 'Skeleton > Width',
    min: 20,
    max: 300,
    initialValue: 150,
  );

  final height = context.knobs.double.slider(
    label: 'Skeleton > Height',
    min: 10,
    max: 200,
    initialValue: 20,
  );

  final isCircle = context.knobs.boolean(
    label: 'Skeleton > Is Circle',
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
            AtomixColors.border,
            AtomixColors.primary,
            AtomixColors.textDisabled,
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
      AtomixRadius.lgBorderRadius,
      BorderRadius.zero,
    ],
    initialOption: AtomixRadius.smBorderRadius,
    labelBuilder: KnobHelpers.radiusLabel,
  );

  String colorName(Color? c) {
    if (c == AtomixColors.primary) return 'AtomixColors.primary';
    if (c == AtomixColors.border) return 'AtomixColors.border';
    if (c == AtomixColors.textDisabled) return 'AtomixColors.textDisabled';
    return 'null';
  }

  String radiusName(BorderRadius r) {
    if (r == AtomixRadius.xsBorderRadius) return 'AtomixRadius.xsBorderRadius';
    if (r == AtomixRadius.smBorderRadius) return 'AtomixRadius.smBorderRadius';
    if (r == AtomixRadius.mdBorderRadius) return 'AtomixRadius.mdBorderRadius';
    if (r == AtomixRadius.lgBorderRadius) return 'AtomixRadius.lgBorderRadius';
    return 'BorderRadius.zero';
  }

  final colorStr = foundationColor != null
      ? '\n  color: ${colorName(foundationColor)},'
      : '';
  final radiusStr =
      (!isCircle && foundationRadius != AtomixRadius.smBorderRadius)
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''AtomixSkeleton(
  width: ${isCircle ? height : width},
  height: $height,
  isCircle: $isCircle,$colorStr$radiusStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixSkeleton(
            width: isCircle ? height : width,
            height: height,
            isCircle: isCircle,
            color: foundationColor,
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
  name: 'Text Line',
  path: '[Atoms]/Skeleton',
  type: AtomixSkeleton,
)
Widget skeletonText(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixSkeleton(width: 200, height: 16),
        SizedBox(height: 24),
        CodeSnippet(code: 'AtomixSkeleton(width: 200, height: 16)'),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Avatar Place',
  path: '[Atoms]/Skeleton',
  type: AtomixSkeleton,
)
Widget skeletonAvatar(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixSkeleton(width: 80, height: 80, isCircle: true),
        SizedBox(height: 24),
        CodeSnippet(
          code: 'AtomixSkeleton(width: 80, height: 80, isCircle: true)',
        ),
      ],
    ),
  );
}
