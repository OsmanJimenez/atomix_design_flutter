import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/ProductCard',
  type: AtomixProductCard,
)
Widget atomixProductCardPlayground(BuildContext context) {
  final showRating = context.knobs.boolean(
    label: 'Show Rating',
    initialValue: true,
  );

  final code =
      '''AtomixProductCard(
  title: 'Wireless Headphones',
  description: 'Premium noise-cancelling headphones',
  price: '199.99',${showRating ? '\n  rating: 4.5,' : ''}
  onTap: () {},
  onAddToCart: () {},
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: AtomixProductCard(
              title: 'Wireless Headphones',
              description: 'Premium noise-cancelling headphones',
              price: '199.99',
              rating: showRating ? 4.5 : null,
              onTap: () {},
              onAddToCart: () {},
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
  name: 'Electronics',
  path: '[Organisms]/ProductCard',
  type: AtomixProductCard,
)
Widget atomixProductCardElectronics(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: AtomixProductCard(
              title: 'Smart Watch Pro',
              description: 'Fitness tracking, heart rate monitor, GPS',
              price: '299.00',
              rating: 4.8,
              onTap: () {},
              onAddToCart: () {},
            ),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixProductCard(
  title: 'Smart Watch Pro',
  description: 'Fitness tracking, heart rate monitor, GPS',
  price: '299.00',
  rating: 4.8,
  onTap: () {},
  onAddToCart: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Fashion',
  path: '[Organisms]/ProductCard',
  type: AtomixProductCard,
)
Widget atomixProductCardFashion(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: AtomixProductCard(
              title: 'Designer Sneakers',
              description: 'Limited edition, premium leather',
              price: '149.99',
              rating: 4.3,
              onTap: () {},
              onAddToCart: () {},
            ),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixProductCard(
  title: 'Designer Sneakers',
  description: 'Limited edition, premium leather',
  price: '149.99',
  rating: 4.3,
  onTap: () {},
  onAddToCart: () {},
)''',
          ),
        ],
      ),
    ),
  );
}
