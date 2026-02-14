import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Stroke',
  type: AtomixStroke,
)
Widget atomixStrokePlayground(BuildContext context) {
  final thickness = context.knobs.double.slider(
    label: 'Thickness',
    initialValue: 1,
    min: 0.5,
    max: 8,
  );

  final showChild = context.knobs.boolean(
    label: 'Show Child',
    initialValue: false,
  );

  final code =
      '''AtomixStroke(
  width: 200,
  height: 50,
  thickness: $thickness,
  borderRadius: AtomixRadius.smBorderRadius,
  ${showChild ? "child: Center(child: Text('Content'))," : ""}
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixStroke(
          width: 200,
          height: 100,
          thickness: thickness,
          borderRadius: AtomixRadius.smBorderRadius,
          child: showChild ? const Center(child: Text('Content')) : null,
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}
