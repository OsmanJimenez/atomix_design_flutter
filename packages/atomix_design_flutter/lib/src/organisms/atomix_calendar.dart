import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixCalendar extends StatelessWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const AtomixCalendar({
    super.key,
    this.selectedDate,
    this.onDateSelected,
    this.firstDate,
    this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colors.border),
      ),
      child: CalendarDatePicker(
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: firstDate ?? DateTime(1900),
        lastDate: lastDate ?? DateTime(2100),
        onDateChanged: onDateSelected ?? (_) {},
      ),
    );
  }
}
