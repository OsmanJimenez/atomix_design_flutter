import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Gradient',
  type: AtomixGradient,
)
Widget atomixGradientPlayground(BuildContext context) {
  final height = context.knobs.double.slider(
    label: 'Height',
    initialValue: 100,
    min: 50,
    max: 200,
  );

  final code =
      '''AtomixGradient(
  colors: [AtomixColors.primary, AtomixColors.secondary],
  height: $height,
  borderRadius: AtomixRadius.mdBorderRadius,
)''';

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AtomixGradient(
            colors: const [AtomixColors.primary, AtomixColors.secondary],
            height: height,
            borderRadius: AtomixRadius.mdBorderRadius,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Standard Variants',
  path: '[Atoms]/Gradient',
  type: AtomixGradient,
)
Widget atomixGradientVariants(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AtomixGradient(
          colors: [Colors.blue, Colors.purple],
          width: 80,
          height: 80,
          borderRadius: AtomixRadius.fullBorderRadius,
        ),
        const SizedBox(width: 16),
        AtomixGradient(
          colors: [Colors.orange, Colors.red],
          width: 80,
          height: 80,
          borderRadius: AtomixRadius.lgBorderRadius,
        ),
      ],
    ),
  );
}
