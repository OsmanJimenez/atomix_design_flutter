import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/SideMenu',
  type: AtomixSideMenu,
)
Widget atomixSideMenuPlayground(BuildContext context) {
  final code = '''AtomixSideMenu(
  header: 'My App',
  items: [
    AtomixSideMenuItem(
      label: 'Dashboard',
      icon: Icons.dashboard,
      isSelected: true,
      onTap: () {},
    ),
    AtomixSideMenuItem(
      label: 'Users',
      icon: Icons.people,
      badge: '5',
      onTap: () {},
    ),
  ],
)''';

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SideMenuWrapper(),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
    ),
  );
}

class _SideMenuWrapper extends StatefulWidget {
  @override
  State<_SideMenuWrapper> createState() => _SideMenuWrapperState();
}

class _SideMenuWrapperState extends State<_SideMenuWrapper> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AtomixSideMenu(
      header: 'My App',
      items: [
        AtomixSideMenuItem(
          label: 'Dashboard',
          icon: Icons.dashboard,
          isSelected: selectedIndex == 0,
          onTap: () => setState(() => selectedIndex = 0),
        ),
        AtomixSideMenuItem(
          label: 'Users',
          icon: Icons.people,
          isSelected: selectedIndex == 1,
          onTap: () => setState(() => selectedIndex = 1),
          badge: '5',
        ),
        AtomixSideMenuItem(
          label: 'Settings',
          icon: Icons.settings,
          isSelected: selectedIndex == 2,
          onTap: () => setState(() => selectedIndex = 2),
        ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Admin Panel',
  path: '[Organisms]/SideMenu',
  type: AtomixSideMenu,
)
Widget atomixSideMenuAdmin(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const _SideMenuAdminWrapper(),
        Padding(
          padding: const EdgeInsets.all(24),
          child: const CodeSnippet(
            code: '''AtomixSideMenu(
  header: 'Admin Panel',
  items: [
    AtomixSideMenuItem(label: 'Dashboard', icon: Icons.dashboard, onTap: () {}),
    AtomixSideMenuItem(label: 'Analytics', icon: Icons.analytics, onTap: () {}),
    AtomixSideMenuItem(label: 'Reports', icon: Icons.assessment, badge: '3', onTap: () {}),
  ],
)''',
          ),
        ),
      ],
    ),
  );
}

class _SideMenuAdminWrapper extends StatefulWidget {
  const _SideMenuAdminWrapper();

  @override
  State<_SideMenuAdminWrapper> createState() => _SideMenuAdminWrapperState();
}

class _SideMenuAdminWrapperState extends State<_SideMenuAdminWrapper> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AtomixSideMenu(
      header: 'Admin Panel',
      items: [
        AtomixSideMenuItem(
          label: 'Dashboard',
          icon: Icons.dashboard,
          isSelected: selectedIndex == 0,
          onTap: () => setState(() => selectedIndex = 0),
        ),
        AtomixSideMenuItem(
          label: 'Analytics',
          icon: Icons.analytics,
          isSelected: selectedIndex == 1,
          onTap: () => setState(() => selectedIndex = 1),
        ),
        AtomixSideMenuItem(
          label: 'Reports',
          icon: Icons.assessment,
          isSelected: selectedIndex == 2,
          badge: '3',
          onTap: () => setState(() => selectedIndex = 2),
        ),
      ],
    );
  }
}
