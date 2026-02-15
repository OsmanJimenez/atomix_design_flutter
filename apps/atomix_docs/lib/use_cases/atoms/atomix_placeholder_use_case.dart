import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Placeholder',
  type: AtomixPlaceholder,
)
Widget atomixPlaceholderPlayground(BuildContext context) {
  final width = context.knobs.double.slider(
    label: 'Width',
    initialValue: 150,
    min: 50,
    max: 300,
  );
  final height = context.knobs.double.slider(
    label: 'Height',
    initialValue: 100,
    min: 50,
    max: 300,
  );

  final code =
      '''AtomixPlaceholder(
  width: $width,
  height: $height,
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixPlaceholder(width: width, height: height),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Profile Placeholder',
  path: '[Atoms]/Placeholder',
  type: AtomixPlaceholder,
)
Widget atomixPlaceholderProfile(BuildContext context) {
  return Center(
    child: AtomixPlaceholder(
      width: 80,
      height: 80,
      borderRadius: BorderRadius.all(AtomixTheme.of(context).radius.full),
      icon: Icons.person,
    ),
  );
}
