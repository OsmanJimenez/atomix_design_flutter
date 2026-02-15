import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/Toast',
  type: AtomixToast,
)
Widget atomixToastPlayground(BuildContext context) {
  final message = context.knobs.string(
    label: 'Message',
    initialValue: 'Operation completed successfully.',
  );

  final type = context.knobs.list(
    label: 'Type',
    options: AtomixAlertType.values,
    initialOption: AtomixAlertType.success,
    labelBuilder: (t) => t.name,
  );

  final code =
      '''AtomixToast.show(
  context,
  message: '$message',
  type: AtomixAlertType.${type.name},
  actionLabel: 'UNDO',
  onAction: () {},
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixButton(
          label: 'Show Toast',
          onPressed: () {
            AtomixToast.show(
              context,
              message: message,
              type: type,
              actionLabel: 'UNDO',
              onAction: () {},
            );
          },
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Success Toast',
  path: '[Molecules]/Toast',
  type: AtomixToast,
)
Widget atomixToastSuccess(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixButton(
          label: 'Show Success',
          onPressed: () {
            AtomixToast.show(
              context,
              message: 'Changes saved successfully!',
              type: AtomixAlertType.success,
            );
          },
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixToast.show(
  context,
  message: 'Changes saved successfully!',
  type: AtomixAlertType.success,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Error Toast',
  path: '[Molecules]/Toast',
  type: AtomixToast,
)
Widget atomixToastError(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixButton(
          label: 'Show Error',
          onPressed: () {
            AtomixToast.show(
              context,
              message: 'Failed to save changes.',
              type: AtomixAlertType.error,
            );
          },
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixToast.show(
  context,
  message: 'Failed to save changes.',
  type: AtomixAlertType.error,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Action',
  path: '[Molecules]/Toast',
  type: AtomixToast,
)
Widget atomixToastWithAction(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixButton(
          label: 'Show Toast with Action',
          onPressed: () {
            AtomixToast.show(
              context,
              message: 'Item deleted',
              type: AtomixAlertType.info,
              actionLabel: 'UNDO',
              onAction: () {
                // Undo action
              },
            );
          },
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixToast.show(
  context,
  message: 'Item deleted',
  type: AtomixAlertType.info,
  actionLabel: 'UNDO',
  onAction: () {
    // Undo action
  },
)''',
        ),
      ],
    ),
  );
}
