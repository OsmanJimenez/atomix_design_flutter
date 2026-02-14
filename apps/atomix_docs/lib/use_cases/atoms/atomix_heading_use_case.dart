import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Heading',
  type: AtomixHeading,
)
Widget atomixHeadingPlayground(BuildContext context) {
  final text = context.knobs.string(
    label: 'Text',
    initialValue: 'This is a Heading',
  );

  final code =
      '''AtomixHeading(
  '$text',
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixHeading(text),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Colored Heading',
  path: '[Atoms]/Heading',
  type: AtomixHeading,
)
Widget atomixHeadingColored(BuildContext context) {
  return const Center(
    child: AtomixHeading('Primary Heading', color: AtomixColors.primary),
  );
}
