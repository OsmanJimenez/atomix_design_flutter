import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Checkbox',
  type: AtomixCheckbox,
)
Widget checkboxPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Checkbox > Label',
    initialValue: 'Accept Terms',
  );

  final isError = context.knobs.boolean(
    label: 'Checkbox > Is Error',
    initialValue: false,
  );

  final isDisabled = context.knobs.boolean(
    label: 'Checkbox > Is Disabled',
    initialValue: false,
  );

  return _CheckboxPlaygroundWrapper(
    label: label,
    isError: isError,
    isDisabled: isDisabled,
  );
}

class _CheckboxPlaygroundWrapper extends StatefulWidget {
  final String label;
  final bool isError;
  final bool isDisabled;

  const _CheckboxPlaygroundWrapper({
    required this.label,
    required this.isError,
    required this.isDisabled,
  });

  @override
  State<_CheckboxPlaygroundWrapper> createState() =>
      _CheckboxPlaygroundWrapperState();
}

class _CheckboxPlaygroundWrapperState
    extends State<_CheckboxPlaygroundWrapper> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    final code =
        '''AtomixCheckbox(
  value: $_value,
  label: '${widget.label}',
  isError: ${widget.isError},
  isDisabled: ${widget.isDisabled},
  onChanged: (val) {
    // Handle state
  },
)''';

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            AtomixCheckbox(
              value: _value,
              onChanged: (val) => setState(() => _value = val ?? false),
              label: widget.label,
              isError: widget.isError,
              isDisabled: widget.isDisabled,
            ),
            const SizedBox(height: 32),
            CodeSnippet(code: code),
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Default',
  path: '[Atoms]/Checkbox',
  type: AtomixCheckbox,
)
Widget checkboxDefault(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixCheckbox(value: true, label: 'Checked state', onChanged: null),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixCheckbox(
  value: true,
  label: 'Checked state',
  onChanged: (val) {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Error',
  path: '[Atoms]/Checkbox',
  type: AtomixCheckbox,
)
Widget checkboxError(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixCheckbox(
            value: false,
            label: 'Error state',
            isError: true,
            onChanged: null,
          ),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixCheckbox(
  value: false,
  label: 'Error state',
  isError: true,
  onChanged: (val) {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Disabled',
  path: '[Atoms]/Checkbox',
  type: AtomixCheckbox,
)
Widget checkboxDisabled(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixCheckbox(
            value: true,
            label: 'Disabled checked',
            isDisabled: true,
            onChanged: null,
          ),
          SizedBox(height: 12),
          AtomixCheckbox(
            value: false,
            label: 'Disabled unchecked',
            isDisabled: true,
            onChanged: null,
          ),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixCheckbox(
  value: true,
  label: 'Disabled checked',
  isDisabled: true,
  onChanged: (val) {},
)''',
          ),
        ],
      ),
    ),
  );
}
