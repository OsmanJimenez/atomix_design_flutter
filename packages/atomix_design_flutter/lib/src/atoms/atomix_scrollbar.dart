import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

/// A wrapper around [RawScrollbar] with Atomix styling.
class AtomixScrollbar extends StatelessWidget {
  /// The scrollable widget.
  final Widget child;

  /// The ScrollController attached to the scrollable widget.
  final ScrollController? controller;

  /// Indicates that the scrollbar thumb should be visible, even when a scroll
  /// is not underneath.
  final bool thumbVisibility;

  /// The thickness of the scrollbar in the cross axis of the scrollable.
  final double? thickness;

  /// The Radius of the scrollbar thumb's corners.
  final Radius? radius;

  const AtomixScrollbar({
    super.key,
    required this.child,
    this.controller,
    this.thumbVisibility = false,
    this.thickness,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return RawScrollbar(
      controller: controller,
      thumbVisibility: thumbVisibility,
      thickness: thickness ?? 6.0,
      radius: radius ?? theme.radius.sm,
      thumbColor: theme.colors.primary.withValues(alpha: 0.5),
      child: child,
    );
  }
}
