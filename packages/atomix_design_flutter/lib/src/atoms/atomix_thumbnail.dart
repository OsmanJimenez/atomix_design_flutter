import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A small image preview or thumbnail component.
class AtomixThumbnail extends StatelessWidget {
  /// The image URL.
  final String imageUrl;

  /// Size of the thumbnail.
  final double size;

  /// Corner radius.
  final BorderRadius? borderRadius;

  /// Whether to show a border.
  final bool hasBorder;

  /// Custom border color override.
  final Color? borderColor;

  const AtomixThumbnail({
    super.key,
    required this.imageUrl,
    this.size = 64,
    this.borderRadius,
    this.hasBorder = true,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AtomixColors.border.withValues(alpha: 0.1),
        borderRadius: borderRadius ?? AtomixRadius.smBorderRadius,
        border: hasBorder
            ? Border.all(color: borderColor ?? AtomixColors.border)
            : null,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
