import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/MenuItem',
  type: AtomixMenuItem,
)
Widget atomixMenuItemPlayground(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: 'Settings');

  final isDestructive = context.knobs.boolean(
    label: 'Is Destructive',
    initialValue: false,
  );

  final isDisabled = context.knobs.boolean(
    label: 'Is Disabled',
    initialValue: false,
  );

  final showTrailing = context.knobs.boolean(
    label: 'Show Trailing',
    initialValue: true,
  );

  final code =
      '''AtomixMenuItem(
  label: '$label',
  icon: Icons.settings,
  isDestructive: $isDestructive,
  isDisabled: $isDisabled,
  trailing: ${showTrailing ? 'Icon(Icons.chevron_right, size: 20)' : 'null'},
  onTap: () {},
)''';

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AtomixMenuItem(
                  label: label,
                  icon: Icons.settings,
                  isDestructive: isDestructive,
                  isDisabled: isDisabled,
                  trailing: showTrailing
                      ? const Icon(Icons.chevron_right, size: 20)
                      : null,
                  onTap: () {},
                ),
                const Divider(height: 1),
                AtomixMenuItem(
                  label: 'Profile',
                  icon: Icons.person,
                  onTap: () {},
                ),
                const Divider(height: 1),
                AtomixMenuItem(
                  label: 'Logout',
                  icon: Icons.logout,
                  isDestructive: true,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Menu List',
  path: '[Molecules]/MenuItem',
  type: AtomixMenuItem,
)
Widget atomixMenuItemList(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AtomixMenuItem(
                  label: 'Account',
                  icon: Icons.person,
                  onTap: () {},
                ),
                const Divider(height: 1),
                AtomixMenuItem(
                  label: 'Notifications',
                  icon: Icons.notifications,
                  onTap: () {},
                ),
                const Divider(height: 1),
                AtomixMenuItem(
                  label: 'Privacy',
                  icon: Icons.lock,
                  onTap: () {},
                ),
                const Divider(height: 1),
                AtomixMenuItem(label: 'Help', icon: Icons.help, onTap: () {}),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''Container(
  decoration: BoxDecoration(border: Border.all(...)),
  child: Column(
    children: [
      AtomixMenuItem(label: 'Account', icon: Icons.person, onTap: () {}),
      Divider(height: 1),
      AtomixMenuItem(label: 'Notifications', icon: Icons.notifications, onTap: () {}),
      Divider(height: 1),
      AtomixMenuItem(label: 'Privacy', icon: Icons.lock, onTap: () {}),
    ],
  ),
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Destructive Action',
  path: '[Molecules]/MenuItem',
  type: AtomixMenuItem,
)
Widget atomixMenuItemDestructive(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AtomixMenuItem(label: 'Edit', icon: Icons.edit, onTap: () {}),
                const Divider(height: 1),
                AtomixMenuItem(label: 'Share', icon: Icons.share, onTap: () {}),
                const Divider(height: 1),
                AtomixMenuItem(
                  label: 'Delete',
                  icon: Icons.delete,
                  isDestructive: true,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixMenuItem(
  label: 'Delete',
  icon: Icons.delete,
  isDestructive: true,
  onTap: () {},
)''',
          ),
        ],
      ),
    ),
  );
}
