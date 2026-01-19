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

  const AtomixSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AtomixColors.border.withValues(alpha: 0.5),
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle
            ? null
            : (borderRadius ?? AtomixRadius.smBorderRadius),
      ),
    );
  }
}
