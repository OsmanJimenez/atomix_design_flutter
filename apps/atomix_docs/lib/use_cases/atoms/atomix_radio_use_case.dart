import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Radio', path: '[Atoms]', type: AtomixRadio)
Widget radioUseCase(BuildContext context) {
  final isDisabled = context.knobs.boolean(
    label: 'Is Disabled',
    initialValue: false,
  );

  return _RadioPlayground(isDisabled: isDisabled);
}

class _RadioPlayground extends StatefulWidget {
  final bool isDisabled;

  const _RadioPlayground({required this.isDisabled});

  @override
  State<_RadioPlayground> createState() => _RadioPlaygroundState();
}

class _RadioPlaygroundState extends State<_RadioPlayground> {
  String? _selectedValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AtomixSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AtomixText(
            'AtomixRadio',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const AtomixSpacer.md(),
          const AtomixText('A custom radio button for exclusive selection.'),
          const AtomixSpacer.xl(),
          Column(
            children: [
              AtomixRadio<String>(
                value: 'Option 1',
                groupValue: _selectedValue,
                label: 'Option One',
                isDisabled: widget.isDisabled,
                onChanged: (val) => setState(() => _selectedValue = val),
              ),
              AtomixRadio<String>(
                value: 'Option 2',
                groupValue: _selectedValue,
                label: 'Option Two',
                isDisabled: widget.isDisabled,
                onChanged: (val) => setState(() => _selectedValue = val),
              ),
              AtomixRadio<String>(
                value: 'Option 3',
                groupValue: _selectedValue,
                label: 'Option Three',
                isDisabled: widget.isDisabled,
                onChanged: (val) => setState(() => _selectedValue = val),
              ),
            ],
          ),
          const AtomixSpacer.xl(),
          CodeSnippet(
            code:
                '''AtomixRadio<String>(
  value: 'Option 1',
  groupValue: '$_selectedValue',
  label: 'Option One',
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
