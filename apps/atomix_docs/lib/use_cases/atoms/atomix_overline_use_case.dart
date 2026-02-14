import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Overline',
  type: AtomixOverline,
)
Widget atomixOverlinePlayground(BuildContext context) {
  final text = context.knobs.string(
    label: 'Text',
    initialValue: 'Overline Text',
  );
  final uppercase = context.knobs.boolean(
    label: 'Uppercase',
    initialValue: true,
  );

  final code =
      '''AtomixOverline(
  '$text',
  uppercase: $uppercase,
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixOverline(text, uppercase: uppercase),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Subtitle Style',
  path: '[Atoms]/Overline',
  type: AtomixOverline,
)
Widget atomixOverlineSubtitle(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixOverline('New Collection'),
        SizedBox(height: 4),
        AtomixHeading('Premium Quality'),
      ],
    ),
  );
}
