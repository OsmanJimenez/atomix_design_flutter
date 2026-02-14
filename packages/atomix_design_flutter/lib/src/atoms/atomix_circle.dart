import 'package:flutter/material.dart';

/// Atomix circle component.
///
/// A basic circular container atom.
class AtomixCircle extends StatelessWidget {
  /// Creates an Atomix circle.
  const AtomixCircle({
    super.key,
    this.radius = 24.0,
    this.color,
    this.child,
    this.border,
    this.backgroundImage,
  });

  /// The radius of the circle.
  final double radius;

  /// The background color of the circle.
  final Color? color;

  /// The child widget to display inside the circle.
  final Widget? child;

  /// The border to draw around the circle.
  final BoxBorder? border;

  /// The background image of the circle.
  final DecorationImage? backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: border,
        image: backgroundImage,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
