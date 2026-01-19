import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Label',
  type: AtomixLabel,
)
Widget labelPlayground(BuildContext context) {
  final labelText = context.knobs.string(
    label: 'Label > Text',
    initialValue: 'Email Address',
  );

  final subLabel = context.knobs.string(
    label: 'Label > Sub Label',
    initialValue: 'We will never share your email.',
  );

  final isRequired = context.knobs.boolean(
    label: 'Label > Is Required',
    initialValue: true,
  );

  final isError = context.knobs.boolean(
    label: 'Label > Is Error',
    initialValue: false,
  );

  final code =
      '''AtomixLabel(
  label: '$labelText',
  subLabel: ${subLabel.isEmpty ? 'null' : "'$subLabel'"},
  isRequired: $isRequired,
  isError: $isError,
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixLabel(
            label: labelText,
            subLabel: subLabel.isEmpty ? null : subLabel,
            isRequired: isRequired,
            isError: isError,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Required', path: '[Atoms]/Label', type: AtomixLabel)
Widget labelRequired(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixLabel(label: 'Mandatory Field', isRequired: true),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixLabel(
  label: 'Mandatory Field',
  isRequired: true,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Help Text',
  path: '[Atoms]/Label',
  type: AtomixLabel,
)
Widget labelHelp(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixLabel(
            label: 'Password',
            subLabel: 'Must be at least 8 characters long.',
          ),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixLabel(
  label: 'Password',
  subLabel: 'Must be at least 8 characters long.',
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Error', path: '[Atoms]/Label', type: AtomixLabel)
Widget labelError(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixLabel(
            label: 'Invalid Input',
            subLabel: 'Please correct the error below.',
            isError: true,
          ),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixLabel(
  label: 'Invalid Input',
  subLabel: 'Please correct the error below.',
  isError: true,
)''',
          ),
        ],
      ),
    ),
  );
}
