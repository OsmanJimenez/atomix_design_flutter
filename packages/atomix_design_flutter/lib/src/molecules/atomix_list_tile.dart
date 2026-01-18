import 'package:flutter/material.dart';
import '../foundation/atomix_spacing.dart';

/// Atomix list tile component.
///
/// A single fixed-height row that typically contains some text as well as
/// a leading or trailing icon. Built on top of Material ListTile.
///
/// Example:
/// ```dart
/// AtomixListTile(
///   title: 'Settings',
///   subtitle: 'Manage your preferences',
///   leading: Icons.settings,
///   onTap: () => print('Tapped'),
/// )
/// ```
class AtomixListTile extends StatelessWidget {
  /// Creates an Atomix list tile.
  const AtomixListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.enabled = true,
    this.selected = false,
  });

  /// The primary content of the list tile.
  final String title;

  /// Additional content displayed below the title.
  final String? subtitle;

  /// A widget to display before the title (typically an icon).
  final IconData? leading;

  /// A widget to display after the title (typically an icon or text).
  final Widget? trailing;

  /// Called when the user taps this list tile.
  final VoidCallback? onTap;

  /// Whether this list tile is interactive.
  final bool enabled;

  /// Whether this list tile is selected.
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      leading: leading != null ? Icon(leading) : null,
      trailing: trailing,
      onTap: enabled ? onTap : null,
      enabled: enabled,
      selected: selected,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AtomixSpacing.md,
        vertical: AtomixSpacing.xs,
      ),
    );
  }
}
