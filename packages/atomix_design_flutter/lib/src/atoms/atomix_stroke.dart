import 'package:flutter/material.dart';

/// Atomix stroke component.
///
/// An atom that draws a customizable border or line.
class AtomixStroke extends StatelessWidget {
  /// Creates an Atomix stroke.
  const AtomixStroke({
    super.key,
    this.width,
    this.height,
    this.thickness = 1.0,
    this.color,
    this.borderRadius,
    this.child,
  });

  /// The width of the stroke container.
  final double? width;

  /// The height of the stroke container.
  final double? height;

  /// The thickness of the stroke.
  final double thickness;

  /// The color of the stroke.
  final Color? color;

  /// The border radius of the stroke.
  final BorderRadius? borderRadius;

  /// The child widget.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final defaultColor = brightness == Brightness.light
        ? Colors.black12
        : Colors.white12;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: color ?? defaultColor, width: thickness),
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
