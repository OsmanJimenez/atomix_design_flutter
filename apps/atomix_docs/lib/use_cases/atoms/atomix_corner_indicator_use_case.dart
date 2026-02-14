import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Corner Indicator',
  type: AtomixCornerIndicator,
)
Widget atomixCornerIndicatorPlayground(BuildContext context) {
  final alignment = context.knobs.object.dropdown<Alignment>(
    label: 'Alignment',
    options: [
      Alignment.topRight,
      Alignment.topLeft,
      Alignment.bottomRight,
      Alignment.bottomLeft,
    ],
  );

  final code =
      '''AtomixCornerIndicator(
  alignment: ${alignment.toString()},
  indicator: AtomixDot(size: 12, color: AtomixColors.error),
  child: AtomixAvatar(initials: 'JD'),
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixCornerIndicator(
          alignment: alignment,
          indicator: const AtomixDot(size: 12, color: AtomixColors.error),
          child: const AtomixAvatar(initials: 'JD'),
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Badge Indicator',
  path: '[Atoms]/Corner Indicator',
  type: AtomixCornerIndicator,
)
Widget atomixCornerIndicatorBadge(BuildContext context) {
  return const Center(
    child: AtomixCornerIndicator(
      alignment: Alignment.topRight,
      offset: Offset(8, -8),
      indicator: AtomixBadge(label: '99+', variant: AtomixBadgeVariant.error),
      child: Icon(Icons.notifications, size: 48),
    ),
  );
}
