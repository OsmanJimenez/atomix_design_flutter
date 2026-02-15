import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/Breadcrumb',
  type: AtomixBreadcrumb,
)
Widget atomixBreadcrumbPlayground(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixBreadcrumb(
            items: [
              AtomixBreadcrumbItem(label: 'Home', onTap: () {}),
              AtomixBreadcrumbItem(label: 'Products', onTap: () {}),
              AtomixBreadcrumbItem(label: 'Categories', onTap: () {}),
              AtomixBreadcrumbItem(label: 'Electronics', isLast: true),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBreadcrumb(
  items: [
    AtomixBreadcrumbItem(label: 'Home', onTap: () {}),
    AtomixBreadcrumbItem(label: 'Products', onTap: () {}),
    AtomixBreadcrumbItem(label: 'Categories', onTap: () {}),
    AtomixBreadcrumbItem(label: 'Electronics', isLast: true),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Short Path',
  path: '[Molecules]/Breadcrumb',
  type: AtomixBreadcrumb,
)
Widget atomixBreadcrumbShort(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixBreadcrumb(
            items: [
              AtomixBreadcrumbItem(label: 'Home', onTap: () {}),
              AtomixBreadcrumbItem(label: 'Settings', isLast: true),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBreadcrumb(
  items: [
    AtomixBreadcrumbItem(label: 'Home', onTap: () {}),
    AtomixBreadcrumbItem(label: 'Settings', isLast: true),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Long Path',
  path: '[Molecules]/Breadcrumb',
  type: AtomixBreadcrumb,
)
Widget atomixBreadcrumbLong(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixBreadcrumb(
            items: [
              AtomixBreadcrumbItem(label: 'Home', onTap: () {}),
              AtomixBreadcrumbItem(label: 'Shop', onTap: () {}),
              AtomixBreadcrumbItem(label: 'Electronics', onTap: () {}),
              AtomixBreadcrumbItem(label: 'Computers', onTap: () {}),
              AtomixBreadcrumbItem(label: 'Laptops', onTap: () {}),
              AtomixBreadcrumbItem(label: 'Gaming', isLast: true),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBreadcrumb(
  items: [
    AtomixBreadcrumbItem(label: 'Home', onTap: () {}),
    AtomixBreadcrumbItem(label: 'Shop', onTap: () {}),
    // ... more items
    AtomixBreadcrumbItem(label: 'Gaming', isLast: true),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}
