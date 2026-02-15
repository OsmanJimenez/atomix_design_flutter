import 'package:flutter/material.dart';
import '../theme/atomix_theme.dart';
import '../../atomix_design_flutter.dart'; // Import for AtomixTheme.of accesses if needed elsewhere or strictly keeping imports clean

/// Atomix divider component.
///
/// A simple wrapper around Flutter's Divider widget that uses Atomix design tokens.
/// Provides consistent divider rendering across the design system.
///
/// Example:
/// ```dart
/// AtomixDivider()
/// AtomixDivider(height: 32, thickness: 2)
/// ```
class AtomixDivider extends StatelessWidget {
  /// Creates an Atomix divider widget.
  const AtomixDivider({
    super.key,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.label,
    this.labelStyle,
    this.direction = Axis.horizontal,
  });

  /// The divider's height extent.
  final double? height;

  /// The thickness of the line drawn within the divider.
  final double? thickness;

  /// The amount of empty space to the leading edge of the divider.
  final double? indent;

  /// The amount of empty space to the trailing edge of the divider.
  final double? endIndent;

  /// The color to use when painting the line.
  final Color? color;

  /// Optional text label to display in the middle of the divider.
  final String? label;

  /// The style of the label text.
  final TextStyle? labelStyle;

  /// The direction of the divider (horizontal or vertical).
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final effectiveColor = color ?? theme.colors.divider;

    if (direction == Axis.vertical) {
      if (label != null) {
        return Column(
          children: [
            Expanded(
              child: VerticalDivider(
                width: height,
                thickness: thickness,
                indent: indent,
                endIndent: 8,
                color: effectiveColor,
              ),
            ),
            Text(
              label!,
              style:
                  labelStyle ??
                  theme.typography.labelSmall.copyWith(
                    color: theme.colors.textSecondary,
                  ),
            ),
            Expanded(
              child: VerticalDivider(
                width: height,
                thickness: thickness,
                indent: 8,
                endIndent: endIndent,
                color: effectiveColor,
              ),
            ),
          ],
        );
      }

      return VerticalDivider(
        width: height,
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
        color: effectiveColor,
      );
    }

    if (label != null) {
      return Row(
        children: [
          Expanded(
            child: Divider(
              height: height,
              thickness: thickness,
              indent: indent,
              endIndent: 8,
              color: effectiveColor,
            ),
          ),
          Text(
            label!,
            style:
                labelStyle ??
                theme.typography.labelSmall.copyWith(
                  color: theme.colors.textSecondary,
                ),
          ),
          Expanded(
            child: Divider(
              height: height,
              thickness: thickness,
              indent: 8,
              endIndent: endIndent,
              color: effectiveColor,
            ),
          ),
        ],
      );
    }

    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: effectiveColor,
    );
  }
}
