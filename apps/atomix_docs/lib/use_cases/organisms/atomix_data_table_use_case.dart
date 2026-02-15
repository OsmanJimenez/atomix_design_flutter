import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/DataTable',
  type: AtomixDataTable,
)
Widget atomixDataTablePlayground(BuildContext context) {
  final sortable = context.knobs.boolean(label: 'Sortable', initialValue: true);

  final code =
      '''AtomixDataTable(
  columns: ['Name', 'Email', 'Role', 'Status'],
  rows: [
    ['John Doe', 'john@example.com', 'Admin', 'Active'],
    ['Jane Smith', 'jane@example.com', 'User', 'Active'],
    ['Bob Johnson', 'bob@example.com', 'User', 'Inactive'],
  ],
  sortable: $sortable,
  onSort: (columnIndex) {
    // Handle sorting
  },
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DataTableWrapper(sortable: sortable),
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

class _DataTableWrapper extends StatefulWidget {
  final bool sortable;

  const _DataTableWrapper({required this.sortable});

  @override
  State<_DataTableWrapper> createState() => _DataTableWrapperState();
}

class _DataTableWrapperState extends State<_DataTableWrapper> {
  int? sortColumnIndex;
  bool sortAscending = true;

  final columns = ['Name', 'Email', 'Role', 'Status'];
  final rows = [
    ['John Doe', 'john@example.com', 'Admin', 'Active'],
    ['Jane Smith', 'jane@example.com', 'User', 'Active'],
    ['Bob Johnson', 'bob@example.com', 'User', 'Inactive'],
  ];

  @override
  Widget build(BuildContext context) {
    return AtomixDataTable(
      columns: columns,
      rows: rows,
      sortable: widget.sortable,
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAscending,
      onSort: (columnIndex) {
        setState(() {
          if (sortColumnIndex == columnIndex) {
            sortAscending = !sortAscending;
          } else {
            sortColumnIndex = columnIndex;
            sortAscending = true;
          }
        });
      },
    );
  }
}

@widgetbook.UseCase(
  name: 'Employee List',
  path: '[Organisms]/DataTable',
  type: AtomixDataTable,
)
Widget atomixDataTableEmployees(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const _DataTableEmployeesWrapper(),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixDataTable(
  columns: ['Employee', 'Department', 'Position', 'Salary'],
  rows: [
    ['Alice Williams', 'Engineering', 'Senior Dev', '\$120k'],
    ['Bob Martinez', 'Marketing', 'Manager', '\$95k'],
    ['Charlie Lee', 'Sales', 'Rep', '\$75k'],
  ],
  sortable: true,
  onSort: (columnIndex) {},
)''',
          ),
        ],
      ),
    ),
  );
}

class _DataTableEmployeesWrapper extends StatefulWidget {
  const _DataTableEmployeesWrapper();

  @override
  State<_DataTableEmployeesWrapper> createState() =>
      _DataTableEmployeesWrapperState();
}

class _DataTableEmployeesWrapperState
    extends State<_DataTableEmployeesWrapper> {
  int? sortColumnIndex;
  bool sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return AtomixDataTable(
      columns: const ['Employee', 'Department', 'Position', 'Salary'],
      rows: const [
        ['Alice Williams', 'Engineering', 'Senior Dev', '\$120k'],
        ['Bob Martinez', 'Marketing', 'Manager', '\$95k'],
        ['Charlie Lee', 'Sales', 'Rep', '\$75k'],
      ],
      sortable: true,
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAscending,
      onSort: (columnIndex) {
        setState(() {
          if (sortColumnIndex == columnIndex) {
            sortAscending = !sortAscending;
          } else {
            sortColumnIndex = columnIndex;
            sortAscending = true;
          }
        });
      },
    );
  }
}
