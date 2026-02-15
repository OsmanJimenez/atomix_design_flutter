import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Pulse',
  type: AtomixPulse,
)
Widget atomixPulsePlayground(BuildContext context) {
  final duration = context.knobs.double.slider(
    label: 'Duration (ms)',
    initialValue: 1000,
    min: 200,
    max: 3000,
  );

  final code =
      '''AtomixPulse(
  duration: Duration(milliseconds: ${duration.toInt()}),
  child: AtomixBadge(label: 'Pulsing'),
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixPulse(
          duration: Duration(milliseconds: duration.toInt()),
          child: const AtomixBadge(label: 'Pulsing'),
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Warning Pulse',
  path: '[Atoms]/Pulse',
  type: AtomixPulse,
)
Widget atomixPulseWarning(BuildContext context) {
  return Center(
    child: AtomixPulse(
      duration: const Duration(milliseconds: 500),
      child: AtomixDot(size: 16, color: AtomixTheme.of(context).colors.error),
    ),
  );
}
