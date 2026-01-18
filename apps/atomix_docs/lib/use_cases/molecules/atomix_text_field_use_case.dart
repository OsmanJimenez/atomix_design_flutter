import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixTextField)
Widget atomixTextFieldDefault(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const AtomixTextField(label: 'Email', hint: 'Enter your email'),
        const SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixTextField(
  label: 'Email',
  hint: 'Enter your email',
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'With Helper Text', type: AtomixTextField)
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
        CodeSnippet(
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

@widgetbook.UseCase(name: 'With Error', type: AtomixTextField)
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
        CodeSnippet(
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

@widgetbook.UseCase(name: 'With Prefix Icon', type: AtomixTextField)
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
        CodeSnippet(
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

@widgetbook.UseCase(name: 'Password', type: AtomixTextField)
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
        CodeSnippet(
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

@widgetbook.UseCase(name: 'Multiline', type: AtomixTextField)
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
        CodeSnippet(
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

@widgetbook.UseCase(name: 'Disabled', type: AtomixTextField)
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
        CodeSnippet(
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
