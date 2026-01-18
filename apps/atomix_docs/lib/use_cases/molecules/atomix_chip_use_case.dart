import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixChip)
Widget atomixChipDefault(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixChip(label: 'Chip', selected: false, onSelected: (selected) {}),
          const SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixChip(
  label: 'Chip',
  selected: false,
  onSelected: (selected) {
    // Handle selection
  },
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
            onSelected: (selected) {},
          ),
          const SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixChip(
  label: 'Selected Chip',
  selected: true,
  onSelected: (selected) {},
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
          AtomixChip(
            label: 'Chip with Icon',
            leadingIcon: Icons.star,
            selected: false,
            onSelected: (selected) {},
          ),
          const SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixChip(
  label: 'Chip with Icon',
  leadingIcon: Icons.star,
  selected: false,
  onSelected: (selected) {},
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
          AtomixChip(
            label: 'Deletable Chip',
            selected: false,
            onSelected: (selected) {},
            onDeleted: () {},
          ),
          const SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixChip(
  label: 'Deletable Chip',
  selected: false,
  onSelected: (selected) {},
  onDeleted: () {
    // Handle delete
  },
)''',
          ),
        ],
      ),
    ),
  );
}
