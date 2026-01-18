import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixDialog)
Widget atomixDialogDefault(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixButton(
            label: 'Show Dialog',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AtomixDialog(
                  title: 'Confirm Action',
                  content: 'Are you sure you want to proceed?',
                  actions: [
                    AtomixButton(
                      label: 'Cancel',
                      onPressed: () => Navigator.pop(context),
                      variant: AtomixButtonVariant.tertiary,
                    ),
                    AtomixButton(
                      label: 'Confirm',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''showDialog(
  context: context,
  builder: (context) => AtomixDialog(
    title: 'Confirm Action',
    content: 'Are you sure?',
    actions: [
      AtomixButton(
        label: 'Cancel',
        onPressed: () => Navigator.pop(context),
        variant: AtomixButtonVariant.tertiary,
      ),
      AtomixButton(
        label: 'Confirm',
        onPressed: () => Navigator.pop(context),
      ),
    ],
  ),
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Icon', type: AtomixDialog)
Widget atomixDialogWithIcon(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixButton(
            label: 'Show Dialog with Icon',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AtomixDialog(
                  icon: Icons.warning,
                  title: 'Warning',
                  content: 'This action cannot be undone.',
                  actions: [
                    AtomixButton(
                      label: 'Cancel',
                      onPressed: () => Navigator.pop(context),
                      variant: AtomixButtonVariant.tertiary,
                    ),
                    AtomixButton(
                      label: 'Delete',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''showDialog(
  context: context,
  builder: (context) => AtomixDialog(
    icon: Icons.warning,
    title: 'Warning',
    content: 'This action cannot be undone.',
    actions: [
      AtomixButton(
        label: 'Cancel',
        onPressed: () => Navigator.pop(context),
        variant: AtomixButtonVariant.tertiary,
      ),
      AtomixButton(
        label: 'Delete',
        onPressed: () => Navigator.pop(context),
      ),
    ],
  ),
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Simple', type: AtomixDialog)
Widget atomixDialogSimple(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixButton(
            label: 'Show Simple Dialog',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AtomixDialog(
                  title: 'Information',
                  content: 'This is a simple informational dialog.',
                  actions: [
                    AtomixButton(
                      label: 'OK',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''showDialog(
  context: context,
  builder: (context) => AtomixDialog(
    title: 'Information',
    content: 'This is a simple informational dialog.',
    actions: [
      AtomixButton(
        label: 'OK',
        onPressed: () => Navigator.pop(context),
      ),
    ],
  ),
)''',
          ),
        ],
      ),
    ),
  );
}
