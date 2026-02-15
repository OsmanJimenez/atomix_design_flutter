import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixExpansionTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final List<Widget> children;
  final bool initiallyExpanded;
  final ValueChanged<bool>? onExpansionChanged;

  const AtomixExpansionTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    required this.children,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return ExpansionTile(
      title: Text(
        title,
        style: theme.typography.titleMedium.copyWith(
          color: theme.colors.textPrimary,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: theme.typography.bodySmall.copyWith(
                color: theme.colors.textSecondary,
              ),
            )
          : null,
      leading: leading,
      initiallyExpanded: initiallyExpanded,
      onExpansionChanged: onExpansionChanged,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(theme.radius.md),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(theme.radius.md),
      ),
      children: children,
    );
  }
}
