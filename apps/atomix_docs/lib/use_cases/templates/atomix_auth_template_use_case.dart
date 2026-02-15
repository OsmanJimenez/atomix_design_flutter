import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Templates]/Auth',
  type: AtomixAuthTemplate,
)
Widget atomixAuthTemplatePlayground(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Welcome Back',
  );
  final subtitle = context.knobs.string(
    label: 'Subtitle',
    initialValue: 'Sign in to your account',
  );

  final code =
      '''AtomixAuthTemplate(
  title: '$title',
  subtitle: '$subtitle',
  form: Column(
    children: [
      AtomixTextField(label: 'Email', hint: 'Enter your email'),
      SizedBox(height: 16),
      AtomixTextField(label: 'Password', hint: 'Enter your password', obscureText: true),
      SizedBox(height: 24),
      AtomixButton(label: 'Sign In', onPressed: () {}, fullWidth: true),
    ],
  ),
  footer: Text('Don\\'t have an account? Sign up'),
)''';

  return Column(
    children: [
      Expanded(
        child: AtomixAuthTemplate(
          title: title,
          subtitle: subtitle,
          form: Column(
            children: [
              const AtomixTextField(label: 'Email', hint: 'Enter your email'),
              const SizedBox(height: 16),
              const AtomixTextField(
                label: 'Password',
                hint: 'Enter your password',
                obscureText: true,
              ),
              const SizedBox(height: 24),
              AtomixButton(label: 'Sign In', onPressed: () {}, fullWidth: true),
            ],
          ),
          footer: const Text('Don\'t have an account? Sign up'),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Code:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CodeSnippet(code: code),
          ],
        ),
      ),
    ],
  );
}

@widgetbook.UseCase(
  name: 'Login Screen',
  path: '[Templates]/Auth',
  type: AtomixAuthTemplate,
)
Widget atomixAuthTemplateLogin(BuildContext context) {
  return Column(
    children: [
      const Expanded(
        child: AtomixAuthTemplate(
          title: 'Login',
          subtitle: 'Welcome back! Please enter your details.',
          form: Column(
            children: [
              AtomixTextField(label: 'Email', hint: 'name@company.com'),
              SizedBox(height: 16),
              AtomixTextField(
                label: 'Password',
                hint: '••••••••',
                obscureText: true,
              ),
              SizedBox(height: 24),
              AtomixButton(label: 'Login', onPressed: null, fullWidth: true),
            ],
          ),
          footer: Text('New here? Create an account'),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(24),
        child: const CodeSnippet(
          code: '''AtomixAuthTemplate(
  title: 'Login',
  subtitle: 'Welcome back!',
  form: Column(
    children: [
      AtomixTextField(label: 'Email', hint: 'name@company.com'),
      AtomixTextField(label: 'Password', obscureText: true),
      AtomixButton(label: 'Login', fullWidth: true),
    ],
  ),
)''',
        ),
      ),
    ],
  );
}

@widgetbook.UseCase(
  name: 'Registration Screen',
  path: '[Templates]/Auth',
  type: AtomixAuthTemplate,
)
Widget atomixAuthTemplateRegister(BuildContext context) {
  return Column(
    children: [
      const Expanded(
        child: AtomixAuthTemplate(
          title: 'Create Account',
          subtitle: 'Start your 30-day free trial.',
          form: Column(
            children: [
              AtomixTextField(label: 'Name', hint: 'Enter your name'),
              SizedBox(height: 16),
              AtomixTextField(label: 'Email', hint: 'name@company.com'),
              SizedBox(height: 16),
              AtomixTextField(
                label: 'Password',
                hint: '••••••••',
                obscureText: true,
              ),
              SizedBox(height: 24),
              AtomixButton(
                label: 'Get Started',
                onPressed: null,
                fullWidth: true,
              ),
            ],
          ),
          footer: Text('Already have an account? Log in'),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(24),
        child: const CodeSnippet(
          code: '''AtomixAuthTemplate(
  title: 'Create Account',
  form: Column(
    children: [
      AtomixTextField(label: 'Name'),
      AtomixTextField(label: 'Email'),
      AtomixTextField(label: 'Password', obscureText: true),
      AtomixButton(label: 'Get Started', fullWidth: true),
    ],
  ),
)''',
        ),
      ),
    ],
  );
}
