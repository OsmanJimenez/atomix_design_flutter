import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/UserProfile',
  type: AtomixUserProfile,
)
Widget atomixUserProfilePlayground(BuildContext context) {
  final name = context.knobs.string(label: 'Name', initialValue: 'John Doe');

  final role = context.knobs.string(
    label: 'Role',
    initialValue: 'Software Engineer',
  );

  final showTrailing = context.knobs.boolean(
    label: 'Show Trailing Icon',
    initialValue: true,
  );

  final code =
      '''AtomixUserProfile(
  name: '$name',
  role: '${role.isNotEmpty ? role : null}',
  initials: 'JD',
  onTap: () {},
  trailing: ${showTrailing ? 'Icon(Icons.chevron_right)' : 'null'},
)''';

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixUserProfile(
            name: name,
            role: role.isNotEmpty ? role : null,
            initials: 'JD',
            onTap: () {},
            trailing: showTrailing ? const Icon(Icons.chevron_right) : null,
          ),
          const SizedBox(height: 24),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Avatar',
  path: '[Molecules]/UserProfile',
  type: AtomixUserProfile,
)
Widget atomixUserProfileWithAvatar(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixUserProfile(
            name: 'Jane Smith',
            role: 'Product Manager',
            avatarUrl: 'https://i.pravatar.cc/150?img=5',
            onTap: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixUserProfile(
  name: 'Jane Smith',
  role: 'Product Manager',
  avatarUrl: 'https://i.pravatar.cc/150?img=5',
  onTap: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Initials',
  path: '[Molecules]/UserProfile',
  type: AtomixUserProfile,
)
Widget atomixUserProfileInitials(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixUserProfile(
            name: 'Robert Johnson',
            role: 'UX Designer',
            initials: 'RJ',
            onTap: () {},
            trailing: const Icon(Icons.more_vert),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixUserProfile(
  name: 'Robert Johnson',
  role: 'UX Designer',
  initials: 'RJ',
  onTap: () {},
  trailing: Icon(Icons.more_vert),
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Simple Profile',
  path: '[Molecules]/UserProfile',
  type: AtomixUserProfile,
)
Widget atomixUserProfileSimple(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixUserProfile(
            name: 'Alice Williams',
            initials: 'AW',
            onTap: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixUserProfile(
  name: 'Alice Williams',
  initials: 'AW',
  onTap: () {},
)''',
          ),
        ],
      ),
    ),
  );
}
