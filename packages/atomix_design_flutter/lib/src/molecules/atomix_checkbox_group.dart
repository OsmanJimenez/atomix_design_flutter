import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A group of checkboxes with optional label and validation error.
class AtomixCheckboxGroup<T> extends StatefulWidget {
  final String? label;
  final String? errorText;
  final List<AtomixCheckboxOption<T>> options;
  final List<T> selectedValues;
  final ValueChanged<List<T>> onChanged;
  final Axis direction;

  const AtomixCheckboxGroup({
    super.key,
    this.label,
    this.errorText,
    required this.options,
    required this.selectedValues,
    required this.onChanged,
    this.direction = Axis.vertical,
  });

  @override
  State<AtomixCheckboxGroup<T>> createState() => _AtomixCheckboxGroupState<T>();
}

class _AtomixCheckboxGroupState<T> extends State<AtomixCheckboxGroup<T>> {
  late List<T> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = List.from(widget.selectedValues);
  }

  void _handleChanged(bool? isChecked, T value) {
    setState(() {
      if (isChecked == true) {
        if (!_selectedValues.contains(value)) {
          _selectedValues.add(value);
        }
      } else {
        _selectedValues.remove(value);
      }
    });
    widget.onChanged(_selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: theme.typography.labelLarge.copyWith(
              color: theme.colors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
        if (widget.direction == Axis.vertical)
          ...widget.options.map((option) => _buildCheckbox(option))
        else
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: widget.options
                .map((option) => _buildCheckbox(option))
                .toList(),
          ),
        if (widget.errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.errorText!,
            style: theme.typography.bodySmall.copyWith(
              color: theme.colors.error,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildCheckbox(AtomixCheckboxOption<T> option) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: AtomixCheckbox(
        value: _selectedValues.contains(option.value),
        onChanged: option.enabled
            ? (val) => _handleChanged(val, option.value)
            : null,
        label: option.label,
        // Assuming AtomixCheckbox supports label, otherwise we wrap in Row
      ),
    );
  }
}

class AtomixCheckboxOption<T> {
  final String label;
  final T value;
  final bool enabled;

  const AtomixCheckboxOption({
    required this.label,
    required this.value,
    this.enabled = true,
  });
}
