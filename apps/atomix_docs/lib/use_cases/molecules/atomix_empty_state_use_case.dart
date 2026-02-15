import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/EmptyState',
  type: AtomixEmptyState,
)
Widget atomixEmptyStatePlayground(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'No items found',
  );

  final description = context.knobs.string(
    label: 'Description',
    initialValue:
        'Try adjusting your search or filters to find what you are looking for.',
  );

  final showAction = context.knobs.boolean(
    label: 'Show Action',
    initialValue: true,
  );

  final code =
      '''AtomixEmptyState(
  icon: Icons.inbox_outlined,
  title: '$title',
  description: '${description.isNotEmpty ? description : null}',
  action: ${showAction ? "AtomixButton(label: 'Add Item', onPressed: () {})" : "null"},
)''';

  return Center(
    child: Column(
      children: [
        AtomixEmptyState(
          icon: Icons.inbox_outlined,
          title: title,
          description: description.isNotEmpty ? description : null,
          action: showAction
              ? AtomixButton(label: 'Add Item', onPressed: () {})
              : null,
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.all(24),
          child: CodeSnippet(code: code),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'No Results',
  path: '[Molecules]/EmptyState',
  type: AtomixEmptyState,
)
Widget atomixEmptyStateNoResults(BuildContext context) {
  return Center(
    child: Column(
      children: [
        AtomixEmptyState(
          icon: Icons.search_off,
          title: 'No results found',
          description: 'Try different keywords or check your spelling.',
          action: AtomixButton(label: 'Clear Search', onPressed: () {}),
        ),
        const SizedBox(height: 32),
        const Padding(
          padding: EdgeInsets.all(24),
          child: CodeSnippet(
            code: '''AtomixEmptyState(
  icon: Icons.search_off,
  title: 'No results found',
  description: 'Try different keywords or check your spelling.',
  action: AtomixButton(label: 'Clear Search', onPressed: () {}),
)''',
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Empty Inbox',
  path: '[Molecules]/EmptyState',
  type: AtomixEmptyState,
)
Widget atomixEmptyStateInbox(BuildContext context) {
  return const Center(
    child: Column(
      children: [
        AtomixEmptyState(
          icon: Icons.mail_outline,
          title: 'Inbox is empty',
          description: 'You have no new messages.',
        ),
        SizedBox(height: 32),
        Padding(
          padding: EdgeInsets.all(24),
          child: CodeSnippet(
            code: '''AtomixEmptyState(
  icon: Icons.mail_outline,
  title: 'Inbox is empty',
  description: 'You have no new messages.',
)''',
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'No Data',
  path: '[Molecules]/EmptyState',
  type: AtomixEmptyState,
)
Widget atomixEmptyStateNoData(BuildContext context) {
  return Center(
    child: Column(
      children: [
        AtomixEmptyState(
          icon: Icons.bar_chart_outlined,
          title: 'No data available',
          description: 'Start collecting data to see analytics here.',
          action: AtomixButton(label: 'Get Started', onPressed: () {}),
        ),
        const SizedBox(height: 32),
        const Padding(
          padding: EdgeInsets.all(24),
          child: CodeSnippet(
            code: '''AtomixEmptyState(
  icon: Icons.bar_chart_outlined,
  title: 'No data available',
  description: 'Start collecting data to see analytics here.',
  action: AtomixButton(label: 'Get Started', onPressed: () {}),
)''',
          ),
        ),
      ],
    ),
  );
}
