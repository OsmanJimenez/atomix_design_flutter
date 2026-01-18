import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixListTile)
Widget atomixListTileDefault(BuildContext context) {
  return Center(
    child: AtomixListTile(title: 'List Tile', onTap: () {}),
  );
}

@widgetbook.UseCase(name: 'With Subtitle', type: AtomixListTile)
Widget atomixListTileWithSubtitle(BuildContext context) {
  return Center(
    child: AtomixListTile(
      title: 'Settings',
      subtitle: 'Manage your preferences',
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'With Leading Icon', type: AtomixListTile)
Widget atomixListTileWithLeading(BuildContext context) {
  return Center(
    child: AtomixListTile(
      title: 'Profile',
      subtitle: 'View your profile',
      leading: Icons.person,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'With Trailing', type: AtomixListTile)
Widget atomixListTileWithTrailing(BuildContext context) {
  return Center(
    child: AtomixListTile(
      title: 'Notifications',
      subtitle: 'Manage notifications',
      leading: Icons.notifications,
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Selected', type: AtomixListTile)
Widget atomixListTileSelected(BuildContext context) {
  return Center(
    child: AtomixListTile(
      title: 'Selected Item',
      leading: Icons.check,
      selected: true,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: AtomixListTile)
Widget atomixListTileDisabled(BuildContext context) {
  return const Center(
    child: AtomixListTile(
      title: 'Disabled Item',
      subtitle: 'This item is disabled',
      leading: Icons.block,
      enabled: false,
    ),
  );
}
