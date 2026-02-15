import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
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
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AtomixBullet(color: AtomixTheme.of(context).colors.success),
            const SizedBox(width: 8),
            AtomixBullet(color: AtomixTheme.of(context).colors.warning),
            const SizedBox(width: 8),
            AtomixBullet(color: AtomixTheme.of(context).colors.error),
            const SizedBox(width: 8),
            AtomixBullet(color: AtomixTheme.of(context).colors.info),
          ],
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
Row(
  children: [
    AtomixBullet(color: theme.colors.success),
    AtomixBullet(color: theme.colors.warning),
    AtomixBullet(color: theme.colors.error),
    AtomixBullet(color: theme.colors.info),
  ],
)''',
        ),
      ],
    ),
  );
}
