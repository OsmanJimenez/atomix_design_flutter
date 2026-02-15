import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixRating extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final int count;
  final IconData filledIcon;
  final IconData emptyIcon;
  final IconData? halfIcon;
  final Color? color;
  final double size;

  const AtomixRating({
    super.key,
    required this.value,
    this.onChanged,
    this.count = 5,
    this.filledIcon = Icons.star,
    this.emptyIcon = Icons.star_border,
    this.halfIcon = Icons.star_half,
    this.color,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final activeColor =
        color ??
        theme.colors.warning; // Star color typically yellow/gold/warning

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final icon = _getIconForIndex(index);
        final isInteractive = onChanged != null;

        Widget star = Icon(icon, size: size, color: activeColor);

        if (isInteractive) {
          star = GestureDetector(
            onTap: () {
              // Simple logic: tap on star sets value to index + 1
              // For half stars logic, we need local position details which GestureDetector provides
              onChanged!(index + 1.0);
            },
            child: star,
          );
        }

        return star;
      }),
    );
  }

  IconData _getIconForIndex(int index) {
    if (value >= index + 1) {
      return filledIcon;
    } else if (value > index && halfIcon != null) {
      return halfIcon!;
    } else {
      return emptyIcon;
    }
  }
}
