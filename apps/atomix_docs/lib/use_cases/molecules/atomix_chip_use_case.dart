import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Playground', type: AtomixChip)
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

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            AtomixColors.primary,
            AtomixColors.secondary,
            AtomixColors.success,
            AtomixColors.info,
            AtomixColors.warning,
            AtomixColors.error,
          ],
          labelBuilder: (color) {
            if (color == AtomixColors.primary) return 'Primary';
            if (color == AtomixColors.secondary) return 'Secondary';
            if (color == AtomixColors.success) return 'Success';
            if (color == AtomixColors.info) return 'Info';
            if (color == AtomixColors.warning) return 'Warning';
            if (color == AtomixColors.error) return 'Error';
            return 'Custom';
          },
        )
      : null;

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
    initialOption: AtomixRadius.smBorderRadius,
  );

  // Helper strings
  String colorName(Color? color) {
    if (color == AtomixColors.primary) {
      return 'AtomixColors.primary';
    }
    if (color == AtomixColors.secondary) {
      return 'AtomixColors.secondary';
    }
    if (color == AtomixColors.success) {
      return 'AtomixColors.success';
    }
    if (color == AtomixColors.info) {
      return 'AtomixColors.info';
    }
    if (color == AtomixColors.warning) {
      return 'AtomixColors.warning';
    }
    if (color == AtomixColors.error) {
      return 'AtomixColors.error';
    }
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

  final selectedStr = selected ? '\n  selected: true,' : '';
  final onSelectedStr = isSelectable ? '\n  onSelected: (val) {},' : '';
  final onDeletedStr = isDeletable ? '\n  onDeleted: () {},' : '';
  final iconStr = showIcon
      ? '\n  leadingIcon: Icons.${iconData.toString().split('(').last.split(')').first},'
      : '';
  final colorStr = useFoundationColor
      ? '\n  backgroundColor: ${colorName(foundationColor)},'
      : '';
  final radiusStr = foundationRadius != AtomixRadius.smBorderRadius
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''AtomixChip(
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

@widgetbook.UseCase(name: 'Default', type: AtomixChip)
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

@widgetbook.UseCase(name: 'Selected', type: AtomixChip)
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

@widgetbook.UseCase(name: 'With Icon', type: AtomixChip)
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

@widgetbook.UseCase(name: 'Deletable', type: AtomixChip)
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
