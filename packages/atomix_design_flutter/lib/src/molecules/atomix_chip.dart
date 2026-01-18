import 'package:flutter/material.dart';
import '../foundation/atomix_spacing.dart';
import '../foundation/atomix_radius.dart';

/// Atomix chip component.
///
/// A compact element that represents an attribute, text, entity, or action.
/// Supports selected and unselected states with optional leading icon.
///
/// Example:
/// ```dart
/// AtomixChip(
///   label: 'Flutter',
///   selected: true,
///   onSelected: (selected) => print('Selected: $selected'),
/// )
/// ```
class AtomixChip extends StatelessWidget {
  /// Creates an Atomix chip.
  const AtomixChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onSelected,
    this.leadingIcon,
    this.onDeleted,
    this.backgroundColor,
    this.selectedColor,
    this.borderRadius,
  });

  /// The text label for the chip.
  final String label;

  /// Whether the chip is selected.
  final bool selected;

  /// Called when the chip selection changes.
  final ValueChanged<bool>? onSelected;

  /// Optional icon displayed at the start of the chip.
  final IconData? leadingIcon;

  /// Called when the delete icon is tapped.
  final VoidCallback? onDeleted;

  /// Optional background color.
  final Color? backgroundColor;

  /// Optional color when selected.
  final Color? selectedColor;

  /// Optional border radius override.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: borderRadius ?? AtomixRadius.smBorderRadius,
    );
    final avatar = leadingIcon != null ? Icon(leadingIcon, size: 18) : null;
    const padding = EdgeInsets.symmetric(
      horizontal: AtomixSpacing.sm,
      vertical: AtomixSpacing.xs,
    );

    if (onSelected != null) {
      return FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: onSelected,
        avatar: avatar,
        padding: padding,
        backgroundColor: backgroundColor,
        selectedColor: selectedColor,
        shape: shape,
      );
    }

    if (onDeleted != null) {
      return Chip(
        label: Text(label),
        avatar: avatar,
        onDeleted: onDeleted,
        padding: padding,
        backgroundColor: backgroundColor,
        shape: shape,
      );
    }

    return Chip(
      label: Text(label),
      avatar: avatar,
      padding: padding,
      backgroundColor: backgroundColor,
      shape: shape,
    );
  }
}
