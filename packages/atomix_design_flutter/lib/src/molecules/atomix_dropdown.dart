import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixDropdown<T> extends StatelessWidget {
  final T? value;
  final List<AtomixDropdownItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? hint;
  final String? label;

  const AtomixDropdown({
    super.key,
    this.value,
    required this.items,
    this.onChanged,
    this.hint,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: theme.typography.labelMedium.copyWith(
              color: theme.colors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
        DropdownButtonFormField<T>(
          initialValue: value,
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item.value,
              child: Text(item.label),
            );
          }).toList(),
          onChanged: onChanged,
          hint: hint != null ? Text(hint!) : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.colors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: theme.colors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: theme.colors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: theme.colors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class AtomixDropdownItem<T> {
  final String label;
  final T value;

  const AtomixDropdownItem({required this.label, required this.value});
}
