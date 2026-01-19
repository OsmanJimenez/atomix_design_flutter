import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Playground', path: '[Atoms]/Dot', type: AtomixDot)
Widget dotPlayground(BuildContext context) {
  final size = context.knobs.double.slider(
    label: 'Dot > Size',
    min: 4,
    max: 24,
    initialValue: 12,
  );

  final isPulsing = context.knobs.boolean(
    label: 'Dot > Is Pulsing',
    initialValue: true,
  );

  final color = context.knobs.object.dropdown<Color>(
    label: 'Dot > Color',
    options: [
      AtomixColors.success,
      AtomixColors.error,
      AtomixColors.warning,
      AtomixColors.primary,
    ],
  );

  final code =
      '''AtomixDot(
  size: $size,
  color: ${color == AtomixColors.success ? 'AtomixColors.success' : 'CustomColor'},
  isPulsing: $isPulsing,
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixDot(size: size, color: color, isPulsing: isPulsing),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Pulsing Status',
  path: '[Atoms]/Dot',
  type: AtomixDot,
)
Widget dotPulsing(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixDot(size: 16, color: AtomixColors.success, isPulsing: true),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixDot(
  size: 16,
  color: AtomixColors.success,
  isPulsing: true,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Static Indicators',
  path: '[Atoms]/Dot',
  type: AtomixDot,
)
Widget dotStatic(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          spacing: 16,
          children: [
            AtomixDot(color: AtomixColors.error),
            AtomixDot(color: AtomixColors.warning),
            AtomixDot(color: AtomixColors.textDisabled),
          ],
        ),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixDot(color: AtomixColors.error)'''),
      ],
    ),
  );
}
