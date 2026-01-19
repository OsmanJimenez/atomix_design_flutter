import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A specialized component for displaying currency and prices.
class AtomixPriceText extends StatelessWidget {
  /// The numeric price value.
  final double price;

  /// The currency symbol.
  final String currency;

  /// Whether to show the currency symbol before or after.
  final bool symbolBefore;

  /// Number of decimal places.
  final int decimalPlaces;

  /// Style for the price text.
  final TextStyle? style;

  /// Style specifically for the currency symbol.
  final TextStyle? symbolStyle;

  /// Custom color for the price.
  final Color? color;

  /// Custom color for the symbol.
  final Color? symbolColor;

  const AtomixPriceText({
    super.key,
    required this.price,
    this.currency = '\$',
    this.symbolBefore = true,
    this.decimalPlaces = 2,
    this.style,
    this.symbolStyle,
    this.color,
    this.symbolColor,
  });

  @override
  Widget build(BuildContext context) {
    final formattedPrice = price.toStringAsFixed(decimalPlaces);

    final pricePart = AtomixText(
      formattedPrice,
      style:
          style ??
          Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: color ?? AtomixColors.textPrimary,
          ),
    );

    final finalSymbolColor = symbolColor ?? color ?? AtomixColors.textSecondary;

    final symbolPart = AtomixText(
      currency,
      style:
          symbolStyle ??
          (style ?? Theme.of(context).textTheme.titleLarge)?.copyWith(
            fontWeight: FontWeight.w400,
            color: finalSymbolColor,
            fontSize: (style?.fontSize ?? 20) * 0.7,
          ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        if (symbolBefore) ...[symbolPart, const SizedBox(width: 2)],
        pricePart,
        if (!symbolBefore) ...[const SizedBox(width: 2), symbolPart],
      ],
    );
  }
}
