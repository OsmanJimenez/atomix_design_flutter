import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Playground', path: '[Atoms]/Link', type: AtomixLink)
Widget linkPlayground(BuildContext context) {
  final text = context.knobs.string(
    label: 'Link > Text',
    initialValue: 'Click here for details',
  );

  final underlineOnHover = context.knobs.boolean(
    label: 'Link > Underline on Hover',
    initialValue: false,
  );

  final code =
      '''AtomixLink(
  text: '$text',
  underlineOnHover: $underlineOnHover,
  onTap: () {},
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixLink(
            text: text,
            underlineOnHover: underlineOnHover,
            onTap: () {},
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Classic Link',
  path: '[Atoms]/Link',
  type: AtomixLink,
)
Widget linkClassic(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixLink(text: 'Return to home', onTap: null),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixLink(
  text: 'Return to home',
  onTap: () {},
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', path: '[Atoms]/Link', type: AtomixLink)
Widget linkDisabled(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixLink(text: 'No access available', onTap: null),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixLink(
  text: 'No access',
  onTap: null,
)''',
        ),
      ],
    ),
  );
}
