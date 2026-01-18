import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(name: 'Primary', type: AtomixButton)
Widget atomixButtonPrimary(BuildContext context) {
  return Center(
    child: AtomixButton(
      label: 'Primary Button',
      onPressed: () {},
      variant: AtomixButtonVariant.primary,
    ),
  );
}

@widgetbook.UseCase(name: 'Secondary', type: AtomixButton)
Widget atomixButtonSecondary(BuildContext context) {
  return Center(
    child: AtomixButton(
      label: 'Secondary Button',
      onPressed: () {},
      variant: AtomixButtonVariant.secondary,
    ),
  );
}

@widgetbook.UseCase(name: 'Tertiary', type: AtomixButton)
Widget atomixButtonTertiary(BuildContext context) {
  return Center(
    child: AtomixButton(
      label: 'Tertiary Button',
      onPressed: () {},
      variant: AtomixButtonVariant.tertiary,
    ),
  );
}

@widgetbook.UseCase(name: 'Small Size', type: AtomixButton)
Widget atomixButtonSmall(BuildContext context) {
  return Center(
    child: AtomixButton(
      label: 'Small Button',
      onPressed: () {},
      size: AtomixButtonSize.sm,
    ),
  );
}

@widgetbook.UseCase(name: 'Large Size', type: AtomixButton)
Widget atomixButtonLarge(BuildContext context) {
  return Center(
    child: AtomixButton(
      label: 'Large Button',
      onPressed: () {},
      size: AtomixButtonSize.lg,
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: AtomixButton)
Widget atomixButtonDisabled(BuildContext context) {
  return const Center(
    child: AtomixButton(label: 'Disabled Button', onPressed: null),
  );
}

@widgetbook.UseCase(name: 'Loading', type: AtomixButton)
Widget atomixButtonLoading(BuildContext context) {
  return Center(
    child: AtomixButton(
      label: 'Loading Button',
      onPressed: () {},
      isLoading: true,
    ),
  );
}

@widgetbook.UseCase(name: 'With Icon', type: AtomixButton)
Widget atomixButtonWithIcon(BuildContext context) {
  return Center(
    child: AtomixButton(label: 'With Icon', onPressed: () {}, icon: Icons.add),
  );
}

@widgetbook.UseCase(name: 'Full Width', type: AtomixButton)
Widget atomixButtonFullWidth(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: AtomixButton(
      label: 'Full Width Button',
      onPressed: () {},
      fullWidth: true,
    ),
  );
}
