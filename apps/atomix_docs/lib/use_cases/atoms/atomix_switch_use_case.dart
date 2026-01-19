import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Switch', path: '[Atoms]', type: AtomixSwitch)
Widget switchUseCase(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Notifications',
  );

  final isDisabled = context.knobs.boolean(
    label: 'Is Disabled',
    initialValue: false,
  );

  return _SwitchPlayground(label: label, isDisabled: isDisabled);
}

class _SwitchPlayground extends StatefulWidget {
  final String label;
  final bool isDisabled;

  const _SwitchPlayground({required this.label, required this.isDisabled});

  @override
  State<_SwitchPlayground> createState() => _SwitchPlaygroundState();
}

class _SwitchPlaygroundState extends State<_SwitchPlayground> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AtomixSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AtomixText(
            'AtomixSwitch',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const AtomixSpacer.md(),
          const AtomixText(
            'A custom toggle switch with iOS-style behavior and design system colors.',
          ),
          const AtomixSpacer.xl(),
          AtomixSwitch(
            value: _value,
            onChanged: (val) => setState(() => _value = val),
            label: widget.label,
            isDisabled: widget.isDisabled,
          ),
          const AtomixSpacer.xl(),
          CodeSnippet(
            code:
                '''AtomixSwitch(
  value: $_value,
  label: '${widget.label}',
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
