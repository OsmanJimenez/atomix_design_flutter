import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/Tabs',
  type: AtomixTabs,
)
Widget atomixTabsPlayground(BuildContext context) {
  final isScrollable = context.knobs.boolean(
    label: 'Is Scrollable',
    initialValue: false,
  );

  return Center(child: _TabsWrapper(isScrollable: isScrollable));
}

class _TabsWrapper extends StatefulWidget {
  final bool isScrollable;

  const _TabsWrapper({required this.isScrollable});

  @override
  State<_TabsWrapper> createState() => _TabsWrapperState();
}

class _TabsWrapperState extends State<_TabsWrapper> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final code =
        '''AtomixTabs(
  selectedIndex: selectedIndex,
  isScrollable: ${widget.isScrollable},
  onTabSelected: (index) => setState(() => selectedIndex = index),
  tabs: ['Home', 'Profile', 'Settings', 'Notifications', 'Messages'],
)''';

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AtomixTabs(
            selectedIndex: selectedIndex,
            isScrollable: widget.isScrollable,
            onTabSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabs: const [
              'Home',
              'Profile',
              'Settings',
              'Notifications',
              'Messages',
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('Content for Tab $selectedIndex'),
          ),
          const SizedBox(height: 24),
          CodeSnippet(code: code),
        ],
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Simple Tabs',
  path: '[Molecules]/Tabs',
  type: AtomixTabs,
)
Widget atomixTabsSimple(BuildContext context) {
  return const Center(child: _TabsSimpleWrapper());
}

class _TabsSimpleWrapper extends StatefulWidget {
  const _TabsSimpleWrapper();

  @override
  State<_TabsSimpleWrapper> createState() => _TabsSimpleWrapperState();
}

class _TabsSimpleWrapperState extends State<_TabsSimpleWrapper> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixTabs(
            selectedIndex: selectedIndex,
            onTabSelected: (index) => setState(() => selectedIndex = index),
            tabs: const ['Overview', 'Details', 'Reviews'],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixTabs(
  selectedIndex: selectedIndex,
  onTabSelected: (index) => setState(() => selectedIndex = index),
  tabs: ['Overview', 'Details', 'Reviews'],
)''',
          ),
        ],
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Scrollable Tabs',
  path: '[Molecules]/Tabs',
  type: AtomixTabs,
)
Widget atomixTabsScrollable(BuildContext context) {
  return const Center(child: _TabsScrollableWrapper());
}

class _TabsScrollableWrapper extends StatefulWidget {
  const _TabsScrollableWrapper();

  @override
  State<_TabsScrollableWrapper> createState() => _TabsScrollableWrapperState();
}

class _TabsScrollableWrapperState extends State<_TabsScrollableWrapper> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixTabs(
            selectedIndex: selectedIndex,
            isScrollable: true,
            onTabSelected: (index) => setState(() => selectedIndex = index),
            tabs: const [
              'Dashboard',
              'Analytics',
              'Reports',
              'Settings',
              'Users',
              'Billing',
              'Support',
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixTabs(
  selectedIndex: selectedIndex,
  isScrollable: true,
  onTabSelected: (index) => setState(() => selectedIndex = index),
  tabs: ['Dashboard', 'Analytics', 'Reports', 'Settings', 'Users', 'Billing', 'Support'],
)''',
          ),
        ],
      ),
    );
  }
}
