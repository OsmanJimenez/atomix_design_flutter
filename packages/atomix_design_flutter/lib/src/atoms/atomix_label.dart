import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A specialized label component for form fields and descriptions.
class AtomixLabel extends StatelessWidget {
  /// The text to display.
  final String label;

  /// Whether the field is mandatory (adds a red asterisk).
  final bool isRequired;

  /// Optional sub-label or helper text.
  final String? subLabel;

  /// Whether to display the label in an error state.
  final bool isError;

  /// Custom color for the main label.
  final Color? labelColor;

  /// Custom color for the sub-label.
  final Color? subLabelColor;

  const AtomixLabel({
    super.key,
    required this.label,
    this.isRequired = false,
    this.subLabel,
    this.isError = false,
    this.labelColor,
    this.subLabelColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final defaultLabelColor = isError
        ? theme.colors.error
        : theme.colors.textPrimary;
    final defaultSubLabelColor = isError
        ? theme.colors.error
        : theme.colors.textSecondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AtomixText(
              label,
              style: theme.typography.labelLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: labelColor ?? defaultLabelColor,
              ),
            ),
            if (isRequired)
              AtomixText(' *', style: TextStyle(color: theme.colors.error)),
          ],
        ),
        if (subLabel != null) ...[
          AtomixSpacer.xs(),
          AtomixText(
            subLabel!,
            style: theme.typography.labelSmall.copyWith(
              color: subLabelColor ?? defaultSubLabelColor,
            ),
          ),
        ],
      ],
    );
  }
}
