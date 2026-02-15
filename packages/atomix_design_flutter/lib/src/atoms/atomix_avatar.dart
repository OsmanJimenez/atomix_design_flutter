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
    final theme = AtomixTheme.of(context);
    final primaryColor = theme.colors.primary;
    final effectiveBackgroundColor =
        backgroundColor ?? primaryColor.withValues(alpha: 0.1);
    final effectiveForegroundColor = foregroundColor ?? primaryColor;

    Widget buildInitials() {
      if (initials == null) return const SizedBox();
      return Center(
        child: AtomixText(
          initials!.toUpperCase(),
          style: TextStyle(
            color: effectiveForegroundColor,
            fontWeight: FontWeight.bold,
            fontSize: size * 0.4,
          ),
        ),
      );
    }

    Widget content;
    if (imageUrl != null) {
      content = Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        width: size,
        height: size,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: effectiveBackgroundColor,
            child: buildInitials(),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return AtomixSkeleton(
            width: size,
            height: size,
            isCircle: borderRadius == null,
            borderRadius: borderRadius,
          );
        },
      );
    } else {
      content = Container(
        color: effectiveBackgroundColor,
        child: buildInitials(),
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(size),
        boxShadow: boxShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: content,
    );
  }
}
