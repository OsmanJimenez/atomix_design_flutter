import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/ButtonGroup',
  type: AtomixButtonGroup,
)
Widget atomixButtonGroupPlayground(BuildContext context) {
  final orientation = context.knobs.object
      .dropdown<AtomixButtonGroupOrientation>(
        label: 'Orientation',
        options: AtomixButtonGroupOrientation.values,
        initialOption: AtomixButtonGroupOrientation.horizontal,
        labelBuilder: (o) => o.name,
      );

  final spacing = context.knobs.double.slider(
    label: 'Spacing',
    initialValue: 8,
    min: 0,
    max: 32,
  );

  final code =
      '''AtomixButtonGroup(
  orientation: AtomixButtonGroupOrientation.${orientation.name},
  spacing: $spacing,
  children: [
    AtomixButton(label: 'Save', variant: AtomixButtonVariant.primary, onPressed: () {}),
    AtomixButton(label: 'Cancel', variant: AtomixButtonVariant.secondary, onPressed: () {}),
    AtomixButton(label: 'More', variant: AtomixButtonVariant.tertiary, onPressed: () {}),
  ],
)''';

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixButtonGroup(
            orientation: orientation,
            spacing: spacing,
            children: [
              AtomixButton(
                label: 'Save',
                variant: AtomixButtonVariant.primary,
                onPressed: () {},
              ),
              AtomixButton(
                label: 'Cancel',
                variant: AtomixButtonVariant.secondary,
                onPressed: () {},
              ),
              AtomixButton(
                label: 'More',
                variant: AtomixButtonVariant.tertiary,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Horizontal Actions',
  path: '[Molecules]/ButtonGroup',
  type: AtomixButtonGroup,
)
Widget atomixButtonGroupHorizontal(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixButtonGroup(
            orientation: AtomixButtonGroupOrientation.horizontal,
            children: [
              AtomixButton(
                label: 'Confirm',
                variant: AtomixButtonVariant.primary,
                onPressed: () {},
              ),
              AtomixButton(
                label: 'Cancel',
                variant: AtomixButtonVariant.secondary,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButtonGroup(
  orientation: AtomixButtonGroupOrientation.horizontal,
  children: [
    AtomixButton(label: 'Confirm', variant: AtomixButtonVariant.primary, onPressed: () {}),
    AtomixButton(label: 'Cancel', variant: AtomixButtonVariant.secondary, onPressed: () {}),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Vertical Stack',
  path: '[Molecules]/ButtonGroup',
  type: AtomixButtonGroup,
)
Widget atomixButtonGroupVertical(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixButtonGroup(
            orientation: AtomixButtonGroupOrientation.vertical,
            spacing: 12,
            children: [
              AtomixButton(
                label: 'Edit Profile',
                variant: AtomixButtonVariant.primary,
                onPressed: () {},
              ),
              AtomixButton(
                label: 'Change Password',
                variant: AtomixButtonVariant.secondary,
                onPressed: () {},
              ),
              AtomixButton(
                label: 'Logout',
                variant: AtomixButtonVariant.tertiary,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButtonGroup(
  orientation: AtomixButtonGroupOrientation.vertical,
  spacing: 12,
  children: [
    AtomixButton(label: 'Edit Profile', variant: AtomixButtonVariant.primary, onPressed: () {}),
    AtomixButton(label: 'Change Password', variant: AtomixButtonVariant.secondary, onPressed: () {}),
    AtomixButton(label: 'Logout', variant: AtomixButtonVariant.tertiary, onPressed: () {}),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}
