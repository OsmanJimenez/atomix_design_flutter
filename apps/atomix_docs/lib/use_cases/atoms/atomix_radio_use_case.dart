import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Radio',
  type: AtomixRadio,
)
Widget radioPlayground(BuildContext context) {
  final isDisabled = context.knobs.boolean(
    label: 'Radio > Is Disabled',
    initialValue: false,
  );

  return _RadioPlaygroundWrapper(isDisabled: isDisabled);
}

class _RadioPlaygroundWrapper extends StatefulWidget {
  final bool isDisabled;

  const _RadioPlaygroundWrapper({required this.isDisabled});

  @override
  State<_RadioPlaygroundWrapper> createState() =>
      _RadioPlaygroundWrapperState();
}

class _RadioPlaygroundWrapperState extends State<_RadioPlaygroundWrapper> {
  String? _selectedValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    final code =
        '''AtomixRadio<String>(
  value: 'Option 1',
  groupValue: '$_selectedValue',
  label: 'Option One',
  isDisabled: ${widget.isDisabled},
  onChanged: (val) {
    setState(() => _selectedValue = val);
  },
)''';

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
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
              ],
            ),
            const SizedBox(height: 32),
            CodeSnippet(code: code),
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Default', path: '[Atoms]/Radio', type: AtomixRadio)
Widget radioDefault(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixRadio<int>(
            value: 1,
            groupValue: 1,
            label: 'Selected option',
            onChanged: null,
          ),
          SizedBox(height: 12),
          AtomixRadio<int>(
            value: 2,
            groupValue: 1,
            label: 'Unselected option',
            onChanged: null,
          ),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixRadio<int>(
  value: 1,
  groupValue: 1,
  label: 'Selected option',
  onChanged: (val) {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', path: '[Atoms]/Radio', type: AtomixRadio)
Widget radioDisabled(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixRadio<int>(
            value: 1,
            groupValue: 1,
            label: 'Disabled selected',
            isDisabled: true,
            onChanged: null,
          ),
          SizedBox(height: 12),
          AtomixRadio<int>(
            value: 2,
            groupValue: 1,
            label: 'Disabled unselected',
            isDisabled: true,
            onChanged: null,
          ),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixRadio<int>(
  value: 1,
  groupValue: 1,
  isDisabled: true,
  onChanged: (val) {},
)''',
          ),
        ],
      ),
    ),
  );
}
