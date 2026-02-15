import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Templates]/Detail',
  type: AtomixDetailTemplate,
)
Widget atomixDetailTemplatePlayground(BuildContext context) {
  final title = context.knobs.string(
    label: 'Header Title',
    initialValue: 'Product Snapshot',
  );

  final code =
      '''AtomixDetailTemplate(
  header: HeroHeader(title: '$title'),
  sections: [
    DetailCard(title: 'Overview'),
    DetailCard(title: 'Features'),
  ],
)''';

  return Column(
    children: [
      Expanded(
        child: AtomixDetailTemplate(
          header: Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.blue.shade600],
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          sections: [
            const AtomixCard(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'General Overview',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Detailed information about the selected item goes here.',
                    ),
                  ],
                ),
              ),
            ),
            AtomixCard(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Actions',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        AtomixButton(
                          label: 'Edit',
                          onPressed: null,
                          variant: AtomixButtonVariant.secondary,
                        ),
                        SizedBox(width: 12),
                        AtomixButton(
                          label: 'Delete',
                          onPressed: null,
                          variant: AtomixButtonVariant.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
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
  name: 'Product Details',
  path: '[Templates]/Detail',
  type: AtomixDetailTemplate,
)
Widget atomixDetailTemplateProduct(BuildContext context) {
  return Column(
    children: [
      const Expanded(
        child: AtomixDetailTemplate(
          header: AtomixHero(
            title: 'Wireless Headphones',
            subtitle: 'PREMIUM AUDIO',
            description:
                'Experience crystal clear sound with noise-cancelling technology.',
            actions: [
              AtomixButton(
                label: 'Add to Cart',
                variant: AtomixButtonVariant.primary,
                onPressed: null,
              ),
            ],
          ),
          sections: [
            AtomixCard(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'These headphones feature high-fidelity audio drivers and a lightweight ergonomic design.',
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(24),
        child: const CodeSnippet(
          code: '''AtomixDetailTemplate(
  header: AtomixHero(...),
  sections: [
    AtomixCard(child: Text('...')),
  ],
)''',
        ),
      ),
    ],
  );
}
