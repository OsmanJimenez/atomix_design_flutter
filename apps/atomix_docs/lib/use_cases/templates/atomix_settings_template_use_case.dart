import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Templates]/Settings',
  type: AtomixSettingsTemplate,
)
Widget atomixSettingsTemplatePlayground(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Preferences',
  );

  final code =
      '''AtomixSettingsTemplate(
  title: '$title',
  sections: [
    AtomixCard(child: SettingsSection()),
  ],
)''';

  return Column(
    children: [
      Expanded(
        child: AtomixSettingsTemplate(
          title: title,
          sections: [
            AtomixCard(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const AtomixTextField(
                      label: 'Display Name',
                      hint: 'John Doe',
                    ),
                    const SizedBox(height: 16),
                    const AtomixTextField(
                      label: 'Email',
                      hint: 'john@example.com',
                    ),
                    const SizedBox(height: 24),
                    AtomixButton(
                      label: 'Save Changes',
                      onPressed: () {},
                      fullWidth: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
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
  name: 'App Preferences',
  path: '[Templates]/Settings',
  type: AtomixSettingsTemplate,
)
Widget atomixSettingsTemplateApp(BuildContext context) {
  return Column(
    children: [
      Expanded(
        child: AtomixSettingsTemplate(
          title: 'App Settings',
          sections: [
            const AtomixCard(
              child: AtomixSettingsList(
                groups: [
                  AtomixSettingsGroup(
                    title: 'Appearance',
                    items: [
                      AtomixSettingsItem(
                        title: 'Theme',
                        subtitle: 'System default',
                        icon: Icons.palette,
                      ),
                      AtomixSettingsItem(
                        title: 'Font size',
                        subtitle: 'Medium',
                        icon: Icons.text_fields,
                      ),
                    ],
                  ),
                  AtomixSettingsGroup(
                    title: 'System',
                    items: [
                      AtomixSettingsItem(
                        title: 'Language',
                        subtitle: 'English',
                        icon: Icons.language,
                      ),
                      AtomixSettingsItem(
                        title: 'Storage',
                        subtitle: '1.2 GB used',
                        icon: Icons.storage,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(24),
        child: const CodeSnippet(
          code: '''AtomixSettingsTemplate(
  title: 'App Settings',
  sections: [
    AtomixCard(
      child: AtomixSettingsList(
        groups: [...],
      ),
    ),
  ],
)''',
        ),
      ),
    ],
  );
}
