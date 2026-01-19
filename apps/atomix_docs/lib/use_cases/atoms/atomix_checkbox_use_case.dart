import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Checkbox', path: '[Atoms]', type: AtomixCheckbox)
Widget checkboxUseCase(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Accept Terms',
    description: 'The text to show next to the checkbox',
  );

  final isError = context.knobs.boolean(
    label: 'Is Error',
    initialValue: false,
    description: 'Toggle error state',
  );

  final isDisabled = context.knobs.boolean(
    label: 'Is Disabled',
    initialValue: false,
    description: 'Toggle disabled state',
  );

  return _CheckboxPlayground(
    label: label,
    isError: isError,
    isDisabled: isDisabled,
  );
}

class _CheckboxPlayground extends StatefulWidget {
  final String label;
  final bool isError;
  final bool isDisabled;

  const _CheckboxPlayground({
    required this.label,
    required this.isError,
    required this.isDisabled,
  });

  @override
  State<_CheckboxPlayground> createState() => _CheckboxPlaygroundState();
}

class _CheckboxPlaygroundState extends State<_CheckboxPlayground> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AtomixSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AtomixText(
            'AtomixCheckbox',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const AtomixSpacer.md(),
          const AtomixText(
            'A custom checkbox with optional label and design system states.',
          ),
          const AtomixSpacer.xl(),
          AtomixCheckbox(
            value: _value,
            onChanged: (val) => setState(() => _value = val ?? false),
            label: widget.label,
            isError: widget.isError,
            isDisabled: widget.isDisabled,
          ),
          const AtomixSpacer.xl(),
          CodeSnippet(
            code:
                '''AtomixCheckbox(
  value: $_value,
  label: '${widget.label}',
  isError: ${widget.isError},
  isDisabled: ${widget.isDisabled},
  onChanged: (val) {
    // Handle state
  },
)''',
          ),
        ],
      ),
    );
  }
}
