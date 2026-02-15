import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Stroke',
  type: AtomixStroke,
)
Widget atomixStrokePlayground(BuildContext context) {
  final thickness = context.knobs.double.slider(
    label: 'Thickness',
    initialValue: 1,
    min: 0.5,
    max: 8,
  );

  final showChild = context.knobs.boolean(
    label: 'Show Child',
    initialValue: false,
  );

  final theme = AtomixTheme.of(context);

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixStroke(
  width: 200,
  height: 100,
  thickness: $thickness,
  borderRadius: BorderRadius.all(theme.radius.sm),
  ${showChild ? "child: Center(child: Text('Content'))," : ""}
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixStroke(
          width: 200,
          height: 100,
          thickness: thickness,
          borderRadius: BorderRadius.all(theme.radius.sm),
          child: showChild ? const Center(child: Text('Content')) : null,
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Thin Border',
  path: '[Atoms]/Stroke',
  type: AtomixStroke,
)
Widget atomixStrokeThin(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixStroke(
          width: 150,
          height: 80,
          thickness: 0.5,
          borderRadius: BorderRadius.all(AtomixTheme.of(context).radius.md),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
AtomixStroke(
  width: 150,
  height: 80,
  thickness: 0.5,
  borderRadius: BorderRadius.all(theme.radius.md),
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Thick Border',
  path: '[Atoms]/Stroke',
  type: AtomixStroke,
)
Widget atomixStrokeThick(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixStroke(
          width: 150,
          height: 80,
          thickness: 4,
          borderRadius: BorderRadius.all(AtomixTheme.of(context).radius.lg),
          child: const Center(child: Text('Thick Border')),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
AtomixStroke(
  width: 150,
  height: 80,
  thickness: 4,
  borderRadius: BorderRadius.all(theme.radius.lg),
  child: Center(child: Text('Thick Border')),
)''',
        ),
      ],
    ),
  );
}
