import 'package:flutter/material.dart';
import '../foundation/atomix_colors.dart';
import '../foundation/atomix_radius.dart';

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
    final brightness = Theme.of(context).brightness;
    final backgroundColor = brightness == Brightness.light
        ? AtomixColors.surfaceVariant
        : AtomixColors.surfaceVariantDark;
    final iconColor = brightness == Brightness.light
        ? AtomixColors.textSecondary
        : AtomixColors.textSecondaryDark;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? AtomixRadius.smBorderRadius,
      ),
      child: Center(child: Icon(icon, color: iconColor, size: 32)),
    );
  }
}
