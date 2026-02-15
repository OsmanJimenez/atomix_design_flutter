import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/DatePicker',
  type: AtomixDatePicker,
)
Widget atomixDatePickerPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Select Date',
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: _DatePickerWrapper(label: label.isNotEmpty ? label : null),
    ),
  );
}

class _DatePickerWrapper extends StatefulWidget {
  final String? label;

  const _DatePickerWrapper({this.label});

  @override
  State<_DatePickerWrapper> createState() => _DatePickerWrapperState();
}

class _DatePickerWrapperState extends State<_DatePickerWrapper> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final code =
        '''AtomixDatePicker(
  selectedDate: selectedDate,
  label: '${widget.label ?? 'Select Date'}',
  onDateSelected: (date) => setState(() => selectedDate = date),
)''';

    return Column(
      children: [
        AtomixDatePicker(
          selectedDate: selectedDate,
          label: widget.label,
          onDateSelected: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
        const SizedBox(height: 24),
        if (selectedDate != null)
          Text('Selected: ${selectedDate!.toLocal().toString().split(' ')[0]}'),
        const SizedBox(height: 24),
        CodeSnippet(code: code),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Birth Date',
  path: '[Molecules]/DatePicker',
  type: AtomixDatePicker,
)
Widget atomixDatePickerBirthDate(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: _DatePickerBirthWrapper(),
    ),
  );
}

class _DatePickerBirthWrapper extends StatefulWidget {
  const _DatePickerBirthWrapper();

  @override
  State<_DatePickerBirthWrapper> createState() =>
      _DatePickerBirthWrapperState();
}

class _DatePickerBirthWrapperState extends State<_DatePickerBirthWrapper> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixDatePicker(
          selectedDate: selectedDate,
          label: 'Date of Birth',
          onDateSelected: (date) => setState(() => selectedDate = date),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixDatePicker(
  selectedDate: selectedDate,
  label: 'Date of Birth',
  onDateSelected: (date) => setState(() => selectedDate = date),
)''',
        ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Event Date',
  path: '[Molecules]/DatePicker',
  type: AtomixDatePicker,
)
Widget atomixDatePickerEvent(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: _DatePickerEventWrapper(),
    ),
  );
}

class _DatePickerEventWrapper extends StatefulWidget {
  const _DatePickerEventWrapper();

  @override
  State<_DatePickerEventWrapper> createState() =>
      _DatePickerEventWrapperState();
}

class _DatePickerEventWrapperState extends State<_DatePickerEventWrapper> {
  DateTime? selectedDate = DateTime.now().add(const Duration(days: 7));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixDatePicker(
          selectedDate: selectedDate,
          label: 'Event Date',
          onDateSelected: (date) => setState(() => selectedDate = date),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixDatePicker(
  selectedDate: DateTime.now().add(Duration(days: 7)),
  label: 'Event Date',
  onDateSelected: (date) => setState(() => selectedDate = date),
)''',
        ),
      ],
    );
  }
}
