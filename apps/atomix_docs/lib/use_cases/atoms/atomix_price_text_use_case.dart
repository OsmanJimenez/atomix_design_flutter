import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Price Text',
  type: AtomixPriceText,
)
Widget priceTextPlayground(BuildContext context) {
  final price = context.knobs.double.slider(
    label: 'Price > Amount',
    min: 0,
    max: 1000,
    initialValue: 49.99,
  );

  final symbolBefore = context.knobs.boolean(
    label: 'Price > Symbol Before',
    initialValue: true,
  );

  final code =
      '''AtomixPriceText(
  price: $price,
  symbolBefore: $symbolBefore,
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixPriceText(price: price, symbolBefore: symbolBefore),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'USD Format',
  path: '[Atoms]/Price Text',
  type: AtomixPriceText,
)
Widget priceTextUSD(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixPriceText(price: 1250.0),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixPriceText(price: 1250.0)'''),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Euro Format',
  path: '[Atoms]/Price Text',
  type: AtomixPriceText,
)
Widget priceTextEuro(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixPriceText(price: 24.99, currency: '€', symbolBefore: false),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixPriceText(
  price: 24.99,
  currency: '€',
  symbolBefore: false,
)''',
        ),
      ],
    ),
  );
}
