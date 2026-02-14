import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Pulse',
  type: AtomixPulse,
)
Widget atomixPulsePlayground(BuildContext context) {
  final code = '''AtomixPulse(
  child: AtomixBadge(label: 'Pulsing'),
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AtomixPulse(child: AtomixBadge(label: 'Pulsing')),
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
  return const Center(
    child: AtomixPulse(
      duration: Duration(milliseconds: 500),
      child: AtomixDot(size: 16, color: AtomixColors.error),
    ),
  );
}
