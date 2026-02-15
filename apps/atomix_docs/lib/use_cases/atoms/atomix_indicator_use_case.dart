import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Indicator',
  type: AtomixIndicator,
)
Widget atomixIndicatorPlayground(BuildContext context) {
  final active = context.knobs.boolean(label: 'Active', initialValue: false);

  final code =
      '''AtomixIndicator(
  active: $active,
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixIndicator(active: active),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Indicator List',
  path: '[Atoms]/Indicator',
  type: AtomixIndicator,
)
Widget atomixIndicatorList(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AtomixIndicator(active: true),
            SizedBox(width: 8),
            AtomixIndicator(active: false),
            SizedBox(width: 8),
            AtomixIndicator(active: false),
          ],
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''Row(
  children: [
    AtomixIndicator(active: true),
    AtomixIndicator(active: false),
    AtomixIndicator(active: false),
  ],
)''',
        ),
      ],
    ),
  );
}
