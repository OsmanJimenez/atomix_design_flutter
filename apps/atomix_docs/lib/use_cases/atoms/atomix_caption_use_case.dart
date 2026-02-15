import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Caption',
  type: AtomixCaption,
)
Widget atomixCaptionPlayground(BuildContext context) {
  final text = context.knobs.string(
    label: 'Text',
    initialValue: 'This is a caption text.',
  );

  final code =
      '''AtomixCaption(
  '$text',
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixCaption(text),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Typography Variants',
  path: '[Atoms]/Caption',
  type: AtomixCaption,
)
Widget atomixCaptionVariants(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AtomixCaption('Standard Caption'),
          const SizedBox(height: 8),
          AtomixCaption(
            'Colored Caption',
            color: AtomixTheme.of(context).colors.primary,
          ),
          const SizedBox(height: 8),
          const AtomixCaption(
            'Long Caption that should wrap or overflow if the container is small enough.',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''final theme = AtomixTheme.of(context);
Column(
  children: [
    AtomixCaption('Standard Caption'),
    AtomixCaption('Colored Caption', color: theme.colors.primary),
    AtomixCaption('Long...', maxLines: 1, overflow: TextOverflow.ellipsis),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}
