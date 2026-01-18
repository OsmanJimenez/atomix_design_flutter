import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixChip)
Widget atomixChipDefault(BuildContext context) {
  return const Center(child: AtomixChip(label: 'Chip'));
}

@widgetbook.UseCase(name: 'Selected', type: AtomixChip)
Widget atomixChipSelected(BuildContext context) {
  return Center(
    child: AtomixChip(
      label: 'Selected',
      selected: true,
      onSelected: (selected) {},
    ),
  );
}

@widgetbook.UseCase(name: 'Unselected', type: AtomixChip)
Widget atomixChipUnselected(BuildContext context) {
  return Center(
    child: AtomixChip(
      label: 'Unselected',
      selected: false,
      onSelected: (selected) {},
    ),
  );
}

@widgetbook.UseCase(name: 'With Icon', type: AtomixChip)
Widget atomixChipWithIcon(BuildContext context) {
  return const Center(
    child: AtomixChip(label: 'Flutter', leadingIcon: Icons.flutter_dash),
  );
}

@widgetbook.UseCase(name: 'Deletable', type: AtomixChip)
Widget atomixChipDeletable(BuildContext context) {
  return Center(
    child: AtomixChip(label: 'Deletable', onDeleted: () {}),
  );
}
