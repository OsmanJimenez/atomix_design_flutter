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

  /// Custom background color override.
  final Color? backgroundColor;

  /// Custom text color override.
  final Color? textColor;

  /// Custom border radius override.
  final BorderRadius? borderRadius;

  const AtomixTooltip({
    super.key,
    required this.message,
    required this.child,
    this.triggerMode = TooltipTriggerMode.longPress,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      triggerMode: triggerMode,
      decoration: BoxDecoration(
        color:
            backgroundColor ?? AtomixColors.onBackground.withValues(alpha: 0.9),
        borderRadius: borderRadius ?? AtomixRadius.xsBorderRadius,
      ),
      textStyle: TextStyle(color: textColor ?? Colors.white, fontSize: 12),
      child: child,
    );
  }
}
