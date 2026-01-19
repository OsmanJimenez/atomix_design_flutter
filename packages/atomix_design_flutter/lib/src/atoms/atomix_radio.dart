import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A custom Radio component that follows the Atomix Design System.
class AtomixRadio<T> extends StatelessWidget {
  /// The value represented by this radio button.
  final T value;

  /// The currently selected value for a group of radio buttons.
  final T? groupValue;

  /// Called when the user selects this radio button.
  final ValueChanged<T?>? onChanged;

  /// Optional label to display next to the radio.
  final String? label;

  /// Whether the radio is disabled.
  final bool isDisabled;

  const AtomixRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget radio = Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: isDisabled ? null : onChanged,
      activeColor: AtomixColors.primary,
    );

    if (label == null) return radio;

    return InkWell(
      onTap: isDisabled ? null : () => onChanged?.call(value),
      borderRadius: AtomixRadius.smBorderRadius,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AtomixSpacing.xs,
          horizontal: AtomixSpacing.sm,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            radio,
            const AtomixSpacer.sm(),
            AtomixText(
              label!,
              style: TextStyle(
                color: isDisabled
                    ? AtomixColors.textDisabled
                    : AtomixColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
