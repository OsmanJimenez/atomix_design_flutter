import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixIcon)
Widget atomixIconDefault(BuildContext context) {
  return const Center(child: AtomixIcon(Icons.home));
}

@widgetbook.UseCase(name: 'Colored', type: AtomixIcon)
Widget atomixIconColored(BuildContext context) {
  return Center(
    child: AtomixIcon(
      Icons.favorite,
      color: Theme.of(context).colorScheme.primary,
    ),
  );
}

@widgetbook.UseCase(name: 'Large Size', type: AtomixIcon)
Widget atomixIconLarge(BuildContext context) {
  return const Center(child: AtomixIcon(Icons.star, size: 48));
}

@widgetbook.UseCase(name: 'Small Size', type: AtomixIcon)
Widget atomixIconSmall(BuildContext context) {
  return const Center(child: AtomixIcon(Icons.check_circle, size: 16));
}
