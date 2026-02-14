import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Handle',
  type: AtomixHandle,
)
Widget atomixHandlePlayground(BuildContext context) {
  final width = context.knobs.double.slider(
    label: 'Width',
    initialValue: 32,
    min: 16,
    max: 64,
  );

  final code =
      '''AtomixHandle(
  width: $width,
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixHandle(width: width),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Thick', path: '[Atoms]/Handle', type: AtomixHandle)
Widget atomixHandleThick(BuildContext context) {
  return const Center(child: AtomixHandle(width: 48, height: 6));
}

@widgetbook.UseCase(name: 'Thin', path: '[Atoms]/Handle', type: AtomixHandle)
Widget atomixHandleThin(BuildContext context) {
  return const Center(child: AtomixHandle(width: 24, height: 2));
}
