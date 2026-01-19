import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Label', path: '[Atoms]', type: AtomixLabel)
Widget labelUseCase(BuildContext context) {
  final labelText = context.knobs.string(
    label: 'Label Text',
    initialValue: 'Email Address',
  );

  final subLabel = context.knobs.string(
    label: 'Sub Label',
    initialValue: 'We will never share your email.',
  );

  final isRequired = context.knobs.boolean(
    label: 'Is Required',
    initialValue: true,
  );

  final isError = context.knobs.boolean(label: 'Is Error', initialValue: false);

  return Padding(
    padding: const EdgeInsets.all(AtomixSpacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AtomixText(
          'AtomixLabel',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.md(),
        const AtomixText(
          'A structural label for forms with requirement indicators and help text.',
        ),
        const AtomixSpacer.xl(),
        AtomixLabel(
          label: labelText,
          subLabel: subLabel.isEmpty ? null : subLabel,
          isRequired: isRequired,
          isError: isError,
        ),
        const AtomixSpacer.xl(),
        CodeSnippet(
          code:
              '''AtomixLabel(
  label: '$labelText',
  subLabel: ${subLabel.isEmpty ? 'null' : "'$subLabel'"},
  isRequired: $isRequired,
  isError: $isError,
)''',
        ),
      ],
    ),
  );
}
