import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixIcon)
Widget atomixIconDefault(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixIcon(Icons.star),
          const SizedBox(height: 24),
          const CodeSnippet(code: '''AtomixIcon(Icons.star)'''),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Large', type: AtomixIcon)
Widget atomixIconLarge(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixIcon(Icons.favorite, size: 48),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixIcon(
  Icons.favorite,
  size: 48,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Color', type: AtomixIcon)
Widget atomixIconWithColor(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixIcon(
            Icons.check_circle,
            color: AtomixColors.success,
            size: 32,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixIcon(
  Icons.check_circle,
  color: AtomixColors.success,
  size: 32,
)''',
          ),
        ],
      ),
    ),
  );
}
