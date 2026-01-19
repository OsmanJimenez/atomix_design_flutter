import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Avatar',
  type: AtomixAvatar,
)
Widget avatarPlayground(BuildContext context) {
  final size = context.knobs.double.slider(
    label: 'Avatar > Size',
    min: 20,
    max: 200,
    initialValue: 80,
  );

  final initials = context.knobs.string(
    label: 'Avatar > Initials',
    initialValue: 'OJ',
  );

  final imageUrl = context.knobs.string(
    label: 'Avatar > Image URL',
    initialValue: 'https://i.pravatar.cc/300',
  );

  final useImage = context.knobs.boolean(
    label: 'Avatar > Use Image',
    initialValue: true,
  );

  final code =
      '''AtomixAvatar(
  size: $size,
  initials: '$initials',
  ${useImage ? "imageUrl: '$imageUrl'," : "// No image"}
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixAvatar(
            size: size,
            initials: initials,
            imageUrl: useImage ? imageUrl : null,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Image',
  path: '[Atoms]/Avatar',
  type: AtomixAvatar,
)
Widget avatarImage(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixAvatar(size: 100, imageUrl: 'https://i.pravatar.cc/300'),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixAvatar(
  size: 100,
  imageUrl: 'https://i.pravatar.cc/300',
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Initials',
  path: '[Atoms]/Avatar',
  type: AtomixAvatar,
)
Widget avatarInitials(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixAvatar(size: 100, initials: 'AD'),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixAvatar(
  size: 100,
  initials: 'AD',
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Small Size',
  path: '[Atoms]/Avatar',
  type: AtomixAvatar,
)
Widget avatarSmall(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixAvatar(size: 32, imageUrl: 'https://i.pravatar.cc/100'),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixAvatar(
  size: 32,
  imageUrl: 'https://...',
)''',
        ),
      ],
    ),
  );
}
