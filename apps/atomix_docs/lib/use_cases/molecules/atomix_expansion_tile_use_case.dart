import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/ExpansionTile',
  type: AtomixExpansionTile,
)
Widget atomixExpansionTilePlayground(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Frequently Asked Questions',
  );

  final subtitle = context.knobs.string(
    label: 'Subtitle',
    initialValue: 'Click to expand',
  );

  final initiallyExpanded = context.knobs.boolean(
    label: 'Initially Expanded',
    initialValue: false,
  );

  final code =
      '''AtomixExpansionTile(
  title: '$title',
  subtitle: '${subtitle.isNotEmpty ? subtitle : null}',
  initiallyExpanded: $initiallyExpanded,
  leading: Icon(Icons.help_outline),
  children: [
    Padding(
      padding: EdgeInsets.all(16),
      child: Text('This is the expanded content.'),
    ),
  ],
)''';

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixExpansionTile(
            title: title,
            subtitle: subtitle.isNotEmpty ? subtitle : null,
            initiallyExpanded: initiallyExpanded,
            leading: const Icon(Icons.help_outline),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'This is the expanded content. You can put any widget here.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'FAQ Item',
  path: '[Molecules]/ExpansionTile',
  type: AtomixExpansionTile,
)
Widget atomixExpansionTileFAQ(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixExpansionTile(
            title: 'How do I reset my password?',
            leading: const Icon(Icons.lock_outline),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Click on "Forgot Password" on the login page and follow the instructions sent to your email.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixExpansionTile(
  title: 'How do I reset my password?',
  leading: Icon(Icons.lock_outline),
  children: [
    Padding(
      padding: EdgeInsets.all(16),
      child: Text('Click on "Forgot Password"...'),
    ),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Settings Section',
  path: '[Molecules]/ExpansionTile',
  type: AtomixExpansionTile,
)
Widget atomixExpansionTileSettings(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixExpansionTile(
            title: 'Privacy Settings',
            subtitle: 'Manage your privacy preferences',
            leading: const Icon(Icons.privacy_tip_outlined),
            initiallyExpanded: true,
            children: [
              ListTile(
                title: const Text('Profile Visibility'),
                trailing: Switch(value: true, onChanged: (v) {}),
              ),
              ListTile(
                title: const Text('Activity Status'),
                trailing: Switch(value: false, onChanged: (v) {}),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixExpansionTile(
  title: 'Privacy Settings',
  subtitle: 'Manage your privacy preferences',
  leading: Icon(Icons.privacy_tip_outlined),
  initiallyExpanded: true,
  children: [
    ListTile(title: Text('Profile Visibility'), trailing: Switch(...)),
    ListTile(title: Text('Activity Status'), trailing: Switch(...)),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}
