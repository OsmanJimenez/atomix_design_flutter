import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/SettingsList',
  type: AtomixSettingsList,
)
Widget atomixSettingsListPlayground(BuildContext context) {
  final code = '''AtomixSettingsList(
  groups: [
    AtomixSettingsGroup(
      title: 'Account',
      items: [
        AtomixSettingsItem(
          title: 'Profile',
          subtitle: 'Manage your profile',
          icon: Icons.person,
        ),
      ],
    ),
  ],
)''';

  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AtomixSettingsList(
          groups: [
            AtomixSettingsGroup(
              title: 'Account',
              items: const [
                AtomixSettingsItem(
                  title: 'Profile',
                  subtitle: 'Manage your profile',
                  icon: Icons.person,
                ),
                AtomixSettingsItem(
                  title: 'Privacy',
                  subtitle: 'Control your privacy settings',
                  icon: Icons.lock,
                ),
              ],
            ),
            AtomixSettingsGroup(
              title: 'Preferences',
              items: [
                AtomixSettingsItem(
                  title: 'Notifications',
                  subtitle: 'Manage notifications',
                  icon: Icons.notifications,
                  trailing: Switch(value: true, onChanged: (_) {}),
                ),
                const AtomixSettingsItem(
                  title: 'Language',
                  subtitle: 'English',
                  icon: Icons.language,
                ),
              ],
            ),
          ],
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
  name: 'App Settings',
  path: '[Organisms]/SettingsList',
  type: AtomixSettingsList,
)
Widget atomixSettingsListApp(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        AtomixSettingsList(
          groups: [
            AtomixSettingsGroup(
              title: 'General',
              items: [
                AtomixSettingsItem(
                  title: 'Dark Mode',
                  subtitle: 'Enable dark theme',
                  icon: Icons.dark_mode,
                  trailing: Switch(value: false, onChanged: (_) {}),
                ),
                const AtomixSettingsItem(
                  title: 'Font Size',
                  subtitle: 'Medium',
                  icon: Icons.text_fields,
                ),
              ],
            ),
            AtomixSettingsGroup(
              title: 'About',
              items: const [
                AtomixSettingsItem(
                  title: 'Version',
                  subtitle: '1.0.0',
                  icon: Icons.info,
                ),
                AtomixSettingsItem(
                  title: 'Terms of Service',
                  icon: Icons.description,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixSettingsList(
  groups: [
    AtomixSettingsGroup(
      title: 'General',
      items: [
        AtomixSettingsItem(
          title: 'Dark Mode',
          subtitle: 'Enable dark theme',
          icon: Icons.dark_mode,
          trailing: Switch(value: false, onChanged: (_) {}),
        ),
      ],
    ),
  ],
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'User Preferences',
  path: '[Organisms]/SettingsList',
  type: AtomixSettingsList,
)
Widget atomixSettingsListPreferences(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        AtomixSettingsList(
          groups: [
            AtomixSettingsGroup(
              title: 'Notifications',
              items: [
                AtomixSettingsItem(
                  title: 'Push Notifications',
                  subtitle: 'Receive push notifications',
                  icon: Icons.notifications_active,
                  trailing: Switch(value: true, onChanged: (_) {}),
                ),
                AtomixSettingsItem(
                  title: 'Email Notifications',
                  subtitle: 'Receive email updates',
                  icon: Icons.email,
                  trailing: Switch(value: false, onChanged: (_) {}),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixSettingsList(
  groups: [
    AtomixSettingsGroup(
      title: 'Notifications',
      items: [
        AtomixSettingsItem(
          title: 'Push Notifications',
          subtitle: 'Receive push notifications',
          icon: Icons.notifications_active,
          trailing: Switch(value: true, onChanged: (_) {}),
        ),
      ],
    ),
  ],
)''',
        ),
      ],
    ),
  );
}
