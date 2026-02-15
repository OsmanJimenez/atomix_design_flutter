import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Templates]/Landing',
  type: AtomixLandingTemplate,
)
Widget atomixLandingTemplatePlayground(BuildContext context) {
  final heroTitle = context.knobs.string(
    label: 'Hero Title',
    initialValue: 'Build Amazing Apps',
  );

  final code =
      '''AtomixLandingTemplate(
  hero: AtomixHero(
    title: '$heroTitle',
    subtitle: 'GET STARTED',
    actions: [
      AtomixButton(label: 'Get Started', onPressed: () {}),
    ],
  ),
  sections: [FeaturesSection()],
  footer: AtomixFooter(copyright: '© 2024'),
)''';

  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: AtomixLandingTemplate(
            hero: AtomixHero(
              title: heroTitle,
              subtitle: 'GET STARTED',
              description:
                  'Create beautiful, responsive applications with Atomix Design System.',
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
            ),
            sections: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 48,
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    const Text(
                      'Our Features',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: List.generate(
                        3,
                        (index) => SizedBox(
                          width: 300,
                          child: AtomixCard(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.flash_on,
                                    size: 48,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Feature ${index + 1}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'A brief description of this powerful feature.',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            footer: const AtomixFooter(
              copyright: '© 2024 Atomix Design',
              sections: [
                AtomixFooterSection(
                  title: 'Support',
                  links: [
                    AtomixFooterLink(label: 'Help Center'),
                    AtomixFooterLink(label: 'Contact'),
                  ],
                ),
              ],
            ),
          ),
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
  name: 'Product Page',
  path: '[Templates]/Landing',
  type: AtomixLandingTemplate,
)
Widget atomixLandingTemplateProduct(BuildContext context) {
  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: AtomixLandingTemplate(
            hero: const AtomixHero(
              title: 'Atomix Headphones Pro',
              subtitle: 'PRE-ORDER NOW',
              description:
                  'The future of sound is here. Active noise cancelling and 40-hour battery life.',
              actions: [
                AtomixButton(
                  label: 'Pre-order',
                  variant: AtomixButtonVariant.primary,
                  onPressed: null,
                ),
              ],
            ),
            sections: [
              const Padding(
                padding: EdgeInsets.all(48),
                child: Center(
                  child: AtomixPricingCard(
                    title: 'Pro Bundle',
                    price: '299',
                    period: 'year',
                    features: [
                      'Headphones',
                      'Case',
                      'Cable',
                      '2-Year Warranty',
                    ],
                  ),
                ),
              ),
            ],
            footer: const AtomixFooter(
              copyright: '© 2024 Atomix Audio',
              sections: [],
            ),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(24),
        child: const CodeSnippet(
          code: '''AtomixLandingTemplate(
  hero: AtomixHero(title: 'Headphones Pro'),
  sections: [AtomixPricingCard(...)],
  footer: AtomixFooter(...),
)''',
        ),
      ),
    ],
  );
}
