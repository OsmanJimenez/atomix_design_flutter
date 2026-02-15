import 'package:flutter/material.dart';
import '../theme/atomix_theme.dart';

/// Atomix placeholder component.
///
/// A utility atom used to represent missing content or loading states.
class AtomixPlaceholder extends StatelessWidget {
  /// Creates an Atomix placeholder.
  const AtomixPlaceholder({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.icon = Icons.image,
  });

  /// The width of the placeholder.
  final double? width;

  /// The height of the placeholder.
  final double? height;

  /// The border radius of the placeholder.
  final BorderRadius? borderRadius;

  /// The icon to display in the center.
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final backgroundColor = theme.colors.border.withValues(alpha: 0.1);
    final iconColor = theme.colors.textSecondary;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.all(theme.radius.sm),
      ),
      child: Center(child: Icon(icon, color: iconColor, size: 32)),
    );
  }
}
