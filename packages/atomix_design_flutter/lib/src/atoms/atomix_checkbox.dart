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

  /// Custom active color for foundation override.
  final Color? activeColor;

  /// Custom check color for foundation override.
  final Color? checkColor;

  /// Custom border radius for foundation override.
  final BorderRadius? borderRadius;

  const AtomixCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.isError = false,
    this.isDisabled = false,
    this.activeColor,
    this.checkColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final defaultActiveColor = isError
        ? AtomixColors.error
        : AtomixColors.primary;
    final finalActiveColor = activeColor ?? defaultActiveColor;

    Widget checkbox = Checkbox(
      value: value,
      onChanged: isDisabled ? null : onChanged,
      activeColor: finalActiveColor,
      checkColor: checkColor ?? AtomixColors.onPrimary,
      side: BorderSide(
        color: isError ? AtomixColors.error : AtomixColors.border,
        width: 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? AtomixRadius.xsBorderRadius,
      ),
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
