import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Data Point',
  type: AtomixDataPoint,
)
Widget atomixDataPointPlayground(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: 'Status');
  final value = context.knobs.string(label: 'Value', initialValue: 'Active');

  final code =
      '''AtomixDataPoint(
  label: '$label',
  value: '$value',
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixDataPoint(label: label, value: value),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Comparison',
  path: '[Atoms]/Data Point',
  type: AtomixDataPoint,
)
Widget atomixDataPointComparison(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AtomixDataPoint(label: 'Created', value: '2024-02-14'),
        AtomixDataPoint(label: 'Updated', value: 'Just now'),
        AtomixDataPoint(label: 'Author', value: 'Osman Jimenez'),
      ],
    ),
  );
}
