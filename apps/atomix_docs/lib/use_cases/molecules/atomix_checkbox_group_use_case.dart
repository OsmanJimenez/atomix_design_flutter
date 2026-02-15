import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/CheckboxGroup',
  type: AtomixCheckboxGroup,
)
Widget atomixCheckboxGroupPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Select Options',
  );

  final errorText = context.knobs.string(label: 'Error Text', initialValue: '');

  final direction = context.knobs.list(
    label: 'Direction',
    options: [Axis.vertical, Axis.horizontal],
    initialOption: Axis.vertical,
    labelBuilder: (a) => a == Axis.vertical ? 'Vertical' : 'Horizontal',
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: _CheckboxGroupWrapper(
        label: label,
        errorText: errorText.isEmpty ? null : errorText,
        direction: direction,
      ),
    ),
  );
}

class _CheckboxGroupWrapper extends StatefulWidget {
  final String? label;
  final String? errorText;
  final Axis direction;

  const _CheckboxGroupWrapper({
    this.label,
    this.errorText,
    required this.direction,
  });

  @override
  State<_CheckboxGroupWrapper> createState() => _CheckboxGroupWrapperState();
}

class _CheckboxGroupWrapperState extends State<_CheckboxGroupWrapper> {
  List<String> selectedValues = ['Option 1'];

  @override
  Widget build(BuildContext context) {
    final code =
        '''AtomixCheckboxGroup<String>(
  label: '${widget.label}',
  direction: Axis.${widget.direction.name},
  options: [
    AtomixCheckboxOption(label: 'Option 1', value: 'Option 1'),
    AtomixCheckboxOption(label: 'Option 2', value: 'Option 2'),
    AtomixCheckboxOption(label: 'Option 3', value: 'Option 3', enabled: false),
    AtomixCheckboxOption(label: 'Option 4', value: 'Option 4'),
  ],
  selectedValues: selectedValues,
  onChanged: (values) => setState(() => selectedValues = values),
)''';

    return Column(
      children: [
        AtomixCheckboxGroup<String>(
          label: widget.label,
          errorText: widget.errorText,
          direction: widget.direction,
          options: const [
            AtomixCheckboxOption(label: 'Option 1', value: 'Option 1'),
            AtomixCheckboxOption(label: 'Option 2', value: 'Option 2'),
            AtomixCheckboxOption(
              label: 'Option 3 (Disabled)',
              value: 'Option 3',
              enabled: false,
            ),
            AtomixCheckboxOption(label: 'Option 4', value: 'Option 4'),
          ],
          selectedValues: selectedValues,
          onChanged: (values) {
            setState(() {
              selectedValues = values;
            });
          },
        ),
        const SizedBox(height: 24),
        CodeSnippet(code: code),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Vertical List',
  path: '[Molecules]/CheckboxGroup',
  type: AtomixCheckboxGroup,
)
Widget atomixCheckboxGroupVertical(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: _CheckboxGroupVerticalWrapper(),
    ),
  );
}

class _CheckboxGroupVerticalWrapper extends StatefulWidget {
  const _CheckboxGroupVerticalWrapper();

  @override
  State<_CheckboxGroupVerticalWrapper> createState() =>
      _CheckboxGroupVerticalWrapperState();
}

class _CheckboxGroupVerticalWrapperState
    extends State<_CheckboxGroupVerticalWrapper> {
  List<String> selectedValues = ['Email'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixCheckboxGroup<String>(
          label: 'Notification Preferences',
          direction: Axis.vertical,
          options: const [
            AtomixCheckboxOption(label: 'Email', value: 'Email'),
            AtomixCheckboxOption(label: 'SMS', value: 'SMS'),
            AtomixCheckboxOption(label: 'Push Notifications', value: 'Push'),
          ],
          selectedValues: selectedValues,
          onChanged: (values) => setState(() => selectedValues = values),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixCheckboxGroup<String>(
  label: 'Notification Preferences',
  direction: Axis.vertical,
  options: [
    AtomixCheckboxOption(label: 'Email', value: 'Email'),
    AtomixCheckboxOption(label: 'SMS', value: 'SMS'),
    AtomixCheckboxOption(label: 'Push Notifications', value: 'Push'),
  ],
  selectedValues: selectedValues,
  onChanged: (values) => setState(() => selectedValues = values),
)''',
        ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'With Error',
  path: '[Molecules]/CheckboxGroup',
  type: AtomixCheckboxGroup,
)
Widget atomixCheckboxGroupError(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: _CheckboxGroupErrorWrapper(),
    ),
  );
}

class _CheckboxGroupErrorWrapper extends StatefulWidget {
  const _CheckboxGroupErrorWrapper();

  @override
  State<_CheckboxGroupErrorWrapper> createState() =>
      _CheckboxGroupErrorWrapperState();
}

class _CheckboxGroupErrorWrapperState
    extends State<_CheckboxGroupErrorWrapper> {
  List<String> selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixCheckboxGroup<String>(
          label: 'Terms and Conditions',
          errorText: selectedValues.isEmpty
              ? 'You must accept the terms'
              : null,
          options: const [
            AtomixCheckboxOption(
              label: 'I accept the terms and conditions',
              value: 'terms',
            ),
            AtomixCheckboxOption(
              label: 'I want to receive marketing emails',
              value: 'marketing',
            ),
          ],
          selectedValues: selectedValues,
          onChanged: (values) => setState(() => selectedValues = values),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixCheckboxGroup<String>(
  label: 'Terms and Conditions',
  errorText: selectedValues.isEmpty ? 'You must accept the terms' : null,
  options: [
    AtomixCheckboxOption(label: 'I accept the terms and conditions', value: 'terms'),
    AtomixCheckboxOption(label: 'I want to receive marketing emails', value: 'marketing'),
  ],
  selectedValues: selectedValues,
  onChanged: (values) => setState(() => selectedValues = values),
)''',
        ),
      ],
    );
  }
}
