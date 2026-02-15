import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Playground', path: '[Atoms]/Fade', type: AtomixFade)
Widget atomixFadePlayground(BuildContext context) {
  final duration = context.knobs.double.slider(
    label: 'Duration (ms)',
    initialValue: 500,
    min: 100,
    max: 2000,
  );

  final code =
      '''AtomixFade(
  duration: Duration(milliseconds: ${duration.toInt()}),
  child: AtomixBadge(label: 'I faded in'),
)''';

  return Center(
    key: UniqueKey(), // Force re-render for animation
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixFade(
          duration: Duration(milliseconds: duration.toInt()),
          child: const AtomixBadge(label: 'I faded in'),
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Slow Fade', path: '[Atoms]/Fade', type: AtomixFade)
Widget atomixFadeSlow(BuildContext context) {
  return Center(
    key: UniqueKey(),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixFade(
          duration: Duration(seconds: 2),
          child: AtomixBadge(label: 'I am taking my time'),
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixFade(
  duration: Duration(seconds: 2),
  child: AtomixBadge(label: 'I am taking my time'),
)''',
        ),
      ],
    ),
  );
}
