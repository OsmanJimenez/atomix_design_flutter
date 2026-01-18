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

  @override
  Widget build(BuildContext context) {
    if (onSelected != null) {
      return FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: onSelected,
        avatar: leadingIcon != null ? Icon(leadingIcon, size: 18) : null,
        padding: const EdgeInsets.symmetric(
          horizontal: AtomixSpacing.sm,
          vertical: AtomixSpacing.xs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AtomixRadius.smBorderRadius,
        ),
      );
    }

    if (onDeleted != null) {
      return Chip(
        label: Text(label),
        avatar: leadingIcon != null ? Icon(leadingIcon, size: 18) : null,
        onDeleted: onDeleted,
        padding: const EdgeInsets.symmetric(
          horizontal: AtomixSpacing.sm,
          vertical: AtomixSpacing.xs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AtomixRadius.smBorderRadius,
        ),
      );
    }

    return Chip(
      label: Text(label),
      avatar: leadingIcon != null ? Icon(leadingIcon, size: 18) : null,
      padding: const EdgeInsets.symmetric(
        horizontal: AtomixSpacing.sm,
        vertical: AtomixSpacing.xs,
      ),
      shape: RoundedRectangleBorder(borderRadius: AtomixRadius.smBorderRadius),
    );
  }
}
