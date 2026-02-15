import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../atomix_design_flutter.dart';

/// A custom Switch component that follows the Atomix Design System.
class AtomixSwitch extends StatelessWidget {
  /// Whether this switch is on.
  final bool value;

  /// Called when the value of the switch should change.
  final ValueChanged<bool>? onChanged;

  /// Optional label to display next to the switch.
  final String? label;

  /// Whether the switch is disabled.
  final bool isDisabled;

  /// Custom active color for foundation override.
  final Color? activeColor;

  /// Custom track color for foundation override.
  final Color? trackColor;

  const AtomixSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.isDisabled = false,
    this.activeColor,
    this.trackColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    Widget toggle = CupertinoSwitch(
      value: value,
      onChanged: isDisabled ? null : onChanged,
      activeTrackColor: activeColor ?? theme.colors.primary,
      inactiveTrackColor: trackColor ?? theme.colors.border,
    );

    if (label == null) return toggle;

    return InkWell(
      onTap: isDisabled ? null : () => onChanged?.call(!value),
      borderRadius: BorderRadius.all(theme.radius.sm),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: theme.spacing.xs,
          horizontal: theme.spacing.sm,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            toggle,
            AtomixSpacer.horizontal(theme.spacing.sm),
            AtomixText(
              label!,
              style: TextStyle(
                color: isDisabled
                    ? theme.colors.textDisabled
                    : theme.colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
