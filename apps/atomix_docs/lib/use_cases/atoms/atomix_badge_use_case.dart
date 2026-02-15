import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Badge',
  type: AtomixBadge,
)
Widget atomixBadgePlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Badge > Label',
    initialValue: 'Badge',
  );

  final variant = context.knobs.object.dropdown<AtomixBadgeVariant>(
    label: 'Badge > Variant',
    options: AtomixBadgeVariant.values,
    labelBuilder: (value) => value.toString().split('.').last,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Use Custom Color',
    initialValue: false,
  );

  final theme = AtomixTheme.of(context);

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            theme.colors.primary,
            theme.colors.secondary,
            theme.colors.success,
            theme.colors.warning,
            theme.colors.error,
            theme.colors.info,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.secondary) return 'Secondary';
            if (c == theme.colors.success) return 'Success';
            if (c == theme.colors.warning) return 'Warning';
            if (c == theme.colors.error) return 'Error';
            if (c == theme.colors.info) return 'Info';
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
      BorderRadius.all(theme.radius.xl),
      BorderRadius.all(theme.radius.full),
    ],
    initialOption: BorderRadius.all(theme.radius.sm),
    labelBuilder: (r) {
      if (r == BorderRadius.all(theme.radius.xs)) return 'XS';
      if (r == BorderRadius.all(theme.radius.sm)) return 'SM';
      if (r == BorderRadius.all(theme.radius.md)) return 'MD';
      if (r == BorderRadius.all(theme.radius.lg)) return 'LG';
      if (r == BorderRadius.all(theme.radius.xl)) return 'XL';
      if (r == BorderRadius.all(theme.radius.full)) return 'Full';
      return 'Custom';
    },
  );

  final showIcon = context.knobs.boolean(
    label: 'Icons > Show Icon',
    initialValue: false,
  );

  final iconData = showIcon
      ? context.knobs.object.dropdown<IconData>(
          label: 'Icons > Icon Type',
          options: [
            Icons.star,
            Icons.favorite,
            Icons.info,
            Icons.check_circle,
            Icons.warning,
          ],
        )
      : null;

  // Helper strings
  String colorName(Color? color) {
    if (color == theme.colors.primary) return 'theme.colors.primary';
    if (color == theme.colors.secondary) return 'theme.colors.secondary';
    if (color == theme.colors.success) return 'theme.colors.success';
    if (color == theme.colors.warning) return 'theme.colors.warning';
    if (color == theme.colors.error) return 'theme.colors.error';
    if (color == theme.colors.info) return 'theme.colors.info';
    return 'null';
  }

  String radiusName(BorderRadius radius) {
    if (radius == BorderRadius.all(theme.radius.xs))
      return 'BorderRadius.all(theme.radius.xs)';
    if (radius == BorderRadius.all(theme.radius.sm))
      return 'BorderRadius.all(theme.radius.sm)';
    if (radius == BorderRadius.all(theme.radius.md))
      return 'BorderRadius.all(theme.radius.md)';
    if (radius == BorderRadius.all(theme.radius.lg))
      return 'BorderRadius.all(theme.radius.lg)';
    if (radius == BorderRadius.all(theme.radius.xl))
      return 'BorderRadius.all(theme.radius.xl)';
    if (radius == BorderRadius.all(theme.radius.full))
      return 'BorderRadius.all(theme.radius.full)';
    return 'null';
  }

  final variantStr = 'AtomixBadgeVariant.${variant.toString().split('.').last}';
  final colorStr = useFoundationColor
      ? '\n  backgroundColor: ${colorName(foundationColor)},'
      : '';
  final radiusStr = foundationRadius != BorderRadius.all(theme.radius.sm)
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';
  final iconStr = showIcon
      ? '\n  icon: Icons.${iconData.toString().split('(').last.split(')').first},'
      : '';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixBadge(
  label: '$label',
  variant: $variantStr,$iconStr$colorStr$radiusStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixBadge(
            label: label,
            variant: variant,
            icon: iconData,
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

@widgetbook.UseCase(name: 'Neutral', path: '[Atoms]/Badge', type: AtomixBadge)
Widget atomixBadgeNeutral(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixBadge(
            label: 'Neutral',
            variant: AtomixBadgeVariant.neutral,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBadge(
  label: 'Neutral',
  variant: AtomixBadgeVariant.neutral,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Success', path: '[Atoms]/Badge', type: AtomixBadge)
Widget atomixBadgeSuccess(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixBadge(
            label: 'Success',
            variant: AtomixBadgeVariant.success,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBadge(
  label: 'Success',
  variant: AtomixBadgeVariant.success,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Warning', path: '[Atoms]/Badge', type: AtomixBadge)
Widget atomixBadgeWarning(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixBadge(
            label: 'Warning',
            variant: AtomixBadgeVariant.warning,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBadge(
  label: 'Warning',
  variant: AtomixBadgeVariant.warning,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Error', path: '[Atoms]/Badge', type: AtomixBadge)
Widget atomixBadgeError(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixBadge(label: 'Error', variant: AtomixBadgeVariant.error),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBadge(
  label: 'Error',
  variant: AtomixBadgeVariant.error,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Info', path: '[Atoms]/Badge', type: AtomixBadge)
Widget atomixBadgeInfo(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixBadge(label: 'Info', variant: AtomixBadgeVariant.info),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBadge(
  label: 'Info',
  variant: AtomixBadgeVariant.info,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Icon', path: '[Atoms]/Badge', type: AtomixBadge)
Widget atomixBadgeWithIcon(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixBadge(
            label: 'New',
            variant: AtomixBadgeVariant.success,
            icon: Icons.star,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBadge(
  label: 'New',
  variant: AtomixBadgeVariant.success,
  icon: Icons.star,
)''',
          ),
        ],
      ),
    ),
  );
}
