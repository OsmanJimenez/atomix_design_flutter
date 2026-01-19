import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Progress Indicators',
  path: '[Atoms]',
  type: AtomixProgressCircular,
)
Widget progressUseCase(BuildContext context) {
  final progress = context.knobs.double.slider(
    label: 'Progress',
    min: 0,
    max: 1,
    initialValue: 0.6,
  );

  final isIndeterminate = context.knobs.boolean(
    label: 'Is Indeterminate',
    initialValue: false,
  );

  return Padding(
    padding: const EdgeInsets.all(AtomixSpacing.lg),
    child: Column(
      children: [
        const AtomixText(
          'Progress Indicators',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.md(),
        const AtomixText(
          'Visual indicators for loading states or task progress.',
        ),
        const AtomixSpacer.xl(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AtomixProgressCircular(
              value: isIndeterminate ? null : progress,
              size: 40,
            ),
            const AtomixSpacer.xl(),
            Expanded(
              child: AtomixProgressLinear(
                value: isIndeterminate ? null : progress,
                height: 12,
              ),
            ),
          ],
        ),
        const AtomixSpacer.xl(),
        CodeSnippet(
          code:
              '''// Circular
AtomixProgressCircular(
  value: ${isIndeterminate ? 'null' : progress.toStringAsFixed(2)},
)

// Linear
AtomixProgressLinear(
  value: ${isIndeterminate ? 'null' : progress.toStringAsFixed(2)},
)''',
        ),
      ],
    ),
  );
}
