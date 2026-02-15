import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Color Box',
  type: AtomixColorBox,
)
Widget atomixColorBoxPlayground(BuildContext context) {
  final size = context.knobs.double.slider(
    label: 'Size',
    initialValue: 48,
    min: 24,
    max: 120,
  );

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixColorBox(
  color: theme.colors.primary,
  size: $size,
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixColorBox(
          color: AtomixTheme.of(context).colors.primary,
          size: size,
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Semantic Colors',
  path: '[Atoms]/Color Box',
  type: AtomixColorBox,
)
Widget atomixColorBoxSemantic(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            AtomixColorBox(color: AtomixTheme.of(context).colors.primary),
            AtomixColorBox(color: AtomixTheme.of(context).colors.secondary),
            AtomixColorBox(color: AtomixTheme.of(context).colors.success),
            AtomixColorBox(color: AtomixTheme.of(context).colors.warning),
            AtomixColorBox(color: AtomixTheme.of(context).colors.error),
            AtomixColorBox(color: AtomixTheme.of(context).colors.info),
          ],
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
Wrap(
  children: [
    AtomixColorBox(color: theme.colors.primary),
    AtomixColorBox(color: theme.colors.secondary),
    AtomixColorBox(color: theme.colors.success),
    // ... more colors
  ],
)''',
        ),
      ],
    ),
  );
}
