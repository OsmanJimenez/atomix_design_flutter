import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/Hero',
  type: AtomixHero,
)
Widget atomixHeroPlayground(BuildContext context) {
  final showSubtitle = context.knobs.boolean(
    label: 'Show Subtitle',
    initialValue: true,
  );

  final showImage = context.knobs.boolean(
    label: 'Show Image',
    initialValue: true,
  );

  final code =
      '''AtomixHero(
  title: 'Build Amazing Apps',${showSubtitle ? "\n  subtitle: 'GET STARTED'," : ''}
  description: 'Create beautiful, responsive applications with Atomix Design System.',
  actions: [
    AtomixButton(
      label: 'Get Started',
      onPressed: () {},
      variant: AtomixButtonVariant.primary,
    ),
    AtomixButton(
      label: 'Learn More',
      onPressed: () {},
      variant: AtomixButtonVariant.secondary,
    ),
  ],${showImage ? '\n  image: YourImageWidget(),' : ''}
)''';

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AtomixHero(
          title: 'Build Amazing Apps',
          subtitle: showSubtitle ? 'GET STARTED' : null,
          description:
              'Create beautiful, responsive applications with Atomix Design System. Fast, flexible, and fully customizable.',
          actions: [
            AtomixButton(
              label: 'Get Started',
              onPressed: () {},
              variant: AtomixButtonVariant.primary,
            ),
            AtomixButton(
              label: 'Learn More',
              onPressed: () {},
              variant: AtomixButtonVariant.secondary,
            ),
          ],
          image: showImage
              ? Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(child: Icon(Icons.image, size: 64)),
                )
              : null,
        ),
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

@widgetbook.UseCase(
  name: 'Product Launch',
  path: '[Organisms]/Hero',
  type: AtomixHero,
)
Widget atomixHeroProductLaunch(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        AtomixHero(
          title: 'Introducing Pro Plan',
          subtitle: 'NEW',
          description:
              'Unlock advanced features and take your productivity to the next level with our Pro Plan.',
          actions: [
            AtomixButton(
              label: 'Upgrade Now',
              onPressed: () {},
              variant: AtomixButtonVariant.primary,
            ),
            AtomixButton(
              label: 'Compare Plans',
              onPressed: () {},
              variant: AtomixButtonVariant.tertiary,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: const CodeSnippet(
            code: '''AtomixHero(
  title: 'Introducing Pro Plan',
  subtitle: 'NEW',
  description: 'Unlock advanced features and take your productivity to the next level.',
  actions: [
    AtomixButton(label: 'Upgrade Now', onPressed: () {}, variant: AtomixButtonVariant.primary),
    AtomixButton(label: 'Compare Plans', onPressed: () {}, variant: AtomixButtonVariant.tertiary),
  ],
)''',
          ),
        ),
      ],
    ),
  );
}
