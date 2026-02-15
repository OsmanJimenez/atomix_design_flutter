import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixMenuItem extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isDestructive;
  final bool isDisabled;
  final Widget? trailing;

  const AtomixMenuItem({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
    this.isDestructive = false,
    this.isDisabled = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    final textColor = isDisabled
        ? theme.colors.textDisabled
        : (isDestructive ? theme.colors.error : theme.colors.textPrimary);

    return InkWell(
      onTap: isDisabled ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20, color: textColor),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                label,
                style: theme.typography.bodyMedium.copyWith(color: textColor),
              ),
            ),
            if (trailing != null) ...[const SizedBox(width: 8), trailing!],
          ],
        ),
      ),
    );
  }
}
