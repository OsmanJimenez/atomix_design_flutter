import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixProgressBar extends StatelessWidget {
  final double value;
  final String? label;
  final bool showPercentage;
  final Color? color;
  final double height;

  const AtomixProgressBar({
    super.key,
    required this.value,
    this.label,
    this.showPercentage = true,
    this.color,
    this.height = 8,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final percentage = (value * 100).toInt();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null || showPercentage)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (label != null)
                Text(
                  label!,
                  style: theme.typography.labelMedium.copyWith(
                    color: theme.colors.textPrimary,
                  ),
                ),
              if (showPercentage)
                Text(
                  '$percentage%',
                  style: theme.typography.labelMedium.copyWith(
                    color: theme.colors.textSecondary,
                  ),
                ),
            ],
          ),
        if (label != null || showPercentage) const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(height / 2),
          child: LinearProgressIndicator(
            value: value,
            minHeight: height,
            backgroundColor: theme.colors.surfaceVariant,
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? theme.colors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
