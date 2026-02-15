import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/ChipGroup',
  type: AtomixChipGroup,
)
Widget atomixChipGroupPlayground(BuildContext context) {
  final multiple = context.knobs.boolean(
    label: 'Allow Multiple Selection',
    initialValue: true,
  );

  return Center(child: _ChipGroupWrapper(multiple: multiple));
}

class _ChipGroupWrapper extends StatefulWidget {
  final bool multiple;

  const _ChipGroupWrapper({required this.multiple});

  @override
  State<_ChipGroupWrapper> createState() => _ChipGroupWrapperState();
}

class _ChipGroupWrapperState extends State<_ChipGroupWrapper> {
  List<String> selectedValues = ['Flutter'];

  @override
  Widget build(BuildContext context) {
    final code =
        '''AtomixChipGroup<String>(
  multiple: ${widget.multiple},
  selectedValues: $selectedValues,
  onChanged: (values) => setState(() => selectedValues = values),
  options: [
    AtomixChipOption(label: 'Flutter', value: 'Flutter'),
    AtomixChipOption(label: 'Dart', value: 'Dart'),
    // ... more options
  ],
)''';

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixChipGroup<String>(
            multiple: widget.multiple,
            selectedValues: selectedValues,
            onChanged: (values) {
              setState(() {
                selectedValues = values;
              });
            },
            options: const [
              AtomixChipOption(label: 'Flutter', value: 'Flutter'),
              AtomixChipOption(label: 'Dart', value: 'Dart'),
              AtomixChipOption(label: 'Android', value: 'Android'),
              AtomixChipOption(label: 'iOS', value: 'iOS'),
              AtomixChipOption(label: 'Web', value: 'Web'),
              AtomixChipOption(label: 'Desktop', value: 'Desktop'),
            ],
          ),
          const SizedBox(height: 24),
          CodeSnippet(code: code),
        ],
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Single Selection',
  path: '[Molecules]/ChipGroup',
  type: AtomixChipGroup,
)
Widget atomixChipGroupSingle(BuildContext context) {
  return const Center(child: _ChipGroupSingleWrapper());
}

class _ChipGroupSingleWrapper extends StatefulWidget {
  const _ChipGroupSingleWrapper();

  @override
  State<_ChipGroupSingleWrapper> createState() =>
      _ChipGroupSingleWrapperState();
}

class _ChipGroupSingleWrapperState extends State<_ChipGroupSingleWrapper> {
  List<String> selectedValues = ['Small'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixChipGroup<String>(
            multiple: false,
            selectedValues: selectedValues,
            onChanged: (values) => setState(() => selectedValues = values),
            options: const [
              AtomixChipOption(label: 'Small', value: 'Small'),
              AtomixChipOption(label: 'Medium', value: 'Medium'),
              AtomixChipOption(label: 'Large', value: 'Large'),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixChipGroup<String>(
  multiple: false,
  selectedValues: selectedValues,
  onChanged: (values) => setState(() => selectedValues = values),
  options: [
    AtomixChipOption(label: 'Small', value: 'Small'),
    AtomixChipOption(label: 'Medium', value: 'Medium'),
    AtomixChipOption(label: 'Large', value: 'Large'),
  ],
)''',
          ),
        ],
      ),
    );
  }
}
