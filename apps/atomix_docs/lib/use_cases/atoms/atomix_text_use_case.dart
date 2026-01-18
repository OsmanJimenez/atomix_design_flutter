import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixText)
Widget atomixTextDefault(BuildContext context) {
  return const Center(child: AtomixText('Hello, Atomix!'));
}

@widgetbook.UseCase(name: 'Display Large', type: AtomixText)
Widget atomixTextDisplayLarge(BuildContext context) {
  return Center(
    child: AtomixText(
      'Display Large',
      style: Theme.of(context).textTheme.displayLarge,
    ),
  );
}

@widgetbook.UseCase(name: 'Headline Medium', type: AtomixText)
Widget atomixTextHeadlineMedium(BuildContext context) {
  return Center(
    child: AtomixText(
      'Headline Medium',
      style: Theme.of(context).textTheme.headlineMedium,
    ),
  );
}

@widgetbook.UseCase(name: 'Body Large', type: AtomixText)
Widget atomixTextBodyLarge(BuildContext context) {
  return Center(
    child: AtomixText(
      'Body Large - This is the default body text style',
      style: Theme.of(context).textTheme.bodyLarge,
    ),
  );
}

@widgetbook.UseCase(name: 'Label Small', type: AtomixText)
Widget atomixTextLabelSmall(BuildContext context) {
  return Center(
    child: AtomixText(
      'Label Small',
      style: Theme.of(context).textTheme.labelSmall,
    ),
  );
}
