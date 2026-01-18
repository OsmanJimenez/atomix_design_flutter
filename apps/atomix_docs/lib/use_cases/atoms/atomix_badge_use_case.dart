import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(name: 'Neutral', type: AtomixBadge)
Widget atomixBadgeNeutral(BuildContext context) {
  return const Center(
    child: AtomixBadge(label: 'Neutral', variant: AtomixBadgeVariant.neutral),
  );
}

@widgetbook.UseCase(name: 'Success', type: AtomixBadge)
Widget atomixBadgeSuccess(BuildContext context) {
  return const Center(
    child: AtomixBadge(label: 'Success', variant: AtomixBadgeVariant.success),
  );
}

@widgetbook.UseCase(name: 'Warning', type: AtomixBadge)
Widget atomixBadgeWarning(BuildContext context) {
  return const Center(
    child: AtomixBadge(label: 'Warning', variant: AtomixBadgeVariant.warning),
  );
}

@widgetbook.UseCase(name: 'Error', type: AtomixBadge)
Widget atomixBadgeError(BuildContext context) {
  return const Center(
    child: AtomixBadge(label: 'Error', variant: AtomixBadgeVariant.error),
  );
}

@widgetbook.UseCase(name: 'Info', type: AtomixBadge)
Widget atomixBadgeInfo(BuildContext context) {
  return const Center(
    child: AtomixBadge(label: 'Info', variant: AtomixBadgeVariant.info),
  );
}

@widgetbook.UseCase(name: 'With Icon', type: AtomixBadge)
Widget atomixBadgeWithIcon(BuildContext context) {
  return const Center(
    child: AtomixBadge(
      label: 'New',
      variant: AtomixBadgeVariant.success,
      icon: Icons.star,
    ),
  );
}
