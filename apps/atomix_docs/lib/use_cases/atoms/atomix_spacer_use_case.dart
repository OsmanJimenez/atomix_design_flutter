import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Playground', type: AtomixSpacer)
Widget atomixSpacerPlayground(BuildContext context) {
  final spacing = context.knobs.list<double>(
    label: 'Foundation Spacing',
    options: [
      AtomixSpacing.xxs,
      AtomixSpacing.xs,
      AtomixSpacing.sm,
      AtomixSpacing.md,
      AtomixSpacing.lg,
      AtomixSpacing.xl,
      AtomixSpacing.xxl,
      AtomixSpacing.xxxl,
    ],
    labelBuilder: (value) {
      if (value == AtomixSpacing.xxs) return 'XXS (4px)';
      if (value == AtomixSpacing.xs) return 'XS (8px)';
      if (value == AtomixSpacing.sm) return 'SM (12px)';
      if (value == AtomixSpacing.md) return 'MD (16px)';
      if (value == AtomixSpacing.lg) return 'LG (20px)';
      if (value == AtomixSpacing.xl) return 'XL (24px)';
      if (value == AtomixSpacing.xxl) return 'XXL (32px)';
      if (value == AtomixSpacing.xxxl) return 'XXXL (40px)';
      return 'Custom';
    },
    initialOption: AtomixSpacing.md,
  );

  final isVertical = context.knobs.boolean(
    label: 'Is Vertical',
    initialValue: true,
  );

  // Helper strings
  String spacingName(double val) {
    if (val == AtomixSpacing.xxs) return 'xxs';
    if (val == AtomixSpacing.xs) return 'xs';
    if (val == AtomixSpacing.sm) return 'sm';
    if (val == AtomixSpacing.md) return 'md';
    if (val == AtomixSpacing.lg) return 'lg';
    if (val == AtomixSpacing.xl) return 'xl';
    if (val == AtomixSpacing.xxl) return 'xxl';
    if (val == AtomixSpacing.xxxl) return 'xxxl';
    return 'md';
  }

  final code = isVertical
      ? 'AtomixSpacer.${spacingName(spacing)}()'
      : 'Row(\n  children: [\n    Text("Left"),\n    AtomixSpacer.horizontal(${spacingName(spacing)}),\n    Text("Right"),\n  ],\n)';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.grey.withOpacity(0.1),
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

@widgetbook.UseCase(name: 'Vertical Scale', type: AtomixSpacer)
Widget atomixSpacerVerticalScale(BuildContext context) {
  return const Center(
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

@widgetbook.UseCase(name: 'Horizontal Scale', type: AtomixSpacer)
Widget atomixSpacerHorizontalScale(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('A'),
              AtomixSpacer.horizontal(AtomixSpacing.xs),
              Text('B'),
              AtomixSpacer.horizontal(AtomixSpacing.md),
              Text('C'),
              AtomixSpacer.horizontal(AtomixSpacing.xl),
              Text('D'),
            ],
          ),
          SizedBox(height: 24),
          CodeSnippet(code: 'AtomixSpacer.horizontal(AtomixSpacing.md)'),
        ],
      ),
    ),
  );
}
