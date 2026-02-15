import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/Dropdown',
  type: AtomixDropdown,
)
Widget atomixDropdownPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Select Country',
  );

  final hint = context.knobs.string(
    label: 'Hint',
    initialValue: 'Choose an option',
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: _DropdownWrapper(
        label: label.isNotEmpty ? label : null,
        hint: hint.isNotEmpty ? hint : null,
      ),
    ),
  );
}

class _DropdownWrapper extends StatefulWidget {
  final String? label;
  final String? hint;

  const _DropdownWrapper({this.label, this.hint});

  @override
  State<_DropdownWrapper> createState() => _DropdownWrapperState();
}

class _DropdownWrapperState extends State<_DropdownWrapper> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final code =
        '''AtomixDropdown<String>(
  value: selectedValue,
  label: '${widget.label}',
  hint: '${widget.hint}',
  items: [
    AtomixDropdownItem(label: 'United States', value: 'US'),
    AtomixDropdownItem(label: 'Canada', value: 'CA'),
    AtomixDropdownItem(label: 'Mexico', value: 'MX'),
  ],
  onChanged: (value) => setState(() => selectedValue = value),
)''';

    return Column(
      children: [
        AtomixDropdown<String>(
          value: selectedValue,
          label: widget.label,
          hint: widget.hint,
          items: const [
            AtomixDropdownItem(label: 'United States', value: 'US'),
            AtomixDropdownItem(label: 'Canada', value: 'CA'),
            AtomixDropdownItem(label: 'Mexico', value: 'MX'),
            AtomixDropdownItem(label: 'United Kingdom', value: 'UK'),
            AtomixDropdownItem(label: 'Germany', value: 'DE'),
          ],
          onChanged: (value) {
            setState(() {
              selectedValue = value;
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
  name: 'Simple Dropdown',
  path: '[Molecules]/Dropdown',
  type: AtomixDropdown,
)
Widget atomixDropdownSimple(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: _DropdownSimpleWrapper(),
    ),
  );
}

class _DropdownSimpleWrapper extends StatefulWidget {
  const _DropdownSimpleWrapper();

  @override
  State<_DropdownSimpleWrapper> createState() => _DropdownSimpleWrapperState();
}

class _DropdownSimpleWrapperState extends State<_DropdownSimpleWrapper> {
  String? selectedValue = 'small';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixDropdown<String>(
          value: selectedValue,
          label: 'Size',
          items: const [
            AtomixDropdownItem(label: 'Small', value: 'small'),
            AtomixDropdownItem(label: 'Medium', value: 'medium'),
            AtomixDropdownItem(label: 'Large', value: 'large'),
          ],
          onChanged: (value) => setState(() => selectedValue = value),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixDropdown<String>(
  value: selectedValue,
  label: 'Size',
  items: [
    AtomixDropdownItem(label: 'Small', value: 'small'),
    AtomixDropdownItem(label: 'Medium', value: 'medium'),
    AtomixDropdownItem(label: 'Large', value: 'large'),
  ],
  onChanged: (value) => setState(() => selectedValue = value),
)''',
        ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'With Hint',
  path: '[Molecules]/Dropdown',
  type: AtomixDropdown,
)
Widget atomixDropdownWithHint(BuildContext context) {
  return const Center(
    child: Padding(padding: EdgeInsets.all(24), child: _DropdownHintWrapper()),
  );
}

class _DropdownHintWrapper extends StatefulWidget {
  const _DropdownHintWrapper();

  @override
  State<_DropdownHintWrapper> createState() => _DropdownHintWrapperState();
}

class _DropdownHintWrapperState extends State<_DropdownHintWrapper> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixDropdown<String>(
          value: selectedValue,
          label: 'Language',
          hint: 'Select your preferred language',
          items: const [
            AtomixDropdownItem(label: 'English', value: 'en'),
            AtomixDropdownItem(label: 'Spanish', value: 'es'),
            AtomixDropdownItem(label: 'French', value: 'fr'),
            AtomixDropdownItem(label: 'German', value: 'de'),
          ],
          onChanged: (value) => setState(() => selectedValue = value),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixDropdown<String>(
  value: selectedValue,
  label: 'Language',
  hint: 'Select your preferred language',
  items: [
    AtomixDropdownItem(label: 'English', value: 'en'),
    AtomixDropdownItem(label: 'Spanish', value: 'es'),
    AtomixDropdownItem(label: 'French', value: 'fr'),
    AtomixDropdownItem(label: 'German', value: 'de'),
  ],
  onChanged: (value) => setState(() => selectedValue = value),
)''',
        ),
      ],
    );
  }
}
