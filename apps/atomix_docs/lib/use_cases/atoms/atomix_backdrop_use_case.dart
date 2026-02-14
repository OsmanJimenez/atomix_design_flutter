import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Backdrop',
  type: AtomixBackdrop,
)
Widget atomixBackdropPlayground(BuildContext context) {
  final opacity = context.knobs.double.slider(
    label: 'Opacity',
    initialValue: 0.5,
    min: 0,
    max: 1,
  );

  final code =
      '''AtomixBackdrop(
  opacity: $opacity,
  onTap: () {},
)''';

  return Stack(
    children: [
      const Center(child: Text('Content behind backdrop')),
      AtomixBackdrop(
        opacity: opacity,
        onTap: () {},
        child: const Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('Modal Content'),
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 20,
        left: 20,
        right: 20,
        child: CodeSnippet(code: code),
      ),
    ],
  );
}

@widgetbook.UseCase(
  name: 'Light',
  path: '[Atoms]/Backdrop',
  type: AtomixBackdrop,
)
Widget atomixBackdropLight(BuildContext context) {
  return const AtomixBackdrop(opacity: 0.2, color: Colors.white);
}

@widgetbook.UseCase(
  name: 'Dark',
  path: '[Atoms]/Backdrop',
  type: AtomixBackdrop,
)
Widget atomixBackdropDark(BuildContext context) {
  return const AtomixBackdrop(opacity: 0.8, color: Colors.black);
}
