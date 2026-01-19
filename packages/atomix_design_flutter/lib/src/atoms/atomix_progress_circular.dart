import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A circular progress indicator that follows the Atomix Design System.
class AtomixProgressCircular extends StatelessWidget {
  /// The progress value (0.0 to 1.0). If null, it's indeterminate.
  final double? value;

  /// The size of the indicator.
  final double size;

  /// The thickness of the line.
  final double strokeWidth;

  /// Color of the indicator.
  final Color? color;

  const AtomixProgressCircular({
    super.key,
    this.value,
    this.size = 24,
    this.strokeWidth = 3,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        value: value,
        strokeWidth: strokeWidth,
        color: color ?? AtomixColors.primary,
        backgroundColor: (color ?? AtomixColors.primary).withValues(alpha: 0.1),
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
