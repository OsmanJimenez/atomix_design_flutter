import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final double min;
  final double max;
  final int? divisions;
  final String? label;
  final String? title;

  const AtomixSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.label,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: theme.typography.labelMedium.copyWith(
              color: theme.colors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
        ],
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: theme.colors.primary,
            inactiveTrackColor: theme.colors.primary.withValues(alpha: 0.2),
            thumbColor: theme.colors.primary,
            overlayColor: theme.colors.primary.withValues(alpha: 0.1),
            valueIndicatorColor: theme.colors.primary,
            valueIndicatorTextStyle: theme.typography.labelSmall.copyWith(
              color: theme.colors.onPrimary,
            ),
          ),
          child: Slider(
            value: value,
            onChanged: onChanged,
            min: min,
            max: max,
            divisions: divisions,
            label: label ?? value.toStringAsFixed(1),
          ),
        ),
      ],
    );
  }
}
