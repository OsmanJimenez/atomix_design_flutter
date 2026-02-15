import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/Card',
  type: AtomixCard,
)
Widget atomixCardPlayground(BuildContext context) {
  final variant = context.knobs.object.dropdown<AtomixCardVariant>(
    label: 'Card > Variant',
    options: AtomixCardVariant.values,
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
            theme.colors.surface,
            theme.colors.success,
            theme.colors.warning,
            theme.colors.error,
          ],
          labelBuilder: (color) {
            if (color == theme.colors.primary) return 'Primary';
            if (color == theme.colors.secondary) return 'Secondary';
            if (color == theme.colors.surface) return 'Surface';
            if (color == theme.colors.success) return 'Success';
            if (color == theme.colors.warning) return 'Warning';
            if (color == theme.colors.error) return 'Error';
            return 'Unknown';
          },
        )
      : null;

  final elevation = context.knobs.object.dropdown<double>(
    label: 'Foundation > Elevation',
    options: [
      AtomixElevation.none,
      AtomixElevation.xs,
      AtomixElevation.sm,
      AtomixElevation.md,
      AtomixElevation.lg,
      AtomixElevation.xl,
    ],
    initialOption: AtomixElevation.xs,
    labelBuilder: (value) => 'Elevation $value',
  );

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
  );

  final isTappable = context.knobs.boolean(
    label: 'Card > Is Tappable',
    initialValue: false,
  );

  // Helper strings
  String colorName(Color? color) {
    if (color == theme.colors.primary) {
      return 'theme.colors.primary';
    }
    if (color == theme.colors.secondary) {
      return 'theme.colors.secondary';
    }
    if (color == theme.colors.surface) {
      return 'theme.colors.surface';
    }
    if (color == theme.colors.success) {
      return 'theme.colors.success';
    }
    if (color == theme.colors.warning) {
      return 'theme.colors.warning';
    }
    if (color == theme.colors.error) {
      return 'theme.colors.error';
    }
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

  final variantStr = 'AtomixCardVariant.${variant.toString().split('.').last}';
  final colorStr = useFoundationColor
      ? '\n  backgroundColor: ${colorName(foundationColor)},'
      : '';
  final elevationStr = '\n  elevation: $elevation,';
  final radiusStr = '\n  borderRadius: ${radiusName(foundationRadius)},';
  final onTapStr = isTappable ? '\n  onTap: () {},' : '';

  final code =
      '''AtomixCard(
  variant: $variantStr,$colorStr$elevationStr$radiusStr$onTapStr
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Card Content'),
  ),
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixCard(
            variant: variant,
            backgroundColor: foundationColor,
            elevation: elevation,
            borderRadius: foundationRadius,
            onTap: isTappable ? () {} : null,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Interactive Card',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Use the Knobs on the right to customize this card.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Filled', path: '[Organisms]/Card', type: AtomixCard)
Widget atomixCardFilled(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixCard(
            variant: AtomixCardVariant.filled,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filled Card',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('This is a filled card with default styling.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixCard(
  variant: AtomixCardVariant.filled,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Card content'),
  ),
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Outlined',
  path: '[Organisms]/Card',
  type: AtomixCard,
)
Widget atomixCardOutlined(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixCard(
            variant: AtomixCardVariant.outlined,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Outlined Card',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('This is an outlined card with a border.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixCard(
  variant: AtomixCardVariant.outlined,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Card content'),
  ),
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Elevated',
  path: '[Organisms]/Card',
  type: AtomixCard,
)
Widget atomixCardElevated(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixCard(
            variant: AtomixCardVariant.elevated,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Elevated Card',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('This is an elevated card with a shadow.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixCard(
  variant: AtomixCardVariant.elevated,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Card content'),
  ),
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Tappable',
  path: '[Organisms]/Card',
  type: AtomixCard,
)
Widget atomixCardTappable(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixCard(
            variant: AtomixCardVariant.filled,
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Card tapped!')));
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tappable Card',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('This card responds to tap gestures.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixCard(
  variant: AtomixCardVariant.filled,
  onTap: () {
    // Handle tap
  },
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Card content'),
  ),
)''',
          ),
        ],
      ),
    ),
  );
}
