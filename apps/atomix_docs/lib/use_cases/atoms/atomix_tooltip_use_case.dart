import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

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

  final theme = AtomixTheme.of(context);

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Background',
          options: [
            theme.colors.primary,
            theme.colors.secondary,
            theme.colors.info,
            theme.colors.success,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.secondary) return 'Secondary';
            if (c == theme.colors.info) return 'Info';
            if (c == theme.colors.success) return 'Success';
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
      BorderRadius.zero,
    ],
    initialOption: BorderRadius.all(theme.radius.xs),
    labelBuilder: (r) {
      if (r == BorderRadius.all(theme.radius.xs)) return 'XS';
      if (r == BorderRadius.all(theme.radius.sm)) return 'SM';
      if (r == BorderRadius.all(theme.radius.md)) return 'MD';
      return 'Zero';
    },
  );

  String colorName(Color? c) {
    if (c == theme.colors.primary) return 'theme.colors.primary';
    if (c == theme.colors.secondary) return 'theme.colors.secondary';
    if (c == theme.colors.info) return 'theme.colors.info';
    if (c == theme.colors.success) return 'theme.colors.success';
    return 'null';
  }

  String radiusName(BorderRadius r) {
    if (r == BorderRadius.all(theme.radius.xs))
      return 'BorderRadius.all(theme.radius.xs)';
    if (r == BorderRadius.all(theme.radius.sm))
      return 'BorderRadius.all(theme.radius.sm)';
    if (r == BorderRadius.all(theme.radius.md))
      return 'BorderRadius.all(theme.radius.md)';
    return 'BorderRadius.zero';
  }

  final colorStr = foundationColor != null
      ? '\n  backgroundColor: ${colorName(foundationColor)},'
      : '';
  final radiusStr = foundationRadius != BorderRadius.all(theme.radius.xs)
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixTooltip(
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
