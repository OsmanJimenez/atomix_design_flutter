import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/Alert',
  type: AtomixAlert,
)
Widget atomixAlertPlayground(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'This is an alert',
  );

  final description = context.knobs.string(
    label: 'Description',
    initialValue: 'It provides important information to the user.',
  );

  final type = context.knobs.list(
    label: 'Type',
    options: AtomixAlertType.values,
    initialOption: AtomixAlertType.info,
    labelBuilder: (t) => t.name,
  );

  final showClose = context.knobs.boolean(
    label: 'Show Close Button',
    initialValue: true,
  );

  final code =
      '''AtomixAlert(
  title: '$title',
  description: '${description.isNotEmpty ? description : null}',
  type: AtomixAlertType.${type.name},
  onClose: ${showClose ? '() {}' : 'null'},
)''';

  return Padding(
    padding: const EdgeInsets.all(24),
    child: Center(
      child: Column(
        children: [
          AtomixAlert(
            title: title,
            description: description.isNotEmpty ? description : null,
            type: type,
            onClose: showClose ? () {} : null,
          ),
          const SizedBox(height: 24),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Success Alert',
  path: '[Molecules]/Alert',
  type: AtomixAlert,
)
Widget atomixAlertSuccess(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(24),
    child: Center(
      child: Column(
        children: [
          AtomixAlert(
            title: 'Success!',
            description: 'Your changes have been saved successfully.',
            type: AtomixAlertType.success,
          ),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixAlert(
  title: 'Success!',
  description: 'Your changes have been saved successfully.',
  type: AtomixAlertType.success,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Error Alert',
  path: '[Molecules]/Alert',
  type: AtomixAlert,
)
Widget atomixAlertError(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(24),
    child: Center(
      child: Column(
        children: [
          AtomixAlert(
            title: 'Error',
            description: 'Something went wrong. Please try again.',
            type: AtomixAlertType.error,
            onClose: null,
          ),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixAlert(
  title: 'Error',
  description: 'Something went wrong. Please try again.',
  type: AtomixAlertType.error,
  onClose: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Warning Alert',
  path: '[Molecules]/Alert',
  type: AtomixAlert,
)
Widget atomixAlertWarning(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(24),
    child: Center(
      child: Column(
        children: [
          AtomixAlert(
            title: 'Warning',
            description: 'This action cannot be undone.',
            type: AtomixAlertType.warning,
          ),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixAlert(
  title: 'Warning',
  description: 'This action cannot be undone.',
  type: AtomixAlertType.warning,
)''',
          ),
        ],
      ),
    ),
  );
}
