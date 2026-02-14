import 'package:flutter/material.dart';
import '../foundation/atomix_colors.dart';
import '../foundation/atomix_radius.dart';

/// Atomix handle component.
///
/// A decorative drag handle atom, typically used in bottom sheets or draggables.
class AtomixHandle extends StatelessWidget {
  /// Creates an Atomix handle.
  const AtomixHandle({
    super.key,
    this.width = 32.0,
    this.height = 4.0,
    this.color,
  });

  /// The width of the handle.
  final double width;

  /// The height of the handle.
  final double height;

  /// The color of the handle.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final defaultColor = brightness == Brightness.light
        ? AtomixColors.outline
        : AtomixColors.outlineDark;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? defaultColor,
        borderRadius: AtomixRadius.fullBorderRadius,
      ),
    );
  }
}
