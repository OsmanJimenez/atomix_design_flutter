import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/Calendar',
  type: AtomixCalendar,
)
Widget atomixCalendarPlayground(BuildContext context) {
  final code = '''AtomixCalendar(
  selectedDate: selectedDate,
  onDateSelected: (date) {
    setState(() {
      selectedDate = date;
    });
  },
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CalendarWrapper(),
          const SizedBox(height: 32),
          const Text(
            'Code:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

class _CalendarWrapper extends StatefulWidget {
  @override
  State<_CalendarWrapper> createState() => _CalendarWrapperState();
}

class _CalendarWrapperState extends State<_CalendarWrapper> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AtomixCalendar(
          selectedDate: selectedDate,
          onDateSelected: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
        if (selectedDate != null) ...[
          const SizedBox(height: 16),
          Text('Selected: ${selectedDate!.toString().split(' ')[0]}'),
        ],
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Event Booking',
  path: '[Organisms]/Calendar',
  type: AtomixCalendar,
)
Widget atomixCalendarBooking(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const _CalendarBookingWrapper(),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixCalendar(
  selectedDate: selectedDate,
  onDateSelected: (date) => setState(() => selectedDate = date),
)''',
          ),
        ],
      ),
    ),
  );
}

class _CalendarBookingWrapper extends StatefulWidget {
  const _CalendarBookingWrapper();

  @override
  State<_CalendarBookingWrapper> createState() =>
      _CalendarBookingWrapperState();
}

class _CalendarBookingWrapperState extends State<_CalendarBookingWrapper> {
  DateTime? selectedDate = DateTime.now().add(const Duration(days: 7));

  @override
  Widget build(BuildContext context) {
    return AtomixCalendar(
      selectedDate: selectedDate,
      onDateSelected: (date) => setState(() => selectedDate = date),
    );
  }
}

@widgetbook.UseCase(
  name: 'Date Range',
  path: '[Organisms]/Calendar',
  type: AtomixCalendar,
)
Widget atomixCalendarRange(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const _CalendarRangeWrapper(),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixCalendar(
  selectedDate: selectedDate,
  onDateSelected: (date) => setState(() => selectedDate = date),
)''',
          ),
        ],
      ),
    ),
  );
}

class _CalendarRangeWrapper extends StatefulWidget {
  const _CalendarRangeWrapper();

  @override
  State<_CalendarRangeWrapper> createState() => _CalendarRangeWrapperState();
}

class _CalendarRangeWrapperState extends State<_CalendarRangeWrapper> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixCalendar(
          selectedDate: selectedDate,
          onDateSelected: (date) => setState(() => selectedDate = date),
        ),
        if (selectedDate != null) ...[
          const SizedBox(height: 16),
          Text(
            'Selected: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ],
    );
  }
}
