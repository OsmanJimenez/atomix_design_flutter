import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

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

  final theme = AtomixTheme.of(context);

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            theme.colors.success,
            theme.colors.error,
            theme.colors.warning,
            theme.colors.primary,
            theme.colors.info,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.success) return 'Success';
            if (c == theme.colors.error) return 'Error';
            if (c == theme.colors.warning) return 'Warning';
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.info) return 'Info';
            return 'Custom';
          },
        )
      : theme.colors.primary;

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      BorderRadius.zero,
      BorderRadius.all(theme.radius.xs),
      BorderRadius.all(theme.radius.sm),
      BorderRadius.circular(size),
    ],
    initialOption: BorderRadius.circular(12),
    labelBuilder: (r) {
      if (r == BorderRadius.zero) return 'Zero';
      if (r == BorderRadius.all(theme.radius.xs)) return 'XS';
      if (r == BorderRadius.all(theme.radius.sm)) return 'SM';
      return 'Circular';
    },
  );

  String colorName(Color? c) {
    if (c == theme.colors.primary) return 'theme.colors.primary';
    if (c == theme.colors.success) return 'theme.colors.success';
    if (c == theme.colors.error) return 'theme.colors.error';
    if (c == theme.colors.warning) return 'theme.colors.warning';
    if (c == theme.colors.info) return 'theme.colors.info';
    return 'null';
  }

  String radiusName(BorderRadius? r) {
    if (r == BorderRadius.all(theme.radius.xs))
      return 'BorderRadius.all(theme.radius.xs)';
    if (r == BorderRadius.all(theme.radius.sm))
      return 'BorderRadius.all(theme.radius.sm)';
    if (r == BorderRadius.zero) return 'BorderRadius.zero';
    return 'BorderRadius.circular(\$size)';
  }

  final colorStr = useFoundationColor
      ? '\n  color: ${colorName(foundationColor)},'
      : '';
  final radiusStr = foundationRadius != BorderRadius.circular(size)
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixDot(
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
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixDot(
          size: 16,
          color: AtomixTheme.of(context).colors.success,
          isPulsing: true,
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
AtomixDot(
  size: 16,
  color: theme.colors.success,
  isPulsing: true,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Error Static', path: '[Atoms]/Dot', type: AtomixDot)
Widget dotErrorStatic(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixDot(size: 12, color: AtomixTheme.of(context).colors.error),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
AtomixDot(
  size: 12,
  color: theme.colors.error,
)''',
        ),
      ],
    ),
  );
}
