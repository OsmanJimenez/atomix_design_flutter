import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixToast extends StatelessWidget {
  final String message;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onAction;
  final String? actionLabel;

  const AtomixToast({
    super.key,
    required this.message,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.onAction,
    this.actionLabel,
  });

  /// Shows the toast using ScaffoldMessenger.
  static void show(
    BuildContext context, {
    required String message,
    Widget? icon,
    Duration duration = const Duration(seconds: 4),
    AtomixAlertType type = AtomixAlertType.info,
    VoidCallback? onAction,
    String? actionLabel,
  }) {
    final theme = AtomixTheme.of(context);
    Color getBgColor() {
      switch (type) {
        case AtomixAlertType.info:
          return theme.colors.surface;
        case AtomixAlertType.success:
          return theme.colors.success;
        case AtomixAlertType.warning:
          return theme.colors.warning;
        case AtomixAlertType.error:
          return theme.colors.error;
      }
    }

    final bgColor = type == AtomixAlertType.info
        ? theme.colors.surfaceVariant
        : getBgColor();

    final fgColor = type == AtomixAlertType.info
        ? theme.colors.textPrimary
        : Colors.white;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AtomixToast(
          message: message,
          icon: icon,
          backgroundColor:
              Colors.transparent, // Handled by SnackBar or Container
          textColor: fgColor,
        ),
        backgroundColor: bgColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(theme.radius.md),
        ),
        action: onAction != null && actionLabel != null
            ? SnackBarAction(
                label: actionLabel,
                textColor: fgColor,
                onPressed: onAction,
              )
            : null,
        duration: duration,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[icon!, const SizedBox(width: 12)],
        Expanded(
          child: Text(
            message,
            style: theme.typography.bodyMedium.copyWith(
              color: textColor ?? theme.colors.surface,
            ),
          ),
        ),
        if (onAction != null && actionLabel != null) ...[
          const SizedBox(width: 8),
          // Action is typically handled by SnackBar, but if used independently:
          TextButton(
            onPressed: onAction,
            child: Text(
              actionLabel!,
              style: theme.typography.labelLarge.copyWith(
                color: textColor ?? theme.colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
