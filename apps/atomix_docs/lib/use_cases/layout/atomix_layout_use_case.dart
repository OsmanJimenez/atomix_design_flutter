import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Responsive Grid',
  path: '[Layout]/Grid',
  type: AtomixGrid,
)
Widget atomixGridPlayground(BuildContext context) {
  final span1 = context.knobs.double
      .slider(
        label: 'Col 1 Span',
        initialValue: 6,
        min: 1,
        max: 12,
        divisions: 11,
      )
      .toInt();

  final span2 = context.knobs.double
      .slider(
        label: 'Col 2 Span',
        initialValue: 6,
        min: 1,
        max: 12,
        divisions: 11,
      )
      .toInt();

  final gutter = context.knobs.object.dropdown<double>(
    label: 'Grid > Gutter (Spacing)',
    options: [
      AtomixSpacing.xs,
      AtomixSpacing.sm,
      AtomixSpacing.md,
      AtomixSpacing.lg,
      AtomixSpacing.xl,
    ],
    initialOption: AtomixSpacing.md,
  );

  final code =
      '''AtomixGrid(
  gutter: $gutter,
  children: [
    AtomixCol(
      span: $span1,
      child: Container(color: Colors.blue[100], height: 50),
    ),
    AtomixCol(
      span: $span2,
      child: Container(color: Colors.green[100], height: 50),
    ),
  ],
)''';

  return Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AtomixGrid(
          gutter: gutter,
          children: [
            AtomixCol(
              span: span1,
              child: Container(
                color: Colors.blue.withValues(alpha: 0.2),
                height: 100,
                child: Center(child: Text('Span $span1')),
              ),
            ),
            AtomixCol(
              span: span2,
              child: Container(
                color: Colors.green.withValues(alpha: 0.2),
                height: 100,
                child: Center(child: Text('Span $span2')),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Responsive Box',
  path: '[Layout]/Box',
  type: AtomixBox,
)
Widget atomixBoxPlayground(BuildContext context) {
  final padding = context.knobs.object.dropdown<double>(
    label: 'Box > Padding',
    options: [0, AtomixSpacing.sm, AtomixSpacing.md, AtomixSpacing.lg],
    initialOption: AtomixSpacing.md,
  );

  final elevation = context.knobs.object.dropdown<double>(
    label: 'Box > Elevation',
    options: [0, AtomixElevation.sm, AtomixElevation.md, AtomixElevation.lg],
    initialOption: 0,
  );

  final radius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Box > Radius',
    options: [
      AtomixRadius.xsBorderRadius,
      AtomixRadius.smBorderRadius,
      AtomixRadius.mdBorderRadius,
      AtomixRadius.lgBorderRadius,
    ],
    initialOption: AtomixRadius.mdBorderRadius,
  );

  final code =
      '''AtomixBox(
  padding: EdgeInsets.all($padding),
  elevation: $elevation,
  borderRadius: ...,
  backgroundColor: AtomixColors.surface,
  child: Text('Hello Box'),
)''';

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixBox(
            padding: EdgeInsets.all(padding),
            elevation: elevation,
            borderRadius: radius,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: const Text('I am an AtomixBox. Use Knobs to change me!'),
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}
