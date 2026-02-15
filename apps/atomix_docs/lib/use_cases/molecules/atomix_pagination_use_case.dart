import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/Pagination',
  type: AtomixPagination,
)
Widget atomixPaginationPlayground(BuildContext context) {
  final totalPages = context.knobs.int.slider(
    label: 'Total Pages',
    initialValue: 10,
    min: 1,
    max: 20,
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: _PaginationWrapper(totalPages: totalPages),
    ),
  );
}

class _PaginationWrapper extends StatefulWidget {
  final int totalPages;

  const _PaginationWrapper({required this.totalPages});

  @override
  State<_PaginationWrapper> createState() => _PaginationWrapperState();
}

class _PaginationWrapperState extends State<_PaginationWrapper> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final code =
        '''AtomixPagination(
  totalPages: ${widget.totalPages},
  currentPage: currentPage,
  onPageChanged: (page) => setState(() => currentPage = page),
)''';

    return Column(
      children: [
        AtomixPagination(
          totalPages: widget.totalPages,
          currentPage: currentPage,
          onPageChanged: (page) {
            setState(() {
              currentPage = page;
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
  name: 'Few Pages',
  path: '[Molecules]/Pagination',
  type: AtomixPagination,
)
Widget atomixPaginationFew(BuildContext context) {
  return const Center(
    child: Padding(padding: EdgeInsets.all(24), child: _PaginationFewWrapper()),
  );
}

class _PaginationFewWrapper extends StatefulWidget {
  const _PaginationFewWrapper();

  @override
  State<_PaginationFewWrapper> createState() => _PaginationFewWrapperState();
}

class _PaginationFewWrapperState extends State<_PaginationFewWrapper> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixPagination(
          totalPages: 5,
          currentPage: currentPage,
          onPageChanged: (page) => setState(() => currentPage = page),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixPagination(
  totalPages: 5,
  currentPage: currentPage,
  onPageChanged: (page) => setState(() => currentPage = page),
)''',
        ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Many Pages',
  path: '[Molecules]/Pagination',
  type: AtomixPagination,
)
Widget atomixPaginationMany(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: _PaginationManyWrapper(),
    ),
  );
}

class _PaginationManyWrapper extends StatefulWidget {
  const _PaginationManyWrapper();

  @override
  State<_PaginationManyWrapper> createState() => _PaginationManyWrapperState();
}

class _PaginationManyWrapperState extends State<_PaginationManyWrapper> {
  int currentPage = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixPagination(
          totalPages: 20,
          currentPage: currentPage,
          onPageChanged: (page) => setState(() => currentPage = page),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixPagination(
  totalPages: 20,
  currentPage: currentPage,
  onPageChanged: (page) => setState(() => currentPage = page),
)''',
        ),
      ],
    );
  }
}
