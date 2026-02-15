import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

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

  final theme = AtomixTheme.of(context);

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            theme.colors.success,
            theme.colors.error,
            theme.colors.primary,
            theme.colors.textPrimary,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.success) return 'Success';
            if (c == theme.colors.error) return 'Error';
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.textPrimary) return 'Text Primary';
            return 'Custom';
          },
        )
      : null;

  String colorName(Color? c) {
    if (c == theme.colors.primary) return 'theme.colors.primary';
    if (c == theme.colors.success) return 'theme.colors.success';
    if (c == theme.colors.error) return 'theme.colors.error';
    if (c == theme.colors.textPrimary) return 'theme.colors.textPrimary';
    return 'null';
  }

  final colorStr = foundationColor != null
      ? '\n  color: ${colorName(foundationColor)},'
      : '';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixPriceText(
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
