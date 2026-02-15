import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/BottomNavigation',
  type: AtomixBottomNavigation,
)
Widget atomixBottomNavigationPlayground(BuildContext context) {
  final code = '''AtomixBottomNavigation(
  currentIndex: currentIndex,
  onTap: (index) => setState(() => currentIndex = index),
  items: [
    AtomixBottomNavigationItem(
      label: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
    ),
    AtomixBottomNavigationItem(
      label: 'Search',
      icon: Icons.search_outlined,
      activeIcon: Icons.search,
    ),
    AtomixBottomNavigationItem(
      label: 'Notifications',
      icon: Icons.notifications_outlined,
      activeIcon: Icons.notifications,
      badge: '3',
    ),
  ],
)''';

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _BottomNavigationWrapper(),
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

class _BottomNavigationWrapper extends StatefulWidget {
  @override
  State<_BottomNavigationWrapper> createState() =>
      _BottomNavigationWrapperState();
}

class _BottomNavigationWrapperState extends State<_BottomNavigationWrapper> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          alignment: Alignment.center,
          child: Text('Page $currentIndex'),
        ),
        AtomixBottomNavigation(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            AtomixBottomNavigationItem(
              label: 'Home',
              icon: Icons.home_outlined,
              activeIcon: Icons.home,
            ),
            AtomixBottomNavigationItem(
              label: 'Search',
              icon: Icons.search_outlined,
              activeIcon: Icons.search,
            ),
            AtomixBottomNavigationItem(
              label: 'Notifications',
              icon: Icons.notifications_outlined,
              activeIcon: Icons.notifications,
              badge: '3',
            ),
            AtomixBottomNavigationItem(
              label: 'Profile',
              icon: Icons.person_outline,
              activeIcon: Icons.person,
            ),
          ],
        ),
      ],
    );
  }
}
