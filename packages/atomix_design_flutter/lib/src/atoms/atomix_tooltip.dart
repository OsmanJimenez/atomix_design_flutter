import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A simple Tooltip component.
class AtomixTooltip extends StatelessWidget {
  /// The message to display.
  final String message;

  /// The widget that triggers the tooltip.
  final Widget child;

  /// Position of the tooltip.
  final TooltipTriggerMode triggerMode;

  const AtomixTooltip({
    super.key,
    required this.message,
    required this.child,
    this.triggerMode = TooltipTriggerMode.longPress,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      triggerMode: triggerMode,
      decoration: BoxDecoration(
        color: AtomixColors.onBackground.withValues(alpha: 0.9),
        borderRadius: AtomixRadius.xsBorderRadius,
      ),
      textStyle: const TextStyle(color: Colors.white, fontSize: 12),
      child: child,
    );
  }
}
