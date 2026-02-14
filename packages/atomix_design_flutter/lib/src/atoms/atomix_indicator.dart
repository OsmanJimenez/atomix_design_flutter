import 'package:flutter/material.dart';
import '../foundation/atomix_radius.dart';

/// Atomix indicator component.
///
/// A small pill-shaped indicator atom, often used for status or progress.
class AtomixIndicator extends StatelessWidget {
  /// Creates an Atomix indicator.
  const AtomixIndicator({
    super.key,
    this.width = 16.0,
    this.height = 4.0,
    this.color,
    this.active = false,
  });

  /// The width of the indicator.
  final double width;

  /// The height of the indicator.
  final double height;

  /// The color of the indicator.
  final Color? color;

  /// Whether the indicator is in an active state.
  final bool active;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final finalColor =
        color ??
        (active
            ? theme.primaryColor
            : theme.disabledColor.withValues(alpha: 0.3));

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: active ? width * 1.5 : width,
      height: height,
      decoration: BoxDecoration(
        color: finalColor,
        borderRadius: AtomixRadius.fullBorderRadius,
      ),
    );
  }
}
