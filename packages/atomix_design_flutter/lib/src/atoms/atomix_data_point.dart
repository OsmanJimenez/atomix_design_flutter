import 'package:flutter/material.dart';
import 'atomix_text.dart';
import '../foundation/atomix_spacing.dart';

/// Atomix data point component.
///
/// A small atom for displaying a label and a value side-by-side.
class AtomixDataPoint extends StatelessWidget {
  /// Creates an Atomix data point.
  const AtomixDataPoint({
    super.key,
    required this.label,
    required this.value,
    this.spacing = AtomixSpacing.xs,
  });

  /// The label for the data point.
  final String label;

  /// The value for the data point.
  final String value;

  /// The spacing between label and value.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AtomixText(
          '$label:',
          style: textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: spacing),
        AtomixText(value, style: textTheme.bodySmall),
      ],
    );
  }
}
