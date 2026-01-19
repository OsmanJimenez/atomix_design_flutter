import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Shimmer',
  type: AtomixShimmer,
)
Widget shimmerPlayground(BuildContext context) {
  final isActive = context.knobs.boolean(
    label: 'Shimmer > Is Active',
    initialValue: true,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Color',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Base Color',
          options: [
            AtomixColors.border,
            AtomixColors.primary,
            AtomixColors.secondary,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  String colorName(Color? c) {
    if (c == AtomixColors.primary) return 'AtomixColors.primary';
    if (c == AtomixColors.secondary) return 'AtomixColors.secondary';
    if (c == AtomixColors.border) return 'AtomixColors.border';
    return 'null';
  }

  final colorStr = foundationColor != null
      ? '\n  baseColor: ${colorName(foundationColor)},'
      : '';

  final code =
      '''AtomixShimmer(
  isActive: $isActive,$colorStr
  child: AtomixSkeleton(width: 200, height: 100),
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixShimmer(
            isActive: isActive,
            baseColor: foundationColor,
            child: const AtomixSkeleton(width: 200, height: 100),
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'List Item Placeholder',
  path: '[Atoms]/Shimmer',
  type: AtomixShimmer,
)
Widget shimmerList(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixShimmer(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AtomixSkeleton(width: 50, height: 50, isCircle: true),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AtomixSkeleton(width: 150, height: 12),
                  SizedBox(height: 8),
                  AtomixSkeleton(width: 100, height: 10),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 32),
        CodeSnippet(
          code: '''AtomixShimmer(
  child: Row(
    children: [
      AtomixSkeleton(width: 50, height: 50, isCircle: true),
      SizedBox(width: 16),
      Column(
        children: [
          AtomixSkeleton(width: 150, height: 12),
          AtomixSkeleton(width: 100, height: 10),
        ],
      ),
    ],
  ),
)''',
        ),
      ],
    ),
  );
}
