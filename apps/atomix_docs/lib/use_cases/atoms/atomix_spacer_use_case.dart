import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(name: 'All Sizes', type: AtomixSpacer)
Widget atomixSpacerAllSizes(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('XXS (4px)'),
        AtomixSpacer.xxs(),
        Text('XS (8px)'),
        AtomixSpacer.xs(),
        Text('SM (12px)'),
        AtomixSpacer.sm(),
        Text('MD (16px)'),
        AtomixSpacer.md(),
        Text('LG (20px)'),
        AtomixSpacer.lg(),
        Text('XL (24px)'),
        AtomixSpacer.xl(),
        Text('XXL (32px)'),
        AtomixSpacer.xxl(),
        Text('XXXL (40px)'),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Horizontal', type: AtomixSpacer)
Widget atomixSpacerHorizontal(BuildContext context) {
  return const Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Left'), AtomixSpacer.horizontal(32), Text('Right')],
    ),
  );
}
