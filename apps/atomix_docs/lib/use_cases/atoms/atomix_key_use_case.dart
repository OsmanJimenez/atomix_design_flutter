import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Playground', path: '[Atoms]/Key', type: AtomixKey)
Widget atomixKeyPlayground(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: '⌘ K');

  final code =
      '''AtomixKey(
  label: '$label',
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixKey(label: label),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Key Combination',
  path: '[Atoms]/Key',
  type: AtomixKey,
)
Widget atomixKeyCombination(BuildContext context) {
  return const Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixKey(label: 'Ctrl'),
        SizedBox(width: 8),
        AtomixKey(label: 'V'),
      ],
    ),
  );
}
