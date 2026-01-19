import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Tooltip',
  type: AtomixTooltip,
)
Widget tooltipPlayground(BuildContext context) {
  final message = context.knobs.string(
    label: 'Tooltip > Message',
    initialValue: 'Settings information',
  );

  final code =
      '''AtomixTooltip(
  message: '$message',
  child: Icon(Icons.settings),
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const AtomixText('Hover or Long Press the icon below:'),
          const SizedBox(height: 16),
          AtomixTooltip(
            message: message,
            child: const Icon(
              Icons.settings,
              size: 48,
              color: AtomixColors.primary,
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
  name: 'With Badge',
  path: '[Atoms]/Tooltip',
  type: AtomixTooltip,
)
Widget tooltipBadge(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixTooltip(
          message: 'This status is verified',
          child: AtomixBadge(
            label: 'Verified',
            variant: AtomixBadgeVariant.success,
          ),
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixTooltip(
  message: 'Verified status',
  child: AtomixBadge(...),
)''',
        ),
      ],
    ),
  );
}
