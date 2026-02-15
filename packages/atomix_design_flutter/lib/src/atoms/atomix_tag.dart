import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A small decorative Tag component.
class AtomixTag extends StatelessWidget {
  /// The text to display.
  final String label;

  /// Optional icon to display before the text.
  final IconData? icon;

  /// Color of the tag (will affect border and text if not overridden).
  final Color? color;

  /// Custom background color override.
  final Color? backgroundColor;

  /// Custom text and icon color override.
  final Color? textColor;

  /// Custom border radius override.
  final BorderRadius? borderRadius;

  const AtomixTag({
    super.key,
    required this.label,
    this.icon,
    this.color,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final effectiveColor = color ?? theme.colors.primary;
    final finalTextColor = textColor ?? effectiveColor;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.sm,
        vertical: theme.spacing.xs / 2,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? effectiveColor.withValues(alpha: 0.1),
        borderRadius: borderRadius ?? BorderRadius.all(theme.radius.xs),
        border: Border.all(color: effectiveColor.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: finalTextColor),
            AtomixSpacer.xs(),
          ],
          AtomixText(
            label.toUpperCase(),
            style: TextStyle(
              color: finalTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 10,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
