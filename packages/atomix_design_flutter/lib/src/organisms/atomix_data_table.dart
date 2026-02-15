import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixDataTable extends StatelessWidget {
  final List<String> columns;
  final List<List<String>> rows;
  final bool sortable;
  final int? sortColumnIndex;
  final bool sortAscending;
  final ValueChanged<int>? onSort;

  const AtomixDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.sortable = false,
    this.sortColumnIndex,
    this.sortAscending = true,
    this.onSort,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          sortColumnIndex: sortColumnIndex,
          sortAscending: sortAscending,
          columns: columns.asMap().entries.map((entry) {
            final column = entry.value;
            return DataColumn(
              label: Text(
                column,
                style: theme.typography.labelLarge.copyWith(
                  color: theme.colors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onSort: sortable && onSort != null
                  ? (columnIndex, ascending) => onSort!(columnIndex)
                  : null,
            );
          }).toList(),
          rows: rows.map((row) {
            return DataRow(
              cells: row.map((cell) {
                return DataCell(
                  Text(
                    cell,
                    style: theme.typography.bodyMedium.copyWith(
                      color: theme.colors.textSecondary,
                    ),
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
