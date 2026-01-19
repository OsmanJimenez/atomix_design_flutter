import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A star-based Rating component.
class AtomixRating extends StatelessWidget {
  /// The rating value (e.g., 4.5).
  final double rating;

  /// Maximum number of stars.
  final int maxRating;

  /// Size of the icons.
  final double size;

  /// Color of the filled stars.
  final Color? color;

  /// Color of the unfilled stars.
  final Color? unselectedColor;

  /// Current state for interaction (if needed).
  final ValueChanged<double>? onRatingChanged;

  const AtomixRating({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 20,
    this.color,
    this.unselectedColor,
    this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        final iconIndex = index + 1;
        IconData iconData;

        if (rating >= iconIndex) {
          iconData = Icons.star;
        } else if (rating > index) {
          iconData = Icons.star_half;
        } else {
          iconData = Icons.star_border;
        }

        return GestureDetector(
          onTap: onRatingChanged != null
              ? () => onRatingChanged!(iconIndex.toDouble())
              : null,
          child: Icon(
            iconData,
            size: size,
            color: (rating >= iconIndex || rating > index)
                ? (color ?? AtomixColors.warning)
                : (unselectedColor ?? AtomixColors.textDisabled),
          ),
        );
      }),
    );
  }
}
