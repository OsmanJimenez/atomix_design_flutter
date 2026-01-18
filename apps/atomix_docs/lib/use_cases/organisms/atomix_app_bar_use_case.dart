import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixAppBar)
Widget atomixAppBarDefault(BuildContext context) {
  return Scaffold(
    appBar: const AtomixAppBar(title: 'Home'),
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('App Bar Example'),
            const SizedBox(height: 24),
            const CodeSnippet(
              code: '''AtomixAppBar(
  title: 'Home',
)''',
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Leading Icon', type: AtomixAppBar)
Widget atomixAppBarWithLeading(BuildContext context) {
  return Scaffold(
    appBar: AtomixAppBar(
      title: 'Settings',
      leading: Icons.menu,
      onLeadingPressed: () {},
    ),
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('App Bar with Menu'),
            const SizedBox(height: 24),
            const CodeSnippet(
              code: '''AtomixAppBar(
  title: 'Settings',
  leading: Icons.menu,
  onLeadingPressed: () {},
)''',
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Actions', type: AtomixAppBar)
Widget atomixAppBarWithActions(BuildContext context) {
  return Scaffold(
    appBar: AtomixAppBar(
      title: 'Messages',
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
      ],
    ),
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('App Bar with Actions'),
            const SizedBox(height: 24),
            const CodeSnippet(
              code: '''AtomixAppBar(
  title: 'Messages',
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {},
    ),
  ],
)''',
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Centered Title', type: AtomixAppBar)
Widget atomixAppBarCentered(BuildContext context) {
  return Scaffold(
    appBar: const AtomixAppBar(title: 'Centered', centerTitle: true),
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Centered App Bar'),
            const SizedBox(height: 24),
            const CodeSnippet(
              code: '''AtomixAppBar(
  title: 'Centered',
  centerTitle: true,
)''',
            ),
          ],
        ),
      ),
    ),
  );
}
