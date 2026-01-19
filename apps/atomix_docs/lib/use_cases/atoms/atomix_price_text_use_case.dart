import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/PriceText',
  type: AtomixPriceText,
)
Widget priceTextPlayground(BuildContext context) {
  final price = context.knobs.double.slider(
    label: 'Price > Value',
    min: 0,
    max: 10000,
    initialValue: 1299.99,
  );

  final currency = context.knobs.string(
    label: 'Price > Currency',
    initialValue: '\$',
  );

  final symbolBefore = context.knobs.boolean(
    label: 'Price > Symbol Before',
    initialValue: true,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Color',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            AtomixColors.success,
            AtomixColors.error,
            AtomixColors.primary,
            AtomixColors.textPrimary,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  String colorName(Color? c) {
    if (c == AtomixColors.primary) return 'AtomixColors.primary';
    if (c == AtomixColors.success) return 'AtomixColors.success';
    if (c == AtomixColors.error) return 'AtomixColors.error';
    if (c == AtomixColors.textPrimary) return 'AtomixColors.textPrimary';
    return 'null';
  }

  final colorStr = foundationColor != null
      ? '\n  color: ${colorName(foundationColor)},'
      : '';

  final code =
      '''AtomixPriceText(
  price: $price,
  currency: '$currency',
  symbolBefore: $symbolBefore,$colorStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixPriceText(
            price: price,
            currency: currency,
            symbolBefore: symbolBefore,
            color: foundationColor,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'USD Format',
  path: '[Atoms]/PriceText',
  type: AtomixPriceText,
)
Widget priceTextUSD(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixPriceText(price: 49.99, currency: '\$', symbolBefore: true),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixPriceText(
  price: 49.99,
  currency: '\$',
  symbolBefore: true,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Euro Format',
  path: '[Atoms]/PriceText',
  type: AtomixPriceText,
)
Widget priceTextEuro(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixPriceText(price: 1250.00, currency: '€', symbolBefore: false),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixPriceText(
  price: 1250.00,
  currency: '€',
  symbolBefore: false,
)''',
        ),
      ],
    ),
  );
}
