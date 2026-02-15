import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/Header',
  type: AtomixHeader,
)
Widget atomixHeaderPlayground(BuildContext context) {
  final code = '''AtomixHeader(
  title: 'Atomix',
  items: [
    AtomixHeaderItem(
      label: 'Home',
      isActive: true,
      onTap: () {},
    ),
    AtomixHeaderItem(
      label: 'Products',
      onTap: () {},
    ),
  ],
  actions: [
    AtomixButton(
      label: 'Sign In',
      onPressed: () {},
      variant: AtomixButtonVariant.tertiary,
    ),
  ],
)''';

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _HeaderWrapper(),
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

class _HeaderWrapper extends StatefulWidget {
  @override
  State<_HeaderWrapper> createState() => _HeaderWrapperState();
}

class _HeaderWrapperState extends State<_HeaderWrapper> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AtomixHeader(
      title: 'Atomix',
      items: [
        AtomixHeaderItem(
          label: 'Home',
          isActive: activeIndex == 0,
          onTap: () => setState(() => activeIndex = 0),
        ),
        AtomixHeaderItem(
          label: 'Products',
          isActive: activeIndex == 1,
          onTap: () => setState(() => activeIndex = 1),
        ),
        AtomixHeaderItem(
          label: 'About',
          isActive: activeIndex == 2,
          onTap: () => setState(() => activeIndex = 2),
        ),
      ],
      actions: [
        AtomixButton(
          label: 'Sign In',
          onPressed: () {},
          variant: AtomixButtonVariant.tertiary,
        ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Marketing Header',
  path: '[Organisms]/Header',
  type: AtomixHeader,
)
Widget atomixHeaderMarketing(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const _HeaderMarketingWrapper(),
        Padding(
          padding: const EdgeInsets.all(24),
          child: const CodeSnippet(
            code: '''AtomixHeader(
  title: 'My Brand',
  items: [
    AtomixHeaderItem(label: 'Features', onTap: () {}),
    AtomixHeaderItem(label: 'Pricing', onTap: () {}),
    AtomixHeaderItem(label: 'Blog', onTap: () {}),
  ],
  actions: [
    AtomixButton(label: 'Get Started', onPressed: () {}, variant: AtomixButtonVariant.primary),
  ],
)''',
          ),
        ),
      ],
    ),
  );
}

class _HeaderMarketingWrapper extends StatefulWidget {
  const _HeaderMarketingWrapper();

  @override
  State<_HeaderMarketingWrapper> createState() =>
      _HeaderMarketingWrapperState();
}

class _HeaderMarketingWrapperState extends State<_HeaderMarketingWrapper> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AtomixHeader(
      title: 'My Brand',
      items: [
        AtomixHeaderItem(
          label: 'Features',
          isActive: activeIndex == 0,
          onTap: () => setState(() => activeIndex = 0),
        ),
        AtomixHeaderItem(
          label: 'Pricing',
          isActive: activeIndex == 1,
          onTap: () => setState(() => activeIndex = 1),
        ),
        AtomixHeaderItem(
          label: 'Blog',
          isActive: activeIndex == 2,
          onTap: () => setState(() => activeIndex = 2),
        ),
      ],
      actions: [
        AtomixButton(
          label: 'Get Started',
          onPressed: () {},
          variant: AtomixButtonVariant.primary,
        ),
      ],
    );
  }
}
