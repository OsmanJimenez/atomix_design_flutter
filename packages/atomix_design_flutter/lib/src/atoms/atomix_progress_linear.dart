import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A linear progress indicator that follows the Atomix Design System.
class AtomixProgressLinear extends StatelessWidget {
  /// The progress value (0.0 to 1.0). If null, it's indeterminate.
  final double? value;

  /// The height of the bar.
  final double height;

  /// Color of the progress bar.
  final Color? color;

  /// Whether to show rounded active corners.
  final bool isRounded;

  const AtomixProgressLinear({
    super.key,
    this.value,
    this.height = 8,
    this.color,
    this.isRounded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: isRounded
            ? AtomixRadius.fullBorderRadius
            : BorderRadius.zero,
      ),
      child: LinearProgressIndicator(
        value: value,
        color: color ?? AtomixColors.primary,
        backgroundColor: (color ?? AtomixColors.primary).withValues(alpha: 0.1),
      ),
    );
  }
}
