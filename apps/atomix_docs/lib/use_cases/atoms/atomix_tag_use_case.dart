import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Playground', path: '[Atoms]/Tag', type: AtomixTag)
Widget tagPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Tag > Label',
    initialValue: 'Beta',
  );

  final showIcon = context.knobs.boolean(
    label: 'Tag > Show Icon',
    initialValue: true,
  );

  final color = context.knobs.object.dropdown<Color>(
    label: 'Tag > Color',
    options: [
      AtomixColors.primary,
      AtomixColors.success,
      AtomixColors.error,
      AtomixColors.warning,
      AtomixColors.info,
    ],
    labelBuilder: (c) {
      if (c == AtomixColors.primary) return 'Primary';
      if (c == AtomixColors.success) return 'Success';
      if (c == AtomixColors.error) return 'Error';
      if (c == AtomixColors.warning) return 'Warning';
      return 'Info';
    },
  );

  final code =
      '''AtomixTag(
  label: '$label',
  icon: ${showIcon ? 'Icons.label' : 'null'},
  color: ${color == AtomixColors.primary ? 'AtomixColors.primary' : 'CustomColor'},
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixTag(
            label: label,
            icon: showIcon ? Icons.label : null,
            color: color,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Success', path: '[Atoms]/Tag', type: AtomixTag)
Widget tagSuccess(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixTag(
          label: 'Success',
          color: AtomixColors.success,
          icon: Icons.check_circle_outline,
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixTag(
  label: 'Success',
  color: AtomixColors.success,
  icon: Icons.check_circle_outline,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Status variants',
  path: '[Atoms]/Tag',
  type: AtomixTag,
)
Widget tagVariants(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          spacing: 8,
          children: [
            AtomixTag(label: 'New', color: AtomixColors.primary),
            AtomixTag(label: 'Sale', color: AtomixColors.error),
            AtomixTag(label: 'Stock', color: AtomixColors.info),
          ],
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixTag(label: 'New', color: AtomixColors.primary)''',
        ),
      ],
    ),
  );
}
