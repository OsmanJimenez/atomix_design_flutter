import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/PricingCard',
  type: AtomixPricingCard,
)
Widget atomixPricingCardPlayground(BuildContext context) {
  final isPopular = context.knobs.boolean(
    label: 'Is Popular',
    initialValue: false,
  );

  final code =
      '''AtomixPricingCard(
  title: 'Pro Plan',
  price: '29',
  period: 'month',
  isPopular: $isPopular,
  features: [
    'Unlimited projects',
    '100GB storage',
    'Priority support',
    'Advanced analytics',
    'Custom domain',
  ],
  onSelect: () {},
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: AtomixPricingCard(
              title: 'Pro Plan',
              price: '29',
              period: 'month',
              isPopular: isPopular,
              features: const [
                'Unlimited projects',
                '100GB storage',
                'Priority support',
                'Advanced analytics',
                'Custom domain',
              ],
              onSelect: () {},
            ),
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
    ),
  );
}

@widgetbook.UseCase(
  name: 'Basic Plan',
  path: '[Organisms]/PricingCard',
  type: AtomixPricingCard,
)
Widget atomixPricingCardBasic(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: AtomixPricingCard(
              title: 'Basic',
              price: '9',
              period: 'month',
              features: const [
                '5 projects',
                '10GB storage',
                'Email support',
                'Basic analytics',
              ],
              onSelect: () {},
            ),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixPricingCard(
  title: 'Basic',
  price: '9',
  period: 'month',
  features: [
    '5 projects',
    '10GB storage',
    'Email support',
    'Basic analytics',
  ],
  onSelect: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Enterprise Plan',
  path: '[Organisms]/PricingCard',
  type: AtomixPricingCard,
)
Widget atomixPricingCardEnterprise(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: AtomixPricingCard(
              title: 'Enterprise',
              price: '99',
              period: 'month',
              isPopular: true,
              features: const [
                'Unlimited everything',
                '1TB storage',
                '24/7 phone support',
                'Advanced analytics',
                'Custom integrations',
                'Dedicated account manager',
              ],
              onSelect: () {},
            ),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixPricingCard(
  title: 'Enterprise',
  price: '99',
  period: 'month',
  isPopular: true,
  features: [
    'Unlimited everything',
    '1TB storage',
    '24/7 phone support',
    'Advanced analytics',
    'Custom integrations',
    'Dedicated account manager',
  ],
  onSelect: () {},
)''',
          ),
        ],
      ),
    ),
  );
}
