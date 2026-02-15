import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixPricingCard extends StatelessWidget {
  final String title;
  final String price;
  final String period;
  final List<String> features;
  final VoidCallback? onSelect;
  final bool isPopular;
  final String? buttonLabel;

  const AtomixPricingCard({
    super.key,
    required this.title,
    required this.price,
    required this.period,
    required this.features,
    this.onSelect,
    this.isPopular = false,
    this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isPopular ? theme.colors.primary : theme.colors.border,
          width: isPopular ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(16),
        color: theme.colors.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isPopular)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: theme.colors.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: Text(
                'POPULAR',
                style: theme.typography.labelSmall.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.typography.titleLarge.copyWith(
                    color: theme.colors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$',
                      style: theme.typography.titleMedium.copyWith(
                        color: theme.colors.textPrimary,
                      ),
                    ),
                    Text(
                      price,
                      style: theme.typography.displaySmall.copyWith(
                        color: theme.colors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        '/$period',
                        style: theme.typography.bodyMedium.copyWith(
                          color: theme.colors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ...features.map(
                  (feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 20,
                          color: theme.colors.success,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            feature,
                            style: theme.typography.bodyMedium.copyWith(
                              color: theme.colors.textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                AtomixButton(
                  label: buttonLabel ?? 'Select Plan',
                  onPressed: onSelect,
                  variant: isPopular
                      ? AtomixButtonVariant.primary
                      : AtomixButtonVariant.secondary,
                  fullWidth: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
