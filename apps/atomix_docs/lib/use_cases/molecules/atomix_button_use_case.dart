import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/Button',
  type: AtomixButton,
)
Widget atomixButtonPlayground(BuildContext context) {
  // Knobs for interactivity
  final label = context.knobs.string(
    label: 'Button > Label',
    initialValue: 'Customizable Button',
  );

  final variant = context.knobs.object.dropdown<AtomixButtonVariant>(
    label: 'Button > Variant',
    options: AtomixButtonVariant.values,
    labelBuilder: (value) => value.toString().split('.').last,
  );

  final size = context.knobs.object.dropdown<AtomixButtonSize>(
    label: 'Button > Size',
    options: AtomixButtonSize.values,
    labelBuilder: (value) => value.toString().split('.').last,
  );

  final fullWidth = context.knobs.boolean(
    label: 'Button > Full Width',
    initialValue: false,
  );

  final isLoading = context.knobs.boolean(
    label: 'Button > Loading',
    initialValue: false,
  );

  final disabled = context.knobs.boolean(
    label: 'Button > Disabled',
    initialValue: false,
  );

  // Foundation Customization Knobs
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
          labelBuilder: (color) {
            if (color == theme.colors.primary) return 'Primary';
            if (color == theme.colors.secondary) return 'Secondary';
            if (color == theme.colors.success) return 'Success';
            if (color == theme.colors.warning) return 'Warning';
            if (color == theme.colors.error) return 'Error';
            if (color == theme.colors.info) return 'Info';
            return 'Unknown';
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
    initialOption: BorderRadius.all(theme.radius.md),
    labelBuilder: (radius) {
      if (radius == BorderRadius.all(theme.radius.xs)) {
        return 'Extra Small (4px)';
      }
      if (radius == BorderRadius.all(theme.radius.sm)) return 'Small (8px)';
      if (radius == BorderRadius.all(theme.radius.md)) return 'Medium (12px)';
      if (radius == BorderRadius.all(theme.radius.lg)) return 'Large (16px)';
      if (radius == BorderRadius.all(theme.radius.xl)) {
        return 'Extra Large (24px)';
      }
      if (radius == BorderRadius.all(theme.radius.full)) {
        return 'Full (Rounded)';
      }
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
            Icons.send,
            Icons.add,
            Icons.settings,
          ],
        )
      : null;

  // Helper strings for code snippet
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
    if (radius == BorderRadius.all(theme.radius.xs)) {
      return 'BorderRadius.all(theme.radius.xs)';
    }
    if (radius == BorderRadius.all(theme.radius.sm)) {
      return 'BorderRadius.all(theme.radius.sm)';
    }
    if (radius == BorderRadius.all(theme.radius.md)) {
      return 'BorderRadius.all(theme.radius.md)';
    }
    if (radius == BorderRadius.all(theme.radius.lg)) {
      return 'BorderRadius.all(theme.radius.lg)';
    }
    if (radius == BorderRadius.all(theme.radius.xl)) {
      return 'BorderRadius.all(theme.radius.xl)';
    }
    if (radius == BorderRadius.all(theme.radius.full)) {
      return 'BorderRadius.all(theme.radius.full)';
    }
    return 'null';
  }

  final variantStr =
      'AtomixButtonVariant.${variant.toString().split('.').last}';
  final sizeStr = 'AtomixButtonSize.${size.toString().split('.').last}';
  final iconStr = showIcon
      ? '\n  icon: Icons.${iconData.toString().split('(').last.split(')').first},'
      : '';
  final loadingStr = isLoading ? '\n  isLoading: true,' : '';
  final fullWidthStr = fullWidth ? '\n  fullWidth: true,' : '';
  final colorStr = useFoundationColor
      ? '\n  backgroundColor: ${colorName(foundationColor)},'
      : '';
  final radiusStr = foundationRadius != BorderRadius.all(theme.radius.md)
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';
  final onPressedStr = disabled ? 'null,' : '() {},';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixButton(
  label: '$label',
  variant: $variantStr,
  size: $sizeStr,$iconStr$loadingStr$fullWidthStr$colorStr$radiusStr
  onPressed: $onPressedStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: label,
            variant: variant,
            size: size,
            fullWidth: fullWidth,
            isLoading: isLoading,
            icon: iconData,
            backgroundColor: foundationColor,
            borderRadius: foundationRadius,
            onPressed: disabled ? null : () {},
          ),
          const SizedBox(height: 32),
          Text(
            'Interactive Code:',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Primary',
  path: '[Molecules]/Button',
  type: AtomixButton,
)
Widget atomixButtonPrimary(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Primary Button',
            variant: AtomixButtonVariant.primary,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Primary Button',
  variant: AtomixButtonVariant.primary,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Secondary',
  path: '[Molecules]/Button',
  type: AtomixButton,
)
Widget atomixButtonSecondary(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Secondary Button',
            variant: AtomixButtonVariant.secondary,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Secondary Button',
  variant: AtomixButtonVariant.secondary,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Tertiary',
  path: '[Molecules]/Button',
  type: AtomixButton,
)
Widget atomixButtonTertiary(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Tertiary Button',
            variant: AtomixButtonVariant.tertiary,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Tertiary Button',
  variant: AtomixButtonVariant.tertiary,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Small',
  path: '[Molecules]/Button',
  type: AtomixButton,
)
Widget atomixButtonSmall(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Small Button',
            size: AtomixButtonSize.sm,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Small Button',
  size: AtomixButtonSize.sm,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Large',
  path: '[Molecules]/Button',
  type: AtomixButton,
)
Widget atomixButtonLarge(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Large Button',
            size: AtomixButtonSize.lg,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Large Button',
  size: AtomixButtonSize.lg,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Disabled',
  path: '[Molecules]/Button',
  type: AtomixButton,
)
Widget atomixButtonDisabled(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AtomixButton(label: 'Disabled Button', onPressed: null),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Disabled Button',
  onPressed: null, // null makes it disabled
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Loading',
  path: '[Molecules]/Button',
  type: AtomixButton,
)
Widget atomixButtonLoading(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Loading Button',
            isLoading: true,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Loading Button',
  isLoading: true,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Icon',
  path: '[Molecules]/Button',
  type: AtomixButton,
)
Widget atomixButtonWithIcon(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Button with Icon',
            icon: Icons.star,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Button with Icon',
  icon: Icons.star,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Full Width',
  path: '[Molecules]/Button',
  type: AtomixButton,
)
Widget atomixButtonFullWidth(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Full Width Button',
            fullWidth: true,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Full Width Button',
  fullWidth: true,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}
