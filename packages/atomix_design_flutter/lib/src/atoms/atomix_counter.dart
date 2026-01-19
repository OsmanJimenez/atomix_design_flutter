import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A small numeric counter or badge indicator.
class AtomixCounter extends StatelessWidget {
  /// The count to display.
  final int count;

  /// Maximum count to show (e.g., 99+).
  final int maxCount;

  /// Color of the counter background.
  final Color? backgroundColor;

  /// Custom size for the counter.
  final double size;

  const AtomixCounter({
    super.key,
    required this.count,
    this.maxCount = 99,
    this.backgroundColor,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();

    final displayCount = count > maxCount ? '$maxCount+' : '$count';

    return Container(
      width: displayCount.length > 2 ? null : size,
      height: size,
      constraints: BoxConstraints(minWidth: size),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? AtomixColors.primary,
        borderRadius: BorderRadius.circular(size),
      ),
      child: Center(
        child: AtomixText(
          displayCount,
          style: TextStyle(
            color: AtomixColors.onPrimary,
            fontSize: size * 0.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
