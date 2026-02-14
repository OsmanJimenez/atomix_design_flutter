import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A molecule that displays a group of overlapping avatars.
class AtomixAvatarGroup extends StatelessWidget {
  /// Creates an Atomix avatar group.
  const AtomixAvatarGroup({
    super.key,
    required this.avatars,
    this.size = 40.0,
    this.overlapFraction = 0.3,
    this.maxVisible = 5,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 2.0,
  });

  /// The list of avatars to display.
  final List<AtomixAvatar> avatars;

  /// The size (diameter) of each avatar in the group.
  final double size;

  /// The fraction of the avatar width that overlaps with the next one (0.0 to 1.0).
  final double overlapFraction;

  /// The maximum number of avatars to show before displaying a counter.
  final int maxVisible;

  /// Background color for the overflow counter.
  final Color? backgroundColor;

  /// Border color for each avatar to create separation.
  final Color? borderColor;

  /// Width of the border around each avatar.
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    if (avatars.isEmpty) return const SizedBox.shrink();

    final visibleCount = avatars.length > maxVisible
        ? maxVisible
        : avatars.length;
    final remainingCount = avatars.length - visibleCount;
    final displayList = avatars.take(visibleCount).toList();

    final children = <Widget>[];

    for (int i = 0; i < displayList.length; i++) {
      children.add(
        Positioned(
          left: i * (size * (1 - overlapFraction)),
          child: _buildAvatarWithBorder(context, displayList[i]),
        ),
      );
    }

    if (remainingCount > 0) {
      children.add(
        Positioned(
          left: visibleCount * (size * (1 - overlapFraction)),
          child: _buildOverlapCounter(context, remainingCount),
        ),
      );
    }

    final totalVisible = visibleCount + (remainingCount > 0 ? 1 : 0);
    final totalWidth =
        size + (totalVisible - 1) * (size * (1 - overlapFraction));

    return SizedBox(
      width: totalWidth,
      height: size,
      child: Stack(children: children),
    );
  }

  Widget _buildAvatarWithBorder(BuildContext context, AtomixAvatar avatar) {
    final effectiveBorderColor =
        borderColor ?? Theme.of(context).scaffoldBackgroundColor;

    // We wrap the avatar to add a border and ensure consistent size
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: effectiveBorderColor, width: borderWidth),
      ),
      child: AtomixAvatar(
        imageUrl: avatar.imageUrl,
        initials: avatar.initials,
        size: size - (borderWidth * 2), // Adjust inner size
        backgroundColor: avatar.backgroundColor,
        foregroundColor: avatar.foregroundColor,
        boxShadow: avatar.boxShadow,
      ),
    );
  }

  Widget _buildOverlapCounter(BuildContext context, int count) {
    final effectiveBorderColor =
        borderColor ?? Theme.of(context).scaffoldBackgroundColor;
    final effectiveBgColor = backgroundColor ?? AtomixColors.surfaceVariant;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: effectiveBgColor,
        shape: BoxShape.circle,
        border: Border.all(color: effectiveBorderColor, width: borderWidth),
      ),
      child: Center(
        child: AtomixText(
          '+$count',
          style: TextStyle(
            fontSize: size * 0.35,
            fontWeight: FontWeight.bold,
            color: AtomixColors.primary,
          ),
        ),
      ),
    );
  }
}
