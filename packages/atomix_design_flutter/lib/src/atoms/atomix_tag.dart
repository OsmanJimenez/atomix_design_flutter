import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A small decorative Tag component.
class AtomixTag extends StatelessWidget {
  /// The text to display.
  final String label;

  /// Optional icon to display before the text.
  final IconData? icon;

  /// Color of the tag. Defaults to primary.
  final Color? color;

  const AtomixTag({super.key, required this.label, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AtomixColors.primary;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AtomixSpacing.sm,
        vertical: AtomixSpacing.xs / 2,
      ),
      decoration: BoxDecoration(
        color: effectiveColor.withValues(alpha: 0.1),
        borderRadius: AtomixRadius.xsBorderRadius,
        border: Border.all(color: effectiveColor.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: effectiveColor),
            const AtomixSpacer.xs(),
          ],
          AtomixText(
            label.toUpperCase(),
            style: TextStyle(
              color: effectiveColor,
              fontWeight: FontWeight.bold,
              fontSize: 10,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
