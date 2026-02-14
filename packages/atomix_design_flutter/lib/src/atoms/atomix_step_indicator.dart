import 'package:flutter/material.dart';
import 'atomix_text.dart';
import '../foundation/atomix_colors.dart';

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
    final theme = Theme.of(context);
    final brightness = theme.brightness;

    Color backgroundColor;
    Color textColor;
    Border? border;

    if (completed) {
      backgroundColor = AtomixColors.success;
      textColor = Colors.white;
    } else if (active) {
      backgroundColor = theme.primaryColor;
      textColor = Colors.white;
    } else {
      backgroundColor = Colors.transparent;
      textColor = brightness == Brightness.light
          ? AtomixColors.textSecondary
          : AtomixColors.textSecondaryDark;
      border = Border.all(
        color: brightness == Brightness.light
            ? AtomixColors.outline
            : AtomixColors.outlineDark,
      );
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
              style: theme.textTheme.labelMedium?.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
