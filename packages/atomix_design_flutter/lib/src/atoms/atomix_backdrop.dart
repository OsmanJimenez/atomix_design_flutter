import 'package:flutter/material.dart';

/// Atomix backdrop component.
///
/// A semi-transparent overlay typically used behind modals or drawers.
class AtomixBackdrop extends StatelessWidget {
  /// Creates an Atomix backdrop.
  const AtomixBackdrop({
    super.key,
    this.color,
    this.opacity = 0.5,
    this.onTap,
    this.child,
  });

  /// The color of the backdrop.
  final Color? color;

  /// The opacity of the backdrop.
  final double opacity;

  /// Optional callback when the backdrop is tapped.
  final VoidCallback? onTap;

  /// Optional child widget to display over the backdrop.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: (color ?? Colors.black).withValues(alpha: opacity),
        child: child,
      ),
    );
  }
}
