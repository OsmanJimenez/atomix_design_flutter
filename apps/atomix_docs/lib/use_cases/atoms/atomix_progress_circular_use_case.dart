import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Progress Circular',
  type: AtomixProgressCircular,
)
Widget progressCircularPlayground(BuildContext context) {
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

  final size = context.knobs.double.slider(
    label: 'Progress > Size',
    min: 16,
    max: 100,
    initialValue: 40,
  );

  final code =
      '''AtomixProgressCircular(
  value: ${isIndeterminate ? 'null' : progress},
  size: $size,
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixProgressCircular(
            value: isIndeterminate ? null : progress,
            size: size,
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
  path: '[Atoms]/Progress Circular',
  type: AtomixProgressCircular,
)
Widget progressCircularIndeterminate(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixProgressCircular(value: null),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixProgressCircular(value: null)'''),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Determinate',
  path: '[Atoms]/Progress Circular',
  type: AtomixProgressCircular,
)
Widget progressCircularDeterminate(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixProgressCircular(value: 0.75, size: 48),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixProgressCircular(value: 0.75, size: 48)'''),
      ],
    ),
  );
}
