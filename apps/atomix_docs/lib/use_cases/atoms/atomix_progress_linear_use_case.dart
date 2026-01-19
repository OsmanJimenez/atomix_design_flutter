import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Progress Linear',
  type: AtomixProgressLinear,
)
Widget progressLinearPlayground(BuildContext context) {
  final progress = context.knobs.double.slider(
    label: 'Progress > Value',
    min: 0,
    max: 1,
    initialValue: 0.5,
  );

  final isIndeterminate = context.knobs.boolean(
    label: 'Progress > Is Indeterminate',
    initialValue: false,
  );

  final height = context.knobs.double.slider(
    label: 'Progress > Height',
    min: 2,
    max: 20,
    initialValue: 8,
  );

  final code =
      '''AtomixProgressLinear(
  value: ${isIndeterminate ? 'null' : progress},
  height: $height,
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixProgressLinear(
            value: isIndeterminate ? null : progress,
            height: height,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Indeterminate',
  path: '[Atoms]/Progress Linear',
  type: AtomixProgressLinear,
)
Widget progressLinearIndeterminate(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 300, child: AtomixProgressLinear(value: null)),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixProgressLinear(value: null)'''),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Determinate',
  path: '[Atoms]/Progress Linear',
  type: AtomixProgressLinear,
)
Widget progressLinearDeterminate(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          child: AtomixProgressLinear(value: 0.6, height: 12),
        ),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixProgressLinear(value: 0.6, height: 12)'''),
      ],
    ),
  );
}
