import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixListTile)
Widget atomixListTileDefault(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixListTile(title: 'List Tile', onTap: () {}),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixListTile(
  title: 'List Tile',
  onTap: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Subtitle', type: AtomixListTile)
Widget atomixListTileWithSubtitle(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixListTile(
            title: 'Settings',
            subtitle: 'Manage your preferences',
            onTap: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixListTile(
  title: 'Settings',
  subtitle: 'Manage your preferences',
  onTap: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Leading Icon', type: AtomixListTile)
Widget atomixListTileWithLeading(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixListTile(
            title: 'Profile',
            subtitle: 'View your profile',
            leading: Icons.person,
            onTap: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixListTile(
  title: 'Profile',
  subtitle: 'View your profile',
  leading: Icons.person,
  onTap: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Trailing', type: AtomixListTile)
Widget atomixListTileWithTrailing(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixListTile(
            title: 'Notifications',
            subtitle: 'Manage notifications',
            leading: Icons.notifications,
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixListTile(
  title: 'Notifications',
  subtitle: 'Manage notifications',
  leading: Icons.notifications,
  trailing: Icon(Icons.chevron_right),
  onTap: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Selected', type: AtomixListTile)
Widget atomixListTileSelected(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixListTile(
            title: 'Selected Item',
            leading: Icons.check,
            selected: true,
            onTap: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixListTile(
  title: 'Selected Item',
  leading: Icons.check,
  selected: true,
  onTap: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: AtomixListTile)
Widget atomixListTileDisabled(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixListTile(
            title: 'Disabled Item',
            subtitle: 'This item is disabled',
            leading: Icons.block,
            enabled: false,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixListTile(
  title: 'Disabled Item',
  subtitle: 'This item is disabled',
  leading: Icons.block,
  enabled: false,
)''',
          ),
        ],
      ),
    ),
  );
}
