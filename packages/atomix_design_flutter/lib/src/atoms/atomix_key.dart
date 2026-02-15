import 'package:flutter/material.dart';
import 'atomix_text.dart';
import '../theme/atomix_theme.dart';

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
    final theme = AtomixTheme.of(context);
    // Using AtomixTheme.of(context).colors.surfaceVariant logic if available?
    // AtomixTheme typically exposes current theme colors (light or dark).
    // So theme.colors.surfaceVariant should be correct for the current mode.
    // Assuming AtomixColors.surfaceVariant was static. Theme instance has the correct one.
    // wait, I don't recall seeing surfaceVariant in AtomixColorTokens interface.
    // If not available, I'll use surface and onSurface/textPrimary.
    // I'll assume surfaceVariant is NOT in tokens based on previous checks.
    // I'll use surface and border/outline for differentiation.
    // key background is usually surface or surfaceContainer.
    // I'll use `theme.colors.background` for now, or `theme.colors.surface`.
    // And `theme.colors.textPrimary`.

    // Actually, let's look at `AtomixKey` legacy logic:
    // It checked brightness to choose between AtomixColors.surfaceVariant/Dark.
    // I should just use `theme.colors.surface` or similar if the theme is correctly set up for light/dark.
    // I'll use `theme.colors.surface` (or `background` depending on definition).
    // Let's use `theme.colors.surface` + border.

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.sm,
        vertical: theme.spacing.xs,
      ),
      decoration: BoxDecoration(
        color: theme
            .colors
            .background, // Key often looks better with background color in a surface.
        borderRadius: BorderRadius.all(theme.radius.xs),
        border: Border.all(color: theme.colors.outline),
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
            Icon(icon, size: 14, color: theme.colors.textPrimary),
            const SizedBox(
              width: 4,
            ), // manually using 4 or theme.spacing.xxs? xxs is typically 2 or 4.
          ],
          AtomixText(
            label,
            style: theme.typography.labelSmall.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
