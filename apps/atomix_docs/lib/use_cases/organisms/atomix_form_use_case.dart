import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Full Registration Form',
  type: AtomixForm,
  path: '[Organisms]/AtomixForm',
)
Widget buildRegistrationFormUseCase(BuildContext context) {
  final formKey = GlobalKey<FormState>();

  return Padding(
    padding: const EdgeInsets.all(AtomixSpacing.md),
    child: AtomixForm(
      formKey: formKey,
      children: [
        AtomixFormSection(
          title: 'Personal Information',
          children: [
            AtomixTextFormField(
              label: 'Full Name',
              hint: 'John Doe',
              prefixIcon: Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Name is required';
                return null;
              },
            ),
            AtomixTextFormField(
              label: 'Email Address',
              hint: 'john@example.com',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || !value.contains('@'))
                  return 'Invalid email';
                return null;
              },
            ),
          ],
        ),
        const SizedBox(height: AtomixSpacing.lg),
        AtomixFormSection(
          title: 'Account Security',
          children: [
            AtomixTextFormField(
              label: 'Password',
              obscureText: true,
              prefixIcon: Icons.lock,
              validator: (value) {
                if (value == null || value.length < 6) return 'Too short';
                return null;
              },
            ),
          ],
        ),
        const SizedBox(height: AtomixSpacing.xl),
        AtomixButton(
          label: 'Create Account',
          fullWidth: true,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Form Validated!')));
            }
          },
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Playground',
  type: AtomixForm,
  path: '[Organisms]/AtomixForm',
)
Widget buildFormPlayground(BuildContext context) {
  final spacing = context.knobs.double.slider(
    label: 'Spacing',
    initialValue: AtomixSpacing.md,
    min: 0,
    max: 40,
  );
  final paddingValue = context.knobs.double.slider(
    label: 'Padding',
    initialValue: AtomixSpacing.md,
    min: 0,
    max: 40,
  );
  final scrollable = context.knobs.boolean(
    label: 'Scrollable',
    initialValue: false,
  );
  final alignment = context.knobs.list<CrossAxisAlignment>(
    label: 'Cross Axis Alignment',
    options: CrossAxisAlignment.values,
    labelBuilder: (value) => value.toString().split('.').last,
    initialOption: CrossAxisAlignment.stretch,
  );

  final code =
      '''AtomixForm(
  spacing: $spacing,
  padding: EdgeInsets.all($paddingValue),
  scrollable: $scrollable,
  crossAxisAlignment: CrossAxisAlignment.${alignment.toString().split('.').last},
  children: [
    AtomixTextFormField(label: 'Field 1', hint: 'Enter something'),
    AtomixTextFormField(label: 'Field 2', hint: 'Enter something else'),
    AtomixButton(label: 'Submit', onPressed: () {}),
  ],
)''';

  return SingleChildScrollView(
    padding: const EdgeInsets.all(AtomixSpacing.md),
    child: Column(
      children: [
        AtomixForm(
          spacing: spacing,
          padding: EdgeInsets.all(paddingValue),
          scrollable: scrollable,
          crossAxisAlignment: alignment,
          children: [
            const AtomixTextFormField(
              label: 'Field 1',
              hint: 'Enter something',
            ),
            const AtomixTextFormField(
              label: 'Field 2',
              hint: 'Enter something else',
            ),
            AtomixButton(label: 'Submit', onPressed: () {}),
          ],
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Playground',
  type: AtomixTextFormField,
  path: '[Molecules]/AtomixTextFormField',
)
Widget buildTextFormFieldPlayground(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: 'Email');
  final hint = context.knobs.string(
    label: 'Hint',
    initialValue: 'Enter your email',
  );
  final helper = context.knobs.string(
    label: 'Helper',
    initialValue: 'We wont share your email',
  );
  final error = context.knobs.string(label: 'Error', initialValue: '');
  final obscure = context.knobs.boolean(
    label: 'Obscure Text',
    initialValue: false,
  );
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);

  final code =
      '''AtomixTextFormField(
  label: '$label',
  hint: '$hint',
  helperText: '$helper',
  errorText: ${error.isEmpty ? 'null' : "'$error'"},
  obscureText: $obscure,
  enabled: $enabled,
  prefixIcon: Icons.email,
)''';

  return SingleChildScrollView(
    padding: const EdgeInsets.all(AtomixSpacing.md),
    child: Column(
      children: [
        AtomixTextFormField(
          label: label,
          hint: hint,
          helperText: helper,
          errorText: error.isEmpty ? null : error,
          obscureText: obscure,
          enabled: enabled,
          prefixIcon: Icons.email,
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}
