import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A visual indicator for selected tabs or navigation states.
class AtomixTabIndicator extends StatelessWidget {
  /// Whether the tab is active.
  final bool isActive;

  /// Color of the indicator.
  final Color? color;

  /// Thickness of the indicator.
  final double height;

  const AtomixTabIndicator({
    super.key,
    required this.isActive,
    this.color,
    this.height = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AtomixAnimations.fast,
      curve: AtomixAnimations.standard,
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isActive ? (color ?? AtomixColors.primary) : Colors.transparent,
        borderRadius: BorderRadius.vertical(top: Radius.circular(height)),
      ),
    );
  }
}
