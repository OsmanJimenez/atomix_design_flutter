import 'package:flutter/material.dart';

/// Atomix corner indicator component.
///
/// A positioning atom that places an indicator (like a dot or badge)
/// on the corner of a child widget.
class AtomixCornerIndicator extends StatelessWidget {
  /// Creates an Atomix corner indicator.
  const AtomixCornerIndicator({
    super.key,
    required this.child,
    required this.indicator,
    this.alignment = Alignment.topRight,
    this.offset = Offset.zero,
  });

  /// The main content.
  final Widget child;

  /// The indicator widget to place in the corner.
  final Widget indicator;

  /// The corner to align the indicator to.
  final Alignment alignment;

  /// Optional offset to fine-tune the indicator's position.
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: alignment.y == -1 ? offset.dy : null,
          bottom: alignment.y == 1 ? offset.dy : null,
          left: alignment.x == -1 ? offset.dx : null,
          right: alignment.x == 1 ? offset.dx : null,
          child: indicator,
        ),
      ],
    );
  }
}
