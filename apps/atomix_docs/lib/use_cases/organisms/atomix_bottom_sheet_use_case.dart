import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixBottomSheet)
Widget atomixBottomSheetDefault(BuildContext context) {
  return Center(
    child: AtomixButton(
      label: 'Show Bottom Sheet',
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const AtomixBottomSheet(
            title: 'Options',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AtomixListTile(title: 'Option 1', leading: Icons.star),
                AtomixListTile(title: 'Option 2', leading: Icons.favorite),
                AtomixListTile(title: 'Option 3', leading: Icons.share),
              ],
            ),
          ),
        );
      },
    ),
  );
}

@widgetbook.UseCase(name: 'Without Handle', type: AtomixBottomSheet)
Widget atomixBottomSheetWithoutHandle(BuildContext context) {
  return Center(
    child: AtomixButton(
      label: 'Show Bottom Sheet (No Handle)',
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => AtomixBottomSheet(
            title: 'Settings',
            showHandle: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Manage your settings here'),
                  const SizedBox(height: 16),
                  AtomixButton(
                    label: 'Save Changes',
                    fullWidth: true,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

@widgetbook.UseCase(name: 'With Form', type: AtomixBottomSheet)
Widget atomixBottomSheetWithForm(BuildContext context) {
  return Center(
    child: AtomixButton(
      label: 'Show Form Bottom Sheet',
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => AtomixBottomSheet(
            title: 'Add Item',
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AtomixTextField(label: 'Name', hint: 'Enter name'),
                  const SizedBox(height: 16),
                  const AtomixTextField(
                    label: 'Description',
                    hint: 'Enter description',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24),
                  AtomixButton(
                    label: 'Submit',
                    fullWidth: true,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
