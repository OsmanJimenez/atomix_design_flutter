import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixChipGroup<T> extends StatelessWidget {
  final List<AtomixChipOption<T>> options;
  final List<T> selectedValues;
  final ValueChanged<List<T>> onChanged;
  final bool multiple;
  final double spacing;
  final double runSpacing;

  const AtomixChipGroup({
    super.key,
    required this.options,
    required this.selectedValues,
    required this.onChanged,
    this.multiple = false,
    this.spacing = 8.0,
    this.runSpacing = 8.0,
  });

  void _handleTap(T value) {
    final newValues = List<T>.from(selectedValues);
    if (multiple) {
      if (newValues.contains(value)) {
        newValues.remove(value);
      } else {
        newValues.add(value);
      }
    } else {
      newValues.clear();
      newValues.add(value);
    }
    onChanged(newValues);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: options.map((option) {
        final isSelected = selectedValues.contains(option.value);
        return AtomixChip(
          label: option.label,
          selected: isSelected,
          onSelected: option.enabled ? (val) => _handleTap(option.value) : null,
        );
      }).toList(),
    );
  }
}

class AtomixChipOption<T> {
  final String label;
  final T value;
  final bool enabled;

  const AtomixChipOption({
    required this.label,
    required this.value,
    this.enabled = true,
  });
}
