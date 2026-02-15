import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A basic Skeleton shape for loading placeholders.
class AtomixSkeleton extends StatelessWidget {
  /// Width of the skeleton.
  final double? width;

  /// Height of the skeleton.
  final double? height;

  /// Border radius of the skeleton.
  final BorderRadius? borderRadius;

  /// Whether the skeleton is circular.
  final bool isCircle;

  /// Custom color for the skeleton.
  final Color? color;

  const AtomixSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.isCircle = false,
    this.color,
    this.animate = true,
  });

  /// Whether to animate the skeleton (shimmer effect).
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final container = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? theme.colors.border.withValues(alpha: 0.5),
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle
            ? null
            : (borderRadius ?? BorderRadius.all(theme.radius.sm)),
      ),
    );

    if (animate) {
      return AtomixShimmer(
        baseColor: color ?? theme.colors.border.withValues(alpha: 0.5),
        highlightColor: theme.colors.surface,
        child: container,
      );
    }

    return container;
  }
}
