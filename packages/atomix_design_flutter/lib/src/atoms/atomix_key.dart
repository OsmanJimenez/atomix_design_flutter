import 'package:flutter/material.dart';
import 'atomix_text.dart';
import '../foundation/atomix_colors.dart';
import '../foundation/atomix_radius.dart';
import '../foundation/atomix_spacing.dart';

/// Atomix key component.
///
/// A styled atom representing a keyboard key.
class AtomixKey extends StatelessWidget {
  /// Creates an Atomix key.
  const AtomixKey({super.key, required this.label, this.icon});

  /// The text label for the key.
  final String label;

  /// Optional icon for the key.
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final backgroundColor = brightness == Brightness.light
        ? AtomixColors.surfaceVariant
        : AtomixColors.surfaceVariantDark;
    final textColor = brightness == Brightness.light
        ? AtomixColors.textPrimary
        : AtomixColors.textPrimaryDark;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AtomixSpacing.sm,
        vertical: AtomixSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AtomixRadius.xsBorderRadius,
        border: Border.all(
          color: brightness == Brightness.light
              ? AtomixColors.outline
              : AtomixColors.outlineDark,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: textColor),
            const SizedBox(width: AtomixSpacing.xxs),
          ],
          AtomixText(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
