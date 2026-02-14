import 'package:flutter/material.dart';

/// Atomix mask component.
///
/// An atom that masks its child with a specified shape or clipper.
class AtomixMask extends StatelessWidget {
  /// Creates an Atomix mask.
  const AtomixMask({
    super.key,
    required this.child,
    this.clipper,
    this.clipBehavior = Clip.antiAlias,
  });

  /// The widget to mask.
  final Widget child;

  /// The clipper that determines the mask shape.
  final CustomClipper<Path>? clipper;

  /// How to clip the child.
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: clipper, clipBehavior: clipBehavior, child: child);
  }
}
