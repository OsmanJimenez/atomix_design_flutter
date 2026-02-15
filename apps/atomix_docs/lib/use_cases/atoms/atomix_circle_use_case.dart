import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Circle',
  type: AtomixCircle,
)
Widget atomixCirclePlayground(BuildContext context) {
  final radius = context.knobs.double.slider(
    label: 'Radius',
    initialValue: 24,
    min: 8,
    max: 64,
  );
  final showContent = context.knobs.boolean(
    label: 'Show Content',
    initialValue: true,
  );

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixCircle(
  radius: $radius,
  color: theme.colors.primary,
  child: ${showContent ? "Icon(Icons.person, color: Colors.white)" : "null"},
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixCircle(
          radius: radius,
          color: AtomixTheme.of(context).colors.primary,
          child: showContent
              ? const Icon(Icons.person, color: Colors.white)
              : null,
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Background Image',
  path: '[Atoms]/Circle',
  type: AtomixCircle,
)
Widget atomixCircleWithImage(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixCircle(
          radius: 40,
          backgroundImage: DecorationImage(
            image: NetworkImage('https://placeholder.com/150'),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixCircle(
  radius: 40,
  backgroundImage: DecorationImage(
    image: NetworkImage('https://placeholder.com/150'),
    fit: BoxFit.cover,
  ),
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Border',
  path: '[Atoms]/Circle',
  type: AtomixCircle,
)
Widget atomixCircleWithBorder(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixCircle(
          radius: 40,
          color: AtomixTheme.of(context).colors.surface,
          border: Border.all(
            color: AtomixTheme.of(context).colors.primary,
            width: 2,
          ),
          child: Icon(
            Icons.star,
            color: AtomixTheme.of(context).colors.primary,
          ),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
AtomixCircle(
  radius: 40,
  color: theme.colors.surface,
  border: Border.all(color: theme.colors.primary, width: 2),
  child: Icon(Icons.star, color: theme.colors.primary),
)''',
        ),
      ],
    ),
  );
}
