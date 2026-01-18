import 'package:flutter/material.dart';

/// Atomix icon component.
///
/// A simple wrapper around Flutter's Icon widget that uses Atomix design tokens.
/// Provides consistent icon rendering across the design system.
///
/// Example:
/// ```dart
/// AtomixIcon(
///   Icons.home,
///   size: 24,
///   color: Theme.of(context).colorScheme.primary,
/// )
/// ```
class AtomixIcon extends StatelessWidget {
  /// Creates an Atomix icon widget.
  const AtomixIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
  });

  /// The icon to display.
  final IconData icon;

  /// The size of the icon in logical pixels.
  final double? size;

  /// The color to use when drawing the icon.
  final Color? color;

  /// Semantic label for the icon.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: color, semanticLabel: semanticLabel);
  }
}
