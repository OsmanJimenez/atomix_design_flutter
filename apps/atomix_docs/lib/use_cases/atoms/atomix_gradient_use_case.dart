import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Gradient',
  type: AtomixGradient,
)
Widget atomixGradientPlayground(BuildContext context) {
  final height = context.knobs.double.slider(
    label: 'Height',
    initialValue: 100,
    min: 50,
    max: 200,
  );

  final theme = AtomixTheme.of(context);

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixGradient(
  colors: [theme.colors.primary, theme.colors.secondary],
  height: $height,
  borderRadius: BorderRadius.all(theme.radius.md),
)''';

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AtomixGradient(
            colors: [theme.colors.primary, theme.colors.secondary],
            height: height,
            borderRadius: BorderRadius.all(theme.radius.md),
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Standard Variants',
  path: '[Atoms]/Gradient',
  type: AtomixGradient,
)
Widget atomixGradientVariants(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AtomixGradient(
                colors: const [Colors.blue, Colors.purple],
                width: 80,
                height: 80,
                borderRadius: BorderRadius.all(
                  AtomixTheme.of(context).radius.full,
                ),
              ),
              const SizedBox(width: 16),
              AtomixGradient(
                colors: const [Colors.orange, Colors.red],
                width: 80,
                height: 80,
                borderRadius: BorderRadius.all(
                  AtomixTheme.of(context).radius.lg,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''final theme = AtomixTheme.of(context);
Row(
  children: [
    AtomixGradient(
      colors: [Colors.blue, Colors.purple],
      width: 80, height: 80,
      borderRadius: BorderRadius.all(theme.radius.full),
    ),
    AtomixGradient(
      colors: [Colors.orange, Colors.red],
      width: 80, height: 80,
      borderRadius: BorderRadius.all(theme.radius.lg),
    ),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}
