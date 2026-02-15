import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isThreeLine;

  const AtomixListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.isThreeLine = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return ListTile(
      title: Text(
        title,
        style: theme.typography.bodyLarge.copyWith(
          color: theme.colors.textPrimary,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: theme.typography.bodyMedium.copyWith(
                color: theme.colors.textSecondary,
              ),
            )
          : null,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
      isThreeLine: isThreeLine,
    );
  }
}
