import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// An Avatar component to represent users or entities.
class AtomixAvatar extends StatelessWidget {
  /// The image URL to display.
  final String? imageUrl;

  /// The initials to display if no image is provided.
  final String? initials;

  /// The size of the avatar (diameter).
  final double size;

  /// Background color of the avatar.
  final Color? backgroundColor;

  /// Color of the initials text.
  final Color? foregroundColor;

  /// Custom border radius for foundation override.
  final BorderRadius? borderRadius;

  /// Custom shadow for foundation override.
  final List<BoxShadow>? boxShadow;

  const AtomixAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 40,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? AtomixColors.primary.withValues(alpha: 0.1),
        borderRadius: borderRadius ?? BorderRadius.circular(size),
        boxShadow: boxShadow,
        image: imageUrl != null
            ? DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.cover)
            : null,
      ),
      child: initials != null && imageUrl == null
          ? Center(
              child: AtomixText(
                initials!.toUpperCase(),
                style: TextStyle(
                  color: foregroundColor ?? AtomixColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: size * 0.4,
                ),
              ),
            )
          : null,
    );
  }
}
