import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart'; // Ensure main package is imported for AtomixText maybe?

/// Atomix step indicator component.
///
/// A small circular atom used to indicate a step or index.
class AtomixStepIndicator extends StatelessWidget {
  /// Creates an Atomix step indicator.
  const AtomixStepIndicator({
    super.key,
    required this.step,
    this.size = 28.0,
    this.active = false,
    this.completed = false,
  });

  /// The step number or label to display.
  final int step;

  /// The size (diameter) of the indicator.
  final double size;

  /// Whether this step is currently active.
  final bool active;

  /// Whether this step is completed.
  final bool completed;

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    // Accessing Flutter Theme brightness is fine for now as AtomixTheme usually syncs.
    // Actually, distinct light/dark logic is usually handled inside tokens.
    // usage:
    // inactive text color: theme.colors.textSecondary
    // inactive border color: theme.colors.border

    Color backgroundColor;
    Color textColor;
    Border? border;

    if (completed) {
      backgroundColor = theme.colors.success;
      textColor = theme
          .colors
          .onPrimary; // Assuming white is onPrimary or success text color.
      // AtomixColors.success text was white. onPrimary is usually white/black.
      // Let's use Colors.white for now to match exactly what was there, or check if we have onSuccess?
      // AtomixColorTokens usually has onPrimary, onSecondary. Maybe not onSemantic?
      // If not, keep Colors.white for success background.
    } else if (active) {
      backgroundColor = theme.colors.primary;
      textColor = theme.colors.onPrimary;
    } else {
      backgroundColor = Colors.transparent;
      textColor = theme.colors.textSecondary;
      border = Border.all(color: theme.colors.border);
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: border,
      ),
      alignment: Alignment.center,
      child: completed
          ? Icon(Icons.check, size: size * 0.6, color: textColor)
          : AtomixText(
              step.toString(),
              style: theme.typography.labelMedium.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
