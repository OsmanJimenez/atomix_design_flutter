import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Playground', path: '[Atoms]/Mask', type: AtomixMask)
Widget atomixMaskPlayground(BuildContext context) {
  final clipBehavior = context.knobs.object.dropdown<Clip>(
    label: 'Clip Behavior',
    options: Clip.values,
  );

  final code =
      '''AtomixMask(
  clipBehavior: $clipBehavior,
  child: Image.network('...'),
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixMask(
          clipBehavior: clipBehavior,
          child: const SizedBox(width: 200, height: 200, child: Placeholder()),
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

@widgetbook.UseCase(
  name: 'Circular Mask',
  path: '[Atoms]/Mask',
  type: AtomixMask,
)
Widget atomixMaskCircular(BuildContext context) {
  return Center(
    child: AtomixMask(
      clipper: CircleClipper(),
      child: Image.network(
        'https://placeholder.com/200',
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    ),
  );
}
