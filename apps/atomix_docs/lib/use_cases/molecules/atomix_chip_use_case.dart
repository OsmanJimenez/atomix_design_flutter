import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/Chip',
  type: AtomixChip,
)
Widget atomixChipPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Chip > Label',
    initialValue: 'Interective Chip',
  );

  final selected = context.knobs.boolean(
    label: 'Chip > Selected',
    initialValue: false,
  );

  final isSelectable = context.knobs.boolean(
    label: 'Chip > Is Selectable',
    initialValue: true,
  );

  final isDeletable = context.knobs.boolean(
    label: 'Chip > Is Deletable',
    initialValue: false,
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
            Icons.label,
            Icons.person,
            Icons.check,
          ],
        )
      : null;

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Color',
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
            theme.colors.info,
            theme.colors.warning,
            theme.colors.error,
          ],
          labelBuilder: (color) {
            if (color == theme.colors.primary) return 'Primary';
            if (color == theme.colors.secondary) return 'Secondary';
            if (color == theme.colors.success) return 'Success';
            if (color == theme.colors.info) return 'Info';
            if (color == theme.colors.warning) return 'Warning';
            if (color == theme.colors.error) return 'Error';
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
  );

  // Helper strings
  String colorName(Color? color) {
    if (color == theme.colors.primary) return 'theme.colors.primary';
    if (color == theme.colors.secondary) return 'theme.colors.secondary';
    if (color == theme.colors.success) return 'theme.colors.success';
    if (color == theme.colors.info) return 'theme.colors.info';
    if (color == theme.colors.warning) return 'theme.colors.warning';
    if (color == theme.colors.error) return 'theme.colors.error';
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

  final selectedStr = selected ? '\n  selected: true,' : '';
  final onSelectedStr = isSelectable ? '\n  onSelected: (val) {},' : '';
  final onDeletedStr = isDeletable ? '\n  onDeleted: () {},' : '';
  final iconStr = showIcon
      ? '\n  leadingIcon: Icons.${iconData.toString().split('(').last.split(')').first},'
      : '';
  final colorStr = useFoundationColor
      ? '\n  backgroundColor: ${colorName(foundationColor)},'
      : '';
  final radiusStr = foundationRadius != BorderRadius.all(theme.radius.sm)
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixChip(
  label: '$label',$selectedStr$onSelectedStr$onDeletedStr$iconStr$colorStr$radiusStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixChip(
            label: label,
            selected: selected,
            onSelected: isSelectable ? (val) {} : null,
            onDeleted: isDeletable ? () {} : null,
            leadingIcon: iconData,
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

@widgetbook.UseCase(name: 'Default', path: '[Molecules]/Chip', type: AtomixChip)
Widget atomixChipDefault(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixChip(label: 'Flutter'),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixChip(
  label: 'Flutter',
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Selected',
  path: '[Molecules]/Chip',
  type: AtomixChip,
)
Widget atomixChipSelected(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixChip(
            label: 'Selected Chip',
            selected: true,
            onSelected: (val) {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixChip(
  label: 'Selected Chip',
  selected: true,
  onSelected: (val) {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Icon',
  path: '[Molecules]/Chip',
  type: AtomixChip,
)
Widget atomixChipWithIcon(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixChip(label: 'Badge', leadingIcon: Icons.label),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixChip(
  label: 'Badge',
  leadingIcon: Icons.label,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Deletable',
  path: '[Molecules]/Chip',
  type: AtomixChip,
)
Widget atomixChipDeletable(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixChip(label: 'Deletable', onDeleted: () {}),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixChip(
  label: 'Deletable',
  onDeleted: () {},
)''',
          ),
        ],
      ),
    ),
  );
}
