import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixDivider)
Widget atomixDividerDefault(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Text('Above divider'), AtomixDivider(), Text('Below divider')],
  );
}

@widgetbook.UseCase(name: 'Thick', type: AtomixDivider)
Widget atomixDividerThick(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Above divider'),
      AtomixDivider(thickness: 3),
      Text('Below divider'),
    ],
  );
}

@widgetbook.UseCase(name: 'With Indent', type: AtomixDivider)
Widget atomixDividerIndent(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Above divider'),
      AtomixDivider(indent: 20, endIndent: 20),
      Text('Below divider'),
    ],
  );
}
