import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Avatar', path: '[Atoms]', type: AtomixAvatar)
Widget avatarUseCase(BuildContext context) {
  final size = context.knobs.double.slider(
    label: 'Size',
    min: 20,
    max: 200,
    initialValue: 80,
  );

  final initials = context.knobs.string(label: 'Initials', initialValue: 'OJ');

  final imageUrl = context.knobs.string(
    label: 'Image URL',
    initialValue: 'https://i.pravatar.cc/300',
  );

  final useImage = context.knobs.boolean(
    label: 'Use Image',
    initialValue: true,
  );

  return Padding(
    padding: const EdgeInsets.all(AtomixSpacing.lg),
    child: Column(
      children: [
        const AtomixText(
          'AtomixAvatar',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.md(),
        const AtomixText(
          'Circular user representation with initials or image support.',
        ),
        const AtomixSpacer.xl(),
        AtomixAvatar(
          size: size,
          initials: initials,
          imageUrl: useImage ? imageUrl : null,
        ),
        const AtomixSpacer.xl(),
        CodeSnippet(
          code:
              '''AtomixAvatar(
  size: $size,
  initials: '$initials',
  ${useImage ? "imageUrl: '$imageUrl'," : "// No image"}
)''',
        ),
      ],
    ),
  );
}
