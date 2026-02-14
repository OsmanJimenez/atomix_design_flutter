import 'package:flutter/material.dart';
import '../foundation/atomix_radius.dart';

/// Atomix color box component.
///
/// A simple box atom that displays a color, useful for style guides or swatches.
class AtomixColorBox extends StatelessWidget {
  /// Creates an Atomix color box.
  const AtomixColorBox({
    super.key,
    required this.color,
    this.size = 48.0,
    this.borderRadius,
    this.border,
  });

  /// The color to display.
  final Color color;

  /// The size (width and height) of the box.
  final double size;

  /// The border radius of the box.
  final BorderRadius? borderRadius;

  /// The border of the box.
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? AtomixRadius.smBorderRadius,
        border: border,
      ),
    );
  }
}
