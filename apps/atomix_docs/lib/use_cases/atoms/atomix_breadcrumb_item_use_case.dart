import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/BreadcrumbItem',
  type: AtomixBreadcrumbItem,
)
Widget breadcrumbItemPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Breadcrumb > Label',
    initialValue: 'Settings',
  );

  final isLast = context.knobs.boolean(
    label: 'Breadcrumb > Is Last',
    initialValue: false,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Color',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            AtomixColors.primary,
            AtomixColors.secondary,
            AtomixColors.success,
            AtomixColors.info,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  String colorName(Color? c) {
    if (c == AtomixColors.primary) return 'AtomixColors.primary';
    if (c == AtomixColors.secondary) return 'AtomixColors.secondary';
    if (c == AtomixColors.success) return 'AtomixColors.success';
    if (c == AtomixColors.info) return 'AtomixColors.info';
    return 'null';
  }

  final colorStr = foundationColor != null
      ? '\n  color: ${colorName(foundationColor)},'
      : '';

  final code =
      '''AtomixBreadcrumbItem(
  label: '$label',
  isLast: $isLast,$colorStr
  onTap: () {},
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixBreadcrumbItem(
            label: label,
            isLast: isLast,
            color: foundationColor,
            onTap: () {},
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Sequence',
  path: '[Atoms]/BreadcrumbItem',
  type: AtomixBreadcrumbItem,
)
Widget breadcrumbSequence(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AtomixBreadcrumbItem(label: 'Home'),
            AtomixBreadcrumbItem(label: 'Products'),
            AtomixBreadcrumbItem(label: 'Detail', isLast: true),
          ],
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''Row(
  children: [
    AtomixBreadcrumbItem(label: 'Home'),
    AtomixBreadcrumbItem(label: 'Products'),
    AtomixBreadcrumbItem(label: 'Detail', isLast: true),
  ],
)''',
        ),
      ],
    ),
  );
}
