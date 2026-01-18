import 'package:flutter/material.dart';
import '../foundation/atomix_elevation.dart';

/// Atomix box component.
///
/// A structural container widget that integrates with Atomix design tokens.
/// Provides a consistent way to apply padding, margin, background colors,
/// border radius, and elevation.
///
/// Example:
/// ```dart
/// AtomixBox(
///   padding: EdgeInsets.all(AtomixSpacing.md),
///   backgroundColor: AtomixColors.surface,
///   borderRadius: AtomixRadius.mdBorderRadius,
///   elevation: AtomixElevation.sm,
///   child: Text('Content'),
/// )
/// ```
class AtomixBox extends StatelessWidget {
  /// Creates an Atomix box.
  const AtomixBox({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.width,
    this.height,
    this.borderRadius,
    this.elevation,
    this.border,
    this.alignment,
  });

  /// The widget below this widget in the tree.
  final Widget? child;

  /// Empty space to inscribe inside the decoration.
  final EdgeInsetsGeometry? padding;

  /// Empty space to surround the decoration and child.
  final EdgeInsetsGeometry? margin;

  /// The color to fill the background of the box.
  final Color? backgroundColor;

  /// The fixed width of the box.
  final double? width;

  /// The fixed height of the box.
  final double? height;

  /// The border radius of the box.
  final BorderRadius? borderRadius;

  /// The elevation of the box (box shadow).
  final double? elevation;

  /// The border to draw around the box.
  final BoxBorder? border;

  /// How to align the child within the box.
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    final effectiveElevation = elevation ?? AtomixElevation.none;

    return Container(
      width: width,
      height: height,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: border,
        boxShadow: effectiveElevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: effectiveElevation,
                  offset: Offset(0, effectiveElevation / 2),
                ),
              ]
            : null,
      ),
      child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
    );
  }
}
