import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Bullet',
  type: AtomixBullet,
)
Widget atomixBulletPlayground(BuildContext context) {
  final size = context.knobs.double.slider(
    label: 'Size',
    initialValue: 6,
    min: 2,
    max: 12,
  );

  final code =
      '''AtomixBullet(
  size: $size,
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixBullet(size: size),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Status Colors',
  path: '[Atoms]/Bullet',
  type: AtomixBullet,
)
Widget atomixBulletStatusColors(BuildContext context) {
  return const Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixBullet(color: AtomixColors.success),
        SizedBox(width: 8),
        AtomixBullet(color: AtomixColors.warning),
        SizedBox(width: 8),
        AtomixBullet(color: AtomixColors.error),
        SizedBox(width: 8),
        AtomixBullet(color: AtomixColors.info),
      ],
    ),
  );
}
