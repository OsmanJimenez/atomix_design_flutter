import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A custom Checkbox component that follows the Atomix Design System.
class AtomixCheckbox extends StatelessWidget {
  /// Whether this checkbox is checked.
  final bool value;

  /// Called when the value of the checkbox should change.
  final ValueChanged<bool?>? onChanged;

  /// Optional label to display next to the checkbox.
  final String? label;

  /// Whether the checkbox is in an error state.
  final bool isError;

  /// Whether the checkbox is disabled.
  final bool isDisabled;

  const AtomixCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.isError = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = isError ? AtomixColors.error : AtomixColors.primary;

    Widget checkbox = Checkbox(
      value: value,
      onChanged: isDisabled ? null : onChanged,
      activeColor: activeColor,
      checkColor: AtomixColors.onPrimary,
      side: BorderSide(
        color: isError ? AtomixColors.error : AtomixColors.border,
        width: 2,
      ),
      shape: RoundedRectangleBorder(borderRadius: AtomixRadius.xsBorderRadius),
    );

    if (label == null) return checkbox;

    return InkWell(
      onTap: isDisabled ? null : () => onChanged?.call(!value),
      borderRadius: AtomixRadius.smBorderRadius,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AtomixSpacing.xs,
          horizontal: AtomixSpacing.sm,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            checkbox,
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
