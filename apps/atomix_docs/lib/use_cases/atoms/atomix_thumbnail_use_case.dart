import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Thumbnail',
  type: AtomixThumbnail,
)
Widget thumbnailPlayground(BuildContext context) {
  final size = context.knobs.double.slider(
    label: 'Thumbnail > Size',
    min: 24,
    max: 200,
    initialValue: 80,
  );

  final imageUrl = context.knobs.string(
    label: 'Thumbnail > Image URL',
    initialValue: 'https://picsum.photos/200',
  );

  final code =
      '''AtomixThumbnail(
  imageUrl: '$imageUrl',
  size: $size,
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixThumbnail(imageUrl: imageUrl, size: size),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Sizes',
  path: '[Atoms]/Thumbnail',
  type: AtomixThumbnail,
)
Widget thumbnailSizes(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          spacing: 16,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            AtomixThumbnail(imageUrl: 'https://picsum.photos/100', size: 32),
            AtomixThumbnail(imageUrl: 'https://picsum.photos/101', size: 64),
            AtomixThumbnail(imageUrl: 'https://picsum.photos/102', size: 96),
          ],
        ),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixThumbnail(imageUrl: '...', size: 64)'''),
      ],
    ),
  );
}
