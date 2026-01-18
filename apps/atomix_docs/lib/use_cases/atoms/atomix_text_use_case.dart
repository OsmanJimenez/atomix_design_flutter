import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixText)
Widget atomixTextDefault(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixText('Hello, Atomix!'),
          const SizedBox(height: 24),
          const CodeSnippet(code: '''AtomixText('Hello, Atomix!')'''),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Display Large', type: AtomixText)
Widget atomixTextDisplayLarge(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixText(
            'Display Large',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixText(
  'Display Large',
  style: Theme.of(context).textTheme.displayLarge,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Headline Medium', type: AtomixText)
Widget atomixTextHeadlineMedium(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixText(
            'Headline Medium',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixText(
  'Headline Medium',
  style: Theme.of(context).textTheme.headlineMedium,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Body Large', type: AtomixText)
Widget atomixTextBodyLarge(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixText(
            'Body Large - This is the default body text style',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixText(
  'Body Large - This is the default body text style',
  style: Theme.of(context).textTheme.bodyLarge,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Label Small', type: AtomixText)
Widget atomixTextLabelSmall(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixText(
            'Label Small',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixText(
  'Label Small',
  style: Theme.of(context).textTheme.labelSmall,
)''',
          ),
        ],
      ),
    ),
  );
}
