import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Horizontal', type: AtomixDivider)
Widget atomixDividerHorizontal(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixDivider(),
          const SizedBox(height: 24),
          const CodeSnippet(code: '''AtomixDivider()'''),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Thick', type: AtomixDivider)
Widget atomixDividerThick(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixDivider(thickness: 2),
          const SizedBox(height: 24),
          const CodeSnippet(code: '''AtomixDivider(thickness: 2)'''),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Color', type: AtomixDivider)
Widget atomixDividerWithColor(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixDivider(thickness: 1, color: AtomixColors.primary),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixDivider(
  thickness: 1,
  color: AtomixColors.primary,
)''',
          ),
        ],
      ),
    ),
  );
}
