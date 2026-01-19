import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/TextField',
  type: AtomixTextField,
)
Widget atomixTextFieldPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'TextField > Label',
    initialValue: 'Email Address',
  );

  final hint = context.knobs.string(
    label: 'TextField > Hint',
    initialValue: 'enter@example.com',
  );

  final helperText = context.knobs.string(
    label: 'TextField > Helper Text',
    initialValue: '',
  );

  final errorText = context.knobs.string(
    label: 'TextField > Error Text',
    initialValue: '',
  );

  final enabled = context.knobs.boolean(
    label: 'TextField > Enabled',
    initialValue: true,
  );

  final obscureText = context.knobs.boolean(
    label: 'TextField > Obscure (Password)',
    initialValue: false,
  );

  final showPrefix = context.knobs.boolean(
    label: 'Icons > Show Prefix Icon',
    initialValue: false,
  );

  final prefixIcon = showPrefix
      ? context.knobs.object.dropdown<IconData>(
          label: 'Icons > Prefix Icon',
          options: [Icons.email, Icons.person, Icons.lock, Icons.search],
        )
      : null;

  final showSuffix = context.knobs.boolean(
    label: 'Icons > Show Suffix Icon',
    initialValue: false,
  );

  final suffixIcon = showSuffix
      ? context.knobs.object.dropdown<IconData>(
          label: 'Icons > Suffix Icon',
          options: [
            Icons.visibility,
            Icons.clear,
            Icons.check_circle,
            Icons.info,
          ],
        )
      : null;

  final maxLines = context.knobs.double
      .slider(
        label: 'Max Lines',
        initialValue: 1,
        min: 1,
        max: 10,
        divisions: 9,
      )
      .toInt();

  // Helper strings
  final prefixStr = showPrefix
      ? '\n  prefixIcon: Icons.${prefixIcon.toString().split('(').last.split(')').first},'
      : '';
  final suffixStr = showSuffix
      ? '\n  suffixIcon: Icons.${suffixIcon.toString().split('(').last.split(')').first},'
      : '';
  final helperStr = helperText.isNotEmpty
      ? '\n  helperText: \'$helperText\','
      : '';
  final errorStr = errorText.isNotEmpty ? '\n  errorText: \'$errorText\',' : '';
  final enabledStr = !enabled ? '\n  enabled: false,' : '';
  final obscureStr = obscureText ? '\n  obscureText: true,' : '';
  final maxLinesStr = maxLines > 1 ? '\n  maxLines: $maxLines,' : '';

  final code =
      '''AtomixTextField(
  label: '$label',
  hint: '$hint',$helperStr$errorStr$prefixStr$suffixStr$enabledStr$obscureStr$maxLinesStr
)''';

  return Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        AtomixTextField(
          label: label,
          hint: hint,
          helperText: helperText.isEmpty ? null : helperText,
          errorText: errorText.isEmpty ? null : errorText,
          enabled: enabled,
          obscureText: obscureText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          maxLines: maxLines,
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Default',
  path: '[Molecules]/TextField',
  type: AtomixTextField,
)
Widget atomixTextFieldDefault(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const AtomixTextField(label: 'Email', hint: 'Enter your email'),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixTextField(
  label: 'Email',
  hint: 'Enter your email',
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Helper Text',
  path: '[Molecules]/TextField',
  type: AtomixTextField,
)
Widget atomixTextFieldWithHelper(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const AtomixTextField(
          label: 'Username',
          hint: 'Choose a username',
          helperText: 'Must be at least 3 characters',
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixTextField(
  label: 'Username',
  hint: 'Choose a username',
  helperText: 'Must be at least 3 characters',
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Error',
  path: '[Molecules]/TextField',
  type: AtomixTextField,
)
Widget atomixTextFieldWithError(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const AtomixTextField(
          label: 'Email',
          hint: 'Enter your email',
          errorText: 'Invalid email address',
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixTextField(
  label: 'Email',
  hint: 'Enter your email',
  errorText: 'Invalid email address',
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Prefix Icon',
  path: '[Molecules]/TextField',
  type: AtomixTextField,
)
Widget atomixTextFieldWithPrefixIcon(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const AtomixTextField(
          label: 'Search',
          hint: 'Search...',
          prefixIcon: Icons.search,
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixTextField(
  label: 'Search',
  hint: 'Search...',
  prefixIcon: Icons.search,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Password',
  path: '[Molecules]/TextField',
  type: AtomixTextField,
)
Widget atomixTextFieldPassword(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const AtomixTextField(
          label: 'Password',
          hint: 'Enter your password',
          obscureText: true,
          suffixIcon: Icons.visibility_off,
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixTextField(
  label: 'Password',
  hint: 'Enter your password',
  obscureText: true,
  suffixIcon: Icons.visibility_off,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Multiline',
  path: '[Molecules]/TextField',
  type: AtomixTextField,
)
Widget atomixTextFieldMultiline(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const AtomixTextField(
          label: 'Description',
          hint: 'Enter a description',
          maxLines: 4,
          minLines: 3,
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixTextField(
  label: 'Description',
  hint: 'Enter a description',
  maxLines: 4,
  minLines: 3,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Disabled',
  path: '[Molecules]/TextField',
  type: AtomixTextField,
)
Widget atomixTextFieldDisabled(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const AtomixTextField(
          label: 'Disabled',
          hint: 'This field is disabled',
          enabled: false,
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixTextField(
  label: 'Disabled',
  hint: 'This field is disabled',
  enabled: false,
)''',
        ),
      ],
    ),
  );
}
