import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Data & Text Atoms',
  path: '[Atoms]',
  type: AtomixPriceText,
)
Widget dataTextUseCase(BuildContext context) {
  final price = context.knobs.double.slider(
    label: 'Price',
    min: 0,
    max: 1000,
    initialValue: 49.99,
  );

  final counterValue = context.knobs.double
      .slider(label: 'Counter Count', min: 0, max: 150, initialValue: 12)
      .toInt();

  final ratingValue = context.knobs.double.slider(
    label: 'Rating',
    min: 0,
    max: 5,
    initialValue: 4.5,
  );

  return SingleChildScrollView(
    padding: const EdgeInsets.all(AtomixSpacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AtomixText(
          'Data & Text Atoms',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.md(),
        const AtomixText(
          'Specialized atoms for displaying data formats like prices, links, counters, and ratings.',
        ),
        const AtomixSpacer.xl(),

        // Price
        const AtomixText(
          'AtomixPriceText',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.sm(),
        AtomixPriceText(price: price),
        const AtomixSpacer.lg(),

        // Link
        const AtomixText(
          'AtomixLink',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.sm(),
        AtomixLink(text: 'Click here for more details', onTap: () {}),
        const AtomixSpacer.lg(),

        // Counter
        const AtomixText(
          'AtomixCounter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.sm(),
        AtomixCounter(count: counterValue),
        const AtomixSpacer.lg(),

        // Rating
        const AtomixText(
          'AtomixRating',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.sm(),
        AtomixRating(rating: ratingValue),

        const AtomixSpacer.xl(),
        CodeSnippet(
          code:
              '''// Price
AtomixPriceText(price: $price)

// Link
AtomixLink(text: 'Click here', onTap: () {})

// Counter
AtomixCounter(count: $counterValue)

// Rating
AtomixRating(rating: $ratingValue)''',
        ),
      ],
    ),
  );
}
