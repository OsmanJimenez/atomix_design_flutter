import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
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

  final useColor = context.knobs.boolean(
    label: 'Custom Color',
    initialValue: false,
  );

  final theme = AtomixTheme.of(context);
  final color = useColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Color',
          options: [
            theme.colors.primary,
            theme.colors.secondary,
            theme.colors.success,
            theme.colors.error,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.secondary) return 'Secondary';
            if (c == theme.colors.success) return 'Success';
            if (c == theme.colors.error) return 'Error';
            return 'Custom';
          },
        )
      : null;

  String colorName(Color? c) {
    if (c == theme.colors.primary) return 'theme.colors.primary';
    if (c == theme.colors.secondary) return 'theme.colors.secondary';
    if (c == theme.colors.success) return 'theme.colors.success';
    if (c == theme.colors.error) return 'theme.colors.error';
    return 'null';
  }

  final colorStr = useColor ? '\n  color: ${colorName(color)},' : '';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixHeading(
  '$text',$colorStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixHeading(text, color: color),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Default',
  path: '[Atoms]/Heading',
  type: AtomixHeading,
)
Widget atomixHeadingDefault(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixHeading('Default Heading'),
          SizedBox(height: 24),
          CodeSnippet(code: "AtomixHeading('Default Heading')"),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Colored',
  path: '[Atoms]/Heading',
  type: AtomixHeading,
)
Widget atomixHeadingColored(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixHeading(
            'Primary Heading',
            color: AtomixTheme.of(context).colors.primary,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''final theme = AtomixTheme.of(context);
AtomixHeading(
  'Primary Heading',
  color: theme.colors.primary,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Long Text',
  path: '[Atoms]/Heading',
  type: AtomixHeading,
)
Widget atomixHeadingLongText(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixHeading(
            'This is a very long heading that demonstrates text wrapping behavior',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixHeading(
  'This is a very long heading that demonstrates text wrapping behavior',
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)''',
          ),
        ],
      ),
    ),
  );
}
