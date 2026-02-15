import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

enum AtomixAlertType { info, success, warning, error }

class AtomixAlert extends StatelessWidget {
  final String title;
  final String? description;
  final AtomixAlertType type;
  final VoidCallback? onClose;
  final Widget? icon;
  final Widget? action;

  const AtomixAlert({
    super.key,
    required this.title,
    this.description,
    this.type = AtomixAlertType.info,
    this.onClose,
    this.icon,
    this.action,
  });

  Color _getColor(AtomixThemeData theme) {
    switch (type) {
      case AtomixAlertType.info:
        return theme.colors.info;
      case AtomixAlertType.success:
        return theme.colors.success;
      case AtomixAlertType.warning:
        return theme.colors.warning;
      case AtomixAlertType.error:
        return theme.colors.error;
    }
  }

  IconData _getIcon() {
    switch (type) {
      case AtomixAlertType.info:
        return Icons.info_outline;
      case AtomixAlertType.success:
        return Icons.check_circle_outline;
      case AtomixAlertType.warning:
        return Icons.warning_amber_rounded;
      case AtomixAlertType.error:
        return Icons.error_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final color = _getColor(theme);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.all(theme.radius.md),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(_getIcon(), color: color, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.typography.titleMedium.copyWith(
                    color: theme.colors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    description!,
                    style: theme.typography.bodyMedium.copyWith(
                      color: theme.colors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (action != null) ...[const SizedBox(width: 8), action!],
          if (onClose != null) ...[
            const SizedBox(width: 8),
            InkWell(
              onTap: onClose,
              borderRadius: BorderRadius.circular(100),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.close,
                  color: theme.colors.textSecondary,
                  size: 20,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
