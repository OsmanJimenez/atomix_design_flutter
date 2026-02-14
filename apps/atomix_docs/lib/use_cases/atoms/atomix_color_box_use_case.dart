import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Color Box',
  type: AtomixColorBox,
)
Widget atomixColorBoxPlayground(BuildContext context) {
  final size = context.knobs.double.slider(
    label: 'Size',
    initialValue: 48,
    min: 24,
    max: 120,
  );

  final code =
      '''AtomixColorBox(
  color: AtomixColors.primary,
  size: $size,
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixColorBox(color: AtomixColors.primary, size: size),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Semantic Colors',
  path: '[Atoms]/Color Box',
  type: AtomixColorBox,
)
Widget atomixColorBoxSemantic(BuildContext context) {
  return const Center(
    child: Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        AtomixColorBox(color: AtomixColors.primary),
        AtomixColorBox(color: AtomixColors.secondary),
        AtomixColorBox(color: AtomixColors.success),
        AtomixColorBox(color: AtomixColors.warning),
        AtomixColorBox(color: AtomixColors.error),
        AtomixColorBox(color: AtomixColors.info),
      ],
    ),
  );
}
