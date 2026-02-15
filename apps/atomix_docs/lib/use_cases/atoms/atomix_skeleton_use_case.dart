import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

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

  final animate = context.knobs.boolean(
    label: 'Skeleton > Animate',
    initialValue: true,
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
            theme.colors.border,
            theme.colors.primary,
            theme.colors.textDisabled,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.border) return 'Border';
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.textDisabled) return 'Text Disabled';
            return 'Custom';
          },
        )
      : null;

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      BorderRadius.all(theme.radius.xs),
      BorderRadius.all(theme.radius.sm),
      BorderRadius.all(theme.radius.md),
      BorderRadius.all(theme.radius.lg),
      BorderRadius.zero,
    ],
    initialOption: BorderRadius.all(theme.radius.sm),
    labelBuilder: (r) {
      if (r == BorderRadius.all(theme.radius.xs)) return 'XS';
      if (r == BorderRadius.all(theme.radius.sm)) return 'SM';
      if (r == BorderRadius.all(theme.radius.md)) return 'MD';
      if (r == BorderRadius.all(theme.radius.lg)) return 'LG';
      return 'Zero';
    },
  );

  String colorName(Color? c) {
    if (c == theme.colors.primary) return 'theme.colors.primary';
    if (c == theme.colors.border) return 'theme.colors.border';
    if (c == theme.colors.textDisabled) return 'theme.colors.textDisabled';
    return 'null';
  }

  String radiusName(BorderRadius r) {
    if (r == BorderRadius.all(theme.radius.xs))
      return 'BorderRadius.all(theme.radius.xs)';
    if (r == BorderRadius.all(theme.radius.sm))
      return 'BorderRadius.all(theme.radius.sm)';
    if (r == BorderRadius.all(theme.radius.md))
      return 'BorderRadius.all(theme.radius.md)';
    if (r == BorderRadius.all(theme.radius.lg))
      return 'BorderRadius.all(theme.radius.lg)';
    return 'BorderRadius.zero';
  }

  final colorStr = foundationColor != null
      ? '\n  color: ${colorName(foundationColor)},'
      : '';
  final radiusStr =
      (!isCircle && foundationRadius != BorderRadius.all(theme.radius.sm))
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''final theme = AtomixTheme.of(context);
  width: ${isCircle ? height : width},
  height: $height,
  isCircle: $isCircle,
  animate: $animate,$colorStr$radiusStr
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
            animate: animate,
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
