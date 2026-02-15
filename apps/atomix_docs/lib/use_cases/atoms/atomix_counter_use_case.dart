import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

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

  final theme = AtomixTheme.of(context);

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Background',
          options: [
            theme.colors.primary,
            theme.colors.success,
            theme.colors.error,
            theme.colors.warning,
            theme.colors.info,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.success) return 'Success';
            if (c == theme.colors.error) return 'Error';
            if (c == theme.colors.warning) return 'Warning';
            if (c == theme.colors.info) return 'Info';
            return 'Custom';
          },
        )
      : null;

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      BorderRadius.zero,
      BorderRadius.all(theme.radius.xs),
      BorderRadius.all(theme.radius.sm),
      BorderRadius.all(theme.radius.md),
      BorderRadius.circular(size),
    ],
    initialOption: BorderRadius.circular(20),
    labelBuilder: (r) {
      if (r == BorderRadius.zero) return 'Zero';
      if (r == BorderRadius.all(theme.radius.xs)) return 'XS';
      if (r == BorderRadius.all(theme.radius.sm)) return 'SM';
      if (r == BorderRadius.all(theme.radius.md)) return 'MD';
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

  String radiusName(BorderRadius r) {
    if (r == BorderRadius.all(theme.radius.xs))
      return 'BorderRadius.all(theme.radius.xs)';
    if (r == BorderRadius.all(theme.radius.sm))
      return 'BorderRadius.all(theme.radius.sm)';
    if (r == BorderRadius.all(theme.radius.md))
      return 'BorderRadius.all(theme.radius.md)';
    if (r == BorderRadius.zero) return 'BorderRadius.zero';
    return 'BorderRadius.circular(\$size)';
  }

  final colorStr = foundationColor != null
      ? '\n  backgroundColor: ${colorName(foundationColor)},'
      : '';
  final radiusStr = foundationRadius != BorderRadius.circular(size)
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixCounter(
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
