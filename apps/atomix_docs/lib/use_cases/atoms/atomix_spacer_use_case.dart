import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Spacer',
  type: AtomixSpacer,
)
Widget atomixSpacerPlayground(BuildContext context) {
  final theme = AtomixTheme.of(context);

  final spacing = context.knobs.object.dropdown<double>(
    label: 'Spacer > Foundation Spacing',
    options: [
      theme.spacing.xxs,
      theme.spacing.xs,
      theme.spacing.sm,
      theme.spacing.md,
      theme.spacing.lg,
      theme.spacing.xl,
      theme.spacing.xxl,
      theme.spacing.xxxl,
    ],
    labelBuilder: (value) {
      if (value == theme.spacing.xxs) return 'XXS';
      if (value == theme.spacing.xs) return 'XS';
      if (value == theme.spacing.sm) return 'SM';
      if (value == theme.spacing.md) return 'MD';
      if (value == theme.spacing.lg) return 'LG';
      if (value == theme.spacing.xl) return 'XL';
      if (value == theme.spacing.xxl) return 'XXL';
      if (value == theme.spacing.xxxl) return 'XXXL';
      return 'Custom';
    },
    initialOption: theme.spacing.md,
  );

  final isVertical = context.knobs.boolean(
    label: 'Spacer > Is Vertical',
    initialValue: true,
  );

  // Helper strings
  String spacingName(double val) {
    if (val == theme.spacing.xxs) return 'theme.spacing.xxs';
    if (val == theme.spacing.xs) return 'theme.spacing.xs';
    if (val == theme.spacing.sm) return 'theme.spacing.sm';
    if (val == theme.spacing.md) return 'theme.spacing.md';
    if (val == theme.spacing.lg) return 'theme.spacing.lg';
    if (val == theme.spacing.xl) return 'theme.spacing.xl';
    if (val == theme.spacing.xxl) return 'theme.spacing.xxl';
    if (val == theme.spacing.xxxl) return 'theme.spacing.xxxl';
    return 'md';
  }

  final code = isVertical
      ? 'AtomixSpacer(height: ${spacingName(spacing)})'
      : 'Row(\n  children: [\n    Text("Left"),\n    AtomixSpacer(width: ${spacingName(spacing)}),\n    Text("Right"),\n  ],\n)';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.grey.withValues(alpha: 0.1),
            child: isVertical
                ? Column(
                    children: [
                      const Text('Top Widget'),
                      AtomixSpacer(height: spacing),
                      const Text('Bottom Widget'),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Left'),
                      AtomixSpacer(width: spacing),
                      const Text('Right'),
                    ],
                  ),
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Vertical Scale',
  path: '[Atoms]/Spacer',
  type: AtomixSpacer,
)
Widget atomixSpacerVerticalScale(BuildContext context) {
  return Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('XXS'),
          AtomixSpacer.xxs(),
          Text('XS'),
          AtomixSpacer.xs(),
          Text('SM'),
          AtomixSpacer.sm(),
          Text('MD'),
          AtomixSpacer.md(),
          Text('LG'),
          AtomixSpacer.lg(),
          Text('XL'),
          AtomixSpacer.xl(),
          Text('XXL'),
          AtomixSpacer.xxl(),
          Text('XXXL'),
          AtomixSpacer.xxxl(),
          Text('End'),
          SizedBox(height: 24),
          CodeSnippet(code: 'AtomixSpacer.md() // and others...'),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Horizontal Scale',
  path: '[Atoms]/Spacer',
  type: AtomixSpacer,
)
Widget atomixSpacerHorizontalScale(BuildContext context) {
  final theme = AtomixTheme.of(context);
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('A'),
              AtomixSpacer.horizontal(theme.spacing.xs),
              const Text('B'),
              AtomixSpacer.horizontal(theme.spacing.md),
              const Text('C'),
              AtomixSpacer.horizontal(theme.spacing.xl),
              const Text('D'),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''final theme = AtomixTheme.of(context);
AtomixSpacer.horizontal(theme.spacing.md)''',
          ),
        ],
      ),
    ),
  );
}
