import 'package:flutter/material.dart';
import '../foundation/atomix_radius.dart';

/// Atomix gradient component.
///
/// A container atom with a customizable gradient background.
class AtomixGradient extends StatelessWidget {
  /// Creates an Atomix gradient.
  const AtomixGradient({
    super.key,
    required this.colors,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.child,
    this.borderRadius,
    this.width,
    this.height,
  });

  /// The colors to use in the gradient.
  final List<Color> colors;

  /// The starting point of the gradient.
  final AlignmentGeometry begin;

  /// The ending point of the gradient.
  final AlignmentGeometry end;

  /// The child widget.
  final Widget? child;

  /// The border radius of the container.
  final BorderRadius? borderRadius;

  /// Optional width.
  final double? width;

  /// Optional height.
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: begin, end: end, colors: colors),
        borderRadius: borderRadius ?? AtomixRadius.smBorderRadius,
      ),
      child: child,
    );
  }
}
