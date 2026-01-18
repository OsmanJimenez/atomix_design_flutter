import 'package:flutter/material.dart';
import '../foundation/atomix_colors.dart';
import '../foundation/atomix_spacing.dart';
import '../foundation/atomix_radius.dart';

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

  Color _getBackgroundColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    switch (variant) {
      case AtomixBadgeVariant.success:
        return brightness == Brightness.light
            ? AtomixColors.success.withOpacity(0.1)
            : AtomixColors.successDark.withOpacity(0.2);
      case AtomixBadgeVariant.warning:
        return brightness == Brightness.light
            ? AtomixColors.warning.withOpacity(0.1)
            : AtomixColors.warningDark.withOpacity(0.2);
      case AtomixBadgeVariant.error:
        return brightness == Brightness.light
            ? AtomixColors.error.withOpacity(0.1)
            : AtomixColors.errorDark.withOpacity(0.2);
      case AtomixBadgeVariant.info:
        return brightness == Brightness.light
            ? AtomixColors.info.withOpacity(0.1)
            : AtomixColors.infoDark.withOpacity(0.2);
      case AtomixBadgeVariant.neutral:
        return brightness == Brightness.light
            ? AtomixColors.textTertiary.withOpacity(0.1)
            : AtomixColors.textTertiaryDark.withOpacity(0.2);
    }
  }

  Color _getTextColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    switch (variant) {
      case AtomixBadgeVariant.success:
        return brightness == Brightness.light
            ? AtomixColors.successDark
            : AtomixColors.successLight;
      case AtomixBadgeVariant.warning:
        return brightness == Brightness.light
            ? AtomixColors.warningDark
            : AtomixColors.warningLight;
      case AtomixBadgeVariant.error:
        return brightness == Brightness.light
            ? AtomixColors.errorDark
            : AtomixColors.errorLight;
      case AtomixBadgeVariant.info:
        return brightness == Brightness.light
            ? AtomixColors.infoDark
            : AtomixColors.infoLight;
      case AtomixBadgeVariant.neutral:
        return brightness == Brightness.light
            ? AtomixColors.textPrimary
            : AtomixColors.textPrimaryDark;
    }
  }

  @override
  Widget build(BuildContext context) {
    final finalTextColor = textColor ?? _getTextColor(context);
    final finalBackgroundColor =
        backgroundColor ?? _getBackgroundColor(context);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AtomixSpacing.sm,
        vertical: AtomixSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: finalBackgroundColor,
        borderRadius: borderRadius ?? AtomixRadius.smBorderRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: finalTextColor),
            const SizedBox(width: AtomixSpacing.xxs),
          ],
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              color: finalTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
