import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Step Indicator',
  type: AtomixStepIndicator,
)
Widget atomixStepIndicatorPlayground(BuildContext context) {
  final step = context.knobs.double.slider(
    label: 'Step',
    initialValue: 1,
    min: 1,
    max: 10,
  );
  final active = context.knobs.boolean(label: 'Active', initialValue: false);
  final completed = context.knobs.boolean(
    label: 'Completed',
    initialValue: false,
  );

  final code =
      '''AtomixStepIndicator(
  step: ${step.toInt()},
  active: $active,
  completed: $completed,
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixStepIndicator(
          step: step.toInt(),
          active: active,
          completed: completed,
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Step Progress',
  path: '[Atoms]/Step Indicator',
  type: AtomixStepIndicator,
)
Widget atomixStepIndicatorProgress(BuildContext context) {
  return const Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixStepIndicator(step: 1, completed: true),
        SizedBox(width: 8),
        AtomixStepIndicator(step: 2, active: true),
        SizedBox(width: 8),
        AtomixStepIndicator(step: 3),
      ],
    ),
  );
}
