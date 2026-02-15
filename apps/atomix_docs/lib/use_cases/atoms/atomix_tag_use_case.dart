import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Playground', path: '[Atoms]/Tag', type: AtomixTag)
Widget tagPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Tag > Label',
    initialValue: 'Beta',
  );

  final showIcon = context.knobs.boolean(
    label: 'Tag > Show Icon',
    initialValue: true,
  );

  final theme = AtomixTheme.of(context);

  final color = context.knobs.object.dropdown<Color>(
    label: 'Tag > Theme Color',
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
  );

  final useFoundationRadius = context.knobs.boolean(
    label: 'Foundation > Custom Radius',
    initialValue: false,
  );

  final foundationRadius = useFoundationRadius
      ? context.knobs.object.dropdown<BorderRadius>(
          label: 'Foundation > Radius',
          options: [
            BorderRadius.all(theme.radius.xs),
            BorderRadius.all(theme.radius.sm),
            BorderRadius.all(theme.radius.md),
            BorderRadius.all(theme.radius.lg),
            BorderRadius.all(theme.radius.full),
          ],
          initialOption: BorderRadius.all(theme.radius.xs),
          labelBuilder: (r) {
            if (r == BorderRadius.all(theme.radius.xs)) return 'XS';
            if (r == BorderRadius.all(theme.radius.sm)) return 'SM';
            if (r == BorderRadius.all(theme.radius.md)) return 'MD';
            if (r == BorderRadius.all(theme.radius.lg)) return 'LG';
            if (r == BorderRadius.all(theme.radius.full)) return 'Full';
            return 'Custom';
          },
        )
      : null;

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
    if (r == BorderRadius.all(theme.radius.md))
      return 'BorderRadius.all(theme.radius.md)';
    if (r == BorderRadius.all(theme.radius.lg))
      return 'BorderRadius.all(theme.radius.lg)';
    if (r == BorderRadius.all(theme.radius.full))
      return 'BorderRadius.all(theme.radius.full)';
    return 'null';
  }

  final radiusStr = foundationRadius != null
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixTag(
  label: '$label',
  icon: ${showIcon ? 'Icons.label' : 'null'},
  color: ${colorName(color)},$radiusStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixTag(
            label: label,
            icon: showIcon ? Icons.label : null,
            color: color,
            borderRadius: foundationRadius,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Success', path: '[Atoms]/Tag', type: AtomixTag)
Widget tagSuccess(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixTag(
          label: 'Success',
          color: AtomixTheme.of(context).colors.success,
          icon: Icons.check_circle_outline,
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
AtomixTag(
  label: 'Success',
  color: theme.colors.success,
  icon: Icons.check_circle_outline,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Error', path: '[Atoms]/Tag', type: AtomixTag)
Widget tagError(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixTag(
          label: 'Critical',
          color: AtomixTheme.of(context).colors.error,
          icon: Icons.warning_amber_rounded,
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
AtomixTag(
  label: 'Critical',
  color: theme.colors.error,
  icon: Icons.warning_amber_rounded,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Info', path: '[Atoms]/Tag', type: AtomixTag)
Widget tagInfo(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixTag(
          label: 'Update Available',
          color: AtomixTheme.of(context).colors.info,
          icon: Icons.info_outline,
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
AtomixTag(
  label: 'Update Available',
  color: theme.colors.info,
  icon: Icons.info_outline,
)''',
        ),
      ],
    ),
  );
}
