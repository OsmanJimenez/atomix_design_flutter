import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Small', type: AtomixSpacer)
Widget atomixSpacerSmall(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(color: Colors.blue, height: 50, width: 100),
          const AtomixSpacer.sm(),
          Container(color: Colors.red, height: 50, width: 100),
          const SizedBox(height: 24),
          const CodeSnippet(code: '''AtomixSpacer.sm()'''),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Medium', type: AtomixSpacer)
Widget atomixSpacerMedium(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(color: Colors.blue, height: 50, width: 100),
          const AtomixSpacer.md(),
          Container(color: Colors.red, height: 50, width: 100),
          const SizedBox(height: 24),
          const CodeSnippet(code: '''AtomixSpacer.md()'''),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Large', type: AtomixSpacer)
Widget atomixSpacerLarge(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(color: Colors.blue, height: 50, width: 100),
          const AtomixSpacer.lg(),
          Container(color: Colors.red, height: 50, width: 100),
          const SizedBox(height: 24),
          const CodeSnippet(code: '''AtomixSpacer.lg()'''),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Horizontal', type: AtomixSpacer)
Widget atomixSpacerHorizontal(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(color: Colors.blue, height: 50, width: 50),
              const AtomixSpacer.horizontal(AtomixSpacing.md),
              Container(color: Colors.red, height: 50, width: 50),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixSpacer.horizontal(AtomixSpacing.md)''',
          ),
        ],
      ),
    ),
  );
}
