import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixRadioGroup<T> extends StatelessWidget {
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final List<AtomixRadioOption<T>> options;
  final String? label;
  final String? errorText;
  final Axis direction;

  const AtomixRadioGroup({
    super.key,
    required this.groupValue,
    required this.onChanged,
    required this.options,
    this.label,
    this.errorText,
    this.direction = Axis.vertical,
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
            style: theme.typography.labelLarge.copyWith(
              color: theme.colors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
        if (direction == Axis.vertical)
          ...options.map((option) => _buildRadio(option))
        else
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: options.map((option) => _buildRadio(option)).toList(),
          ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: theme.typography.bodySmall.copyWith(
              color: theme.colors.error,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildRadio(AtomixRadioOption<T> option) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: AtomixRadio<T>(
        value: option.value,
        groupValue: groupValue,
        onChanged: option.enabled ? onChanged : null,
        label: option.label,
      ),
    );
  }
}

class AtomixRadioOption<T> {
  final String label;
  final T value;
  final bool enabled;

  const AtomixRadioOption({
    required this.label,
    required this.value,
    this.enabled = true,
  });
}
