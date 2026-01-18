import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }
}
