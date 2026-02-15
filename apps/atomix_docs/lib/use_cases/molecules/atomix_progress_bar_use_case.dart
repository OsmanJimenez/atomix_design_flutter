import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/ProgressBar',
  type: AtomixProgressBar,
)
Widget atomixProgressBarPlayground(BuildContext context) {
  final value = context.knobs.double.slider(
    label: 'Progress',
    initialValue: 0.65,
    min: 0,
    max: 1,
  );

  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Upload Progress',
  );

  final showPercentage = context.knobs.boolean(
    label: 'Show Percentage',
    initialValue: true,
  );

  final height = context.knobs.double.slider(
    label: 'Height',
    initialValue: 8,
    min: 4,
    max: 20,
  );

  final code =
      '''AtomixProgressBar(
  value: ${value.toStringAsFixed(2)},
  label: '$label',
  showPercentage: $showPercentage,
  height: $height,
)''';

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixProgressBar(
            value: value,
            label: label.isNotEmpty ? label : null,
            showPercentage: showPercentage,
            height: height,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Simple Progress',
  path: '[Molecules]/ProgressBar',
  type: AtomixProgressBar,
)
Widget atomixProgressBarSimple(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const AtomixProgressBar(value: 0.75),
          const SizedBox(height: 24),
          const CodeSnippet(code: 'AtomixProgressBar(value: 0.75)'),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Label',
  path: '[Molecules]/ProgressBar',
  type: AtomixProgressBar,
)
Widget atomixProgressBarWithLabel(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const AtomixProgressBar(
            value: 0.45,
            label: 'Downloading...',
            showPercentage: true,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixProgressBar(
  value: 0.45,
  label: 'Downloading...',
  showPercentage: true,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Thick Bar',
  path: '[Molecules]/ProgressBar',
  type: AtomixProgressBar,
)
Widget atomixProgressBarThick(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const AtomixProgressBar(
            value: 0.85,
            height: 16,
            showPercentage: true,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixProgressBar(
  value: 0.85,
  height: 16,
  showPercentage: true,
)''',
          ),
        ],
      ),
    ),
  );
}
