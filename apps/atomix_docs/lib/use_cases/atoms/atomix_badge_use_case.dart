import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Playground', type: AtomixBadge)
Widget atomixBadgePlayground(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: 'Badge');

  final variant = context.knobs.list<AtomixBadgeVariant>(
    label: 'Variant',
    options: AtomixBadgeVariant.values,
    labelBuilder: (value) => value.toString().split('.').last,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Use Custom Color',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.list<Color>(
          label: 'Foundation Color',
          options: [
            AtomixColors.primary,
            AtomixColors.secondary,
            AtomixColors.success,
            AtomixColors.warning,
            AtomixColors.error,
            AtomixColors.info,
          ],
          labelBuilder: (color) {
            if (color == AtomixColors.primary) return 'Primary';
            if (color == AtomixColors.secondary) return 'Secondary';
            if (color == AtomixColors.success) return 'Success';
            if (color == AtomixColors.warning) return 'Warning';
            if (color == AtomixColors.error) return 'Error';
            if (color == AtomixColors.info) return 'Info';
            return 'Unknown';
          },
        )
      : null;

  final foundationRadius = context.knobs.list<BorderRadius>(
    label: 'Foundation Radius',
    options: [
      AtomixRadius.xsBorderRadius,
      AtomixRadius.smBorderRadius,
      AtomixRadius.mdBorderRadius,
      AtomixRadius.lgBorderRadius,
      AtomixRadius.xlBorderRadius,
      AtomixRadius.fullBorderRadius,
    ],
    initialOption: AtomixRadius.smBorderRadius,
  );

  final showIcon = context.knobs.boolean(
    label: 'Show Icon',
    initialValue: false,
  );

  final iconData = showIcon
      ? context.knobs.list<IconData>(
          label: 'Icon',
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
    if (color == AtomixColors.primary) return 'AtomixColors.primary';
    if (color == AtomixColors.secondary) return 'AtomixColors.secondary';
    if (color == AtomixColors.success) return 'AtomixColors.success';
    if (color == AtomixColors.warning) return 'AtomixColors.warning';
    if (color == AtomixColors.error) return 'AtomixColors.error';
    if (color == AtomixColors.info) return 'AtomixColors.info';
    return 'null';
  }

  String radiusName(BorderRadius radius) {
    if (radius == AtomixRadius.xsBorderRadius)
      return 'AtomixRadius.xsBorderRadius';
    if (radius == AtomixRadius.smBorderRadius)
      return 'AtomixRadius.smBorderRadius';
    if (radius == AtomixRadius.mdBorderRadius)
      return 'AtomixRadius.mdBorderRadius';
    if (radius == AtomixRadius.lgBorderRadius)
      return 'AtomixRadius.lgBorderRadius';
    if (radius == AtomixRadius.xlBorderRadius)
      return 'AtomixRadius.xlBorderRadius';
    if (radius == AtomixRadius.fullBorderRadius)
      return 'AtomixRadius.fullBorderRadius';
    return 'null';
  }

  final variantStr = 'AtomixBadgeVariant.${variant.toString().split('.').last}';
  final colorStr = useFoundationColor
      ? '\n  backgroundColor: ${colorName(foundationColor)},'
      : '';
  final radiusStr = foundationRadius != AtomixRadius.smBorderRadius
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';
  final iconStr = showIcon
      ? '\n  icon: Icons.${iconData.toString().split('(').last.split(')').first},'
      : '';

  final code =
      '''AtomixBadge(
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

@widgetbook.UseCase(name: 'Neutral', type: AtomixBadge)
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

@widgetbook.UseCase(name: 'Success', type: AtomixBadge)
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

@widgetbook.UseCase(name: 'Warning', type: AtomixBadge)
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

@widgetbook.UseCase(name: 'Error', type: AtomixBadge)
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

@widgetbook.UseCase(name: 'Info', type: AtomixBadge)
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

@widgetbook.UseCase(name: 'With Icon', type: AtomixBadge)
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
