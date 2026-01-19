import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Dot (Status)', path: '[Atoms]', type: AtomixDot)
Widget dotUseCase(BuildContext context) {
  final size = context.knobs.double.slider(
    label: 'Size',
    min: 4,
    max: 24,
    initialValue: 12,
  );

  final isPulsing = context.knobs.boolean(
    label: 'Is Pulsing',
    initialValue: true,
  );

  return Padding(
    padding: const EdgeInsets.all(AtomixSpacing.lg),
    child: Column(
      children: [
        const AtomixText(
          'AtomixDot',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.md(),
        const AtomixText(
          'Small status indicators with optional pulsing animation.',
        ),
        const AtomixSpacer.xl(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                AtomixDot(
                  size: size,
                  color: AtomixColors.success,
                  isPulsing: isPulsing,
                ),
                const AtomixSpacer.xs(),
                const AtomixText('Online'),
              ],
            ),
            const AtomixSpacer.xl(),
            Column(
              children: [
                AtomixDot(
                  size: size,
                  color: AtomixColors.error,
                  isPulsing: false,
                ),
                const AtomixSpacer.xs(),
                const AtomixText('Offline'),
              ],
            ),
            const AtomixSpacer.xl(),
            Column(
              children: [
                AtomixDot(
                  size: size,
                  color: AtomixColors.warning,
                  isPulsing: isPulsing,
                ),
                const AtomixSpacer.xs(),
                const AtomixText('Away'),
              ],
            ),
          ],
        ),
        const AtomixSpacer.xl(),
        CodeSnippet(
          code:
              '''AtomixDot(
  size: $size,
  color: AtomixColors.success,
  isPulsing: $isPulsing,
)''',
        ),
      ],
    ),
  );
}
