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

  const AtomixAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 40,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? AtomixColors.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
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
