import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Breadcrumb Item',
  type: AtomixBreadcrumbItem,
)
Widget breadcrumbPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Breadcrumb > Label',
    initialValue: 'Products',
  );

  final isLast = context.knobs.boolean(
    label: 'Breadcrumb > Is Last',
    initialValue: false,
  );

  final code =
      '''AtomixBreadcrumbItem(
  label: '$label',
  isLast: $isLast,
  onTap: () {},
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AtomixBreadcrumbItem(label: label, isLast: isLast, onTap: () {}),
            ],
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Breadcrumb Trail',
  path: '[Atoms]/Breadcrumb Item',
  type: AtomixBreadcrumbItem,
)
Widget breadcrumbTrail(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AtomixBreadcrumbItem(label: 'Home'),
            AtomixBreadcrumbItem(label: 'Categories'),
            AtomixBreadcrumbItem(label: 'Electronics', isLast: true),
          ],
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''Row(
  children: [
    AtomixBreadcrumbItem(label: 'Home'),
    AtomixBreadcrumbItem(label: 'Categories'),
    AtomixBreadcrumbItem(label: 'Electronics', isLast: true),
  ],
)''',
        ),
      ],
    ),
  );
}
