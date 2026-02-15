import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

/// An overlay component usually used for modals or blocking interaction.
class AtomixOverlay extends StatelessWidget {
  /// The child widget (optional).
  final Widget? child;

  /// Callback when the overlay is tapped.
  final VoidCallback? onTap;

  /// Custom color for the overlay.
  final Color? color;

  /// Whether the overlay is visible.
  final bool isVisible;

  const AtomixOverlay({
    super.key,
    this.child,
    this.onTap,
    this.color,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    final theme = AtomixTheme.of(context);

    // If onTap is provided, wrap in GestureDetector to catch taps
    // otherwise just render the colored container
    Widget content = Container(
      color: color ?? theme.colors.overlay,
      child: child,
    );

    if (onTap != null) {
      content = GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: content,
      );
    }

    return content;
  }
}
