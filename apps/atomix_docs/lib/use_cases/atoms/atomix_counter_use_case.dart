import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Counter',
  type: AtomixCounter,
)
Widget counterPlayground(BuildContext context) {
  final count = context.knobs.double
      .slider(label: 'Counter > Count', min: 0, max: 150, initialValue: 12)
      .toInt();

  final maxCount = context.knobs.double
      .slider(label: 'Counter > Max Count', min: 10, max: 999, initialValue: 99)
      .toInt();

  final code =
      '''AtomixCounter(
  count: $count,
  maxCount: $maxCount,
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixCounter(count: count, maxCount: maxCount),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Small Count',
  path: '[Atoms]/Counter',
  type: AtomixCounter,
)
Widget counterSmall(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixCounter(count: 5),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixCounter(count: 5)'''),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Max Overflow',
  path: '[Atoms]/Counter',
  type: AtomixCounter,
)
Widget counterOverflow(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixCounter(count: 150, maxCount: 99),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixCounter(count: 150, maxCount: 99)'''),
      ],
    ),
  );
}
