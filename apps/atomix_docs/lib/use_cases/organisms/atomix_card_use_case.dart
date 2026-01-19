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

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            AtomixColors.primary,
            AtomixColors.secondary,
            AtomixColors.surface,
            AtomixColors.success,
            AtomixColors.warning,
            AtomixColors.error,
          ],
          labelBuilder: (color) {
            if (color == AtomixColors.primary) return 'Primary';
            if (color == AtomixColors.secondary) return 'Secondary';
            if (color == AtomixColors.surface) return 'Surface';
            if (color == AtomixColors.success) return 'Success';
            if (color == AtomixColors.warning) return 'Warning';
            if (color == AtomixColors.error) return 'Error';
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
      AtomixRadius.xsBorderRadius,
      AtomixRadius.smBorderRadius,
      AtomixRadius.mdBorderRadius,
      AtomixRadius.lgBorderRadius,
      AtomixRadius.xlBorderRadius,
      AtomixRadius.fullBorderRadius,
    ],
    initialOption: AtomixRadius.mdBorderRadius,
  );

  final isTappable = context.knobs.boolean(
    label: 'Card > Is Tappable',
    initialValue: false,
  );

  // Helper strings
  String colorName(Color? color) {
    if (color == AtomixColors.primary) return 'AtomixColors.primary';
    if (color == AtomixColors.secondary) return 'AtomixColors.secondary';
    if (color == AtomixColors.surface) return 'AtomixColors.surface';
    if (color == AtomixColors.success) return 'AtomixColors.success';
    if (color == AtomixColors.warning) return 'AtomixColors.warning';
    if (color == AtomixColors.error) return 'AtomixColors.error';
    return 'null';
  }

  String radiusName(BorderRadius radius) {
    if (radius == AtomixRadius.xsBorderRadius) {
      return 'AtomixRadius.xsBorderRadius';
    }
    if (radius == AtomixRadius.smBorderRadius) {
      return 'AtomixRadius.smBorderRadius';
    }
    if (radius == AtomixRadius.mdBorderRadius) {
      return 'AtomixRadius.mdBorderRadius';
    }
    if (radius == AtomixRadius.lgBorderRadius) {
      return 'AtomixRadius.lgBorderRadius';
    }
    if (radius == AtomixRadius.xlBorderRadius) {
      return 'AtomixRadius.xlBorderRadius';
    }
    if (radius == AtomixRadius.fullBorderRadius) {
      return 'AtomixRadius.fullBorderRadius';
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
