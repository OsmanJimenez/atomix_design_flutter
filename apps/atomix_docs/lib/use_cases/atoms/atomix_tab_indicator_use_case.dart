import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Tab Indicator',
  type: AtomixTabIndicator,
)
Widget tabIndicatorPlayground(BuildContext context) {
  final isActive = context.knobs.boolean(
    label: 'Tab Indicator > Is Active',
    initialValue: true,
  );

  final height = context.knobs.double.slider(
    label: 'Tab Indicator > Height',
    min: 1,
    max: 10,
    initialValue: 3,
  );

  final code =
      '''AtomixTabIndicator(
  isActive: $isActive,
  height: $height,
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          SizedBox(
            width: 100,
            child: Column(
              children: [
                const AtomixText('Tab Item'),
                const SizedBox(height: 8),
                AtomixTabIndicator(isActive: isActive, height: height),
              ],
            ),
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Tab Bar Style',
  path: '[Atoms]/Tab Indicator',
  type: AtomixTabIndicator,
)
Widget tabIndicatorBar(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                AtomixText(
                  'Active Tab',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                SizedBox(width: 80, child: AtomixTabIndicator(isActive: true)),
              ],
            ),
            SizedBox(width: 32),
            Column(
              children: [
                AtomixText('Inactive Tab'),
                SizedBox(height: 4),
                SizedBox(width: 80, child: AtomixTabIndicator(isActive: false)),
              ],
            ),
          ],
        ),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixTabIndicator(isActive: true)'''),
      ],
    ),
  );
}
