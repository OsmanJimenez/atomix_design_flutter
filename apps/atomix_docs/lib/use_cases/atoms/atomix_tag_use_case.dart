import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Tag', path: '[Atoms]', type: AtomixTag)
Widget tagUseCase(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: 'Beta');

  final showIcon = context.knobs.boolean(
    label: 'Show Icon',
    initialValue: true,
  );

  return Padding(
    padding: const EdgeInsets.all(AtomixSpacing.lg),
    child: Column(
      children: [
        const AtomixText(
          'AtomixTag',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.md(),
        const AtomixText(
          'Small decorative tags for categorization or status labels.',
        ),
        const AtomixSpacer.xl(),
        Wrap(
          spacing: AtomixSpacing.md,
          children: [
            AtomixTag(label: label, icon: showIcon ? Icons.label : null),
            AtomixTag(
              label: 'New',
              color: AtomixColors.success,
              icon: showIcon ? Icons.star : null,
            ),
            AtomixTag(
              label: 'Hot',
              color: AtomixColors.error,
              icon: showIcon ? Icons.whatshot : null,
            ),
          ],
        ),
        const AtomixSpacer.xl(),
        CodeSnippet(
          code:
              '''AtomixTag(
  label: '$label',
  icon: ${showIcon ? 'Icons.label' : 'null'},
  color: AtomixColors.primary,
)''',
        ),
      ],
    ),
  );
}
