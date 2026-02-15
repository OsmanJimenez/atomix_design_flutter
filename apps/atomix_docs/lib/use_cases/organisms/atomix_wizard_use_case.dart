import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/Wizard',
  type: AtomixWizard,
)
Widget atomixWizardPlayground(BuildContext context) {
  final code = '''AtomixWizard(
  steps: [
    AtomixWizardStep(
      title: 'Personal Info',
      content: YourFormWidget(),
    ),
    AtomixWizardStep(
      title: 'Address',
      content: YourAddressWidget(),
    ),
    AtomixWizardStep(
      title: 'Confirmation',
      content: YourConfirmationWidget(),
    ),
  ],
  onComplete: () {},
)''';

  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AtomixWizard(
          steps: [
            AtomixWizardStep(
              title: 'Personal Info',
              content: Column(
                children: const [
                  AtomixTextField(label: 'Name', hint: 'Enter your name'),
                  SizedBox(height: 16),
                  AtomixTextField(label: 'Email', hint: 'Enter your email'),
                ],
              ),
            ),
            AtomixWizardStep(
              title: 'Address',
              content: Column(
                children: const [
                  AtomixTextField(label: 'Street', hint: 'Enter street'),
                  SizedBox(height: 16),
                  AtomixTextField(label: 'City', hint: 'Enter city'),
                ],
              ),
            ),
            AtomixWizardStep(
              title: 'Confirmation',
              content: const Text('Review your information and confirm.'),
            ),
          ],
          onComplete: () {},
        ),
        const SizedBox(height: 32),
        const Text(
          'Code:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Account Setup',
  path: '[Organisms]/Wizard',
  type: AtomixWizard,
)
Widget atomixWizardAccountSetup(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        AtomixWizard(
          steps: [
            AtomixWizardStep(
              title: 'Create Account',
              content: Column(
                children: const [
                  AtomixTextField(label: 'Username', hint: 'Choose a username'),
                  SizedBox(height: 16),
                  AtomixTextField(
                    label: 'Password',
                    hint: 'Create a password',
                    obscureText: true,
                  ),
                ],
              ),
            ),
            AtomixWizardStep(
              title: 'Profile Details',
              content: Column(
                children: const [
                  AtomixTextField(
                    label: 'Full Name',
                    hint: 'Enter your full name',
                  ),
                  SizedBox(height: 16),
                  AtomixTextField(
                    label: 'Bio',
                    hint: 'Tell us about yourself',
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            AtomixWizardStep(
              title: 'Finish',
              content: const Text(
                'Your account is ready! Click finish to complete setup.',
              ),
            ),
          ],
          onComplete: () {},
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixWizard(
  steps: [
    AtomixWizardStep(
      title: 'Create Account',
      content: Column(children: [
        AtomixTextField(label: 'Username', hint: 'Choose a username'),
        AtomixTextField(label: 'Password', hint: 'Create a password'),
      ]),
    ),
    AtomixWizardStep(title: 'Profile Details', content: ...),
    AtomixWizardStep(title: 'Finish', content: ...),
  ],
  onComplete: () {},
)''',
        ),
      ],
    ),
  );
}
