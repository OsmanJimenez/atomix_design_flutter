import 'package:flutter/material.dart';
import '../theme/atomix_theme.dart';
import '../theme/atomix_theme_data.dart';
// import '../foundation/atomix_colors.dart';
// import '../foundation/atomix_spacing.dart';
// import '../foundation/atomix_radius.dart';

/// Badge variant types.
enum AtomixBadgeVariant {
  /// Neutral badge (default)
  neutral,

  /// Success badge (green)
  success,

  /// Warning badge (yellow/orange)
  warning,

  /// Error badge (red)
  error,

  /// Info badge (blue)
  info,
}

/// Atomix badge component.
///
/// A small label component used to display status, counts, or categories.
/// Supports multiple variants for different semantic meanings.
///
/// Example:
/// ```dart
/// AtomixBadge(
///   label: 'New',
///   variant: AtomixBadgeVariant.success,
/// )
/// ```
class AtomixBadge extends StatelessWidget {
  /// Creates an Atomix badge.
  const AtomixBadge({
    super.key,
    required this.label,
    this.variant = AtomixBadgeVariant.neutral,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
  });

  /// The text to display in the badge.
  final String label;

  /// The visual variant of the badge.
  final AtomixBadgeVariant variant;

  /// Optional icon to display before the label.
  final IconData? icon;

  /// Optional background color override.
  final Color? backgroundColor;

  /// Optional text color override.
  final Color? textColor;

  /// Optional border radius override.
  final BorderRadius? borderRadius;

  Color _getBackgroundColor(AtomixThemeData theme, Brightness brightness) {
    final alpha = brightness == Brightness.light ? 0.1 : 0.2;
    switch (variant) {
      case AtomixBadgeVariant.success:
        return theme.colors.success.withValues(alpha: alpha);
      case AtomixBadgeVariant.warning:
        return theme.colors.warning.withValues(alpha: alpha);
      case AtomixBadgeVariant.error:
        return theme.colors.error.withValues(alpha: alpha);
      case AtomixBadgeVariant.info:
        return theme.colors.info.withValues(alpha: alpha);
      case AtomixBadgeVariant.neutral:
        return theme.colors.textTertiary.withValues(alpha: alpha);
    }
  }

  Color _getTextColor(AtomixThemeData theme) {
    // For tinted badges, we use the base color as text color usually, or a darker version?
    // Current tokens don't support "SuccessDark", so we use the base success color.
    // Ideally, we'd have onSuccessContainer.
    switch (variant) {
      case AtomixBadgeVariant.success:
        return theme.colors.success;
      case AtomixBadgeVariant.warning:
        return theme.colors.warning;
      case AtomixBadgeVariant.error:
        return theme.colors.error;
      case AtomixBadgeVariant.info:
        return theme.colors.info;
      case AtomixBadgeVariant.neutral:
        return theme.colors.textPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final brightness = Theme.of(
      context,
    ).brightness; // Or theme.brightness if available in our data? No.

    final finalTextColor = textColor ?? _getTextColor(theme);
    final finalBackgroundColor =
        backgroundColor ?? _getBackgroundColor(theme, brightness);
    final textTheme = theme.typography;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.sm,
        vertical: theme.spacing.xxs,
      ),
      decoration: BoxDecoration(
        color: finalBackgroundColor,
        borderRadius: borderRadius ?? BorderRadius.all(theme.radius.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: finalTextColor),
            SizedBox(width: theme.spacing.xxs),
          ],
          Text(
            label,
            style: textTheme.labelSmall.copyWith(
              color: finalTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
