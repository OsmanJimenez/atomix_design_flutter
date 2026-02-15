import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixProductCard extends StatelessWidget {
  final String title;
  final String? description;
  final String price;
  final String? imageUrl;
  final Widget? image;
  final double? rating;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;

  const AtomixProductCard({
    super.key,
    required this.title,
    this.description,
    required this.price,
    this.imageUrl,
    this.image,
    this.rating,
    this.onTap,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.colors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: theme.colors.surfaceVariant,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(11),
                  topRight: Radius.circular(11),
                ),
              ),
              child:
                  image ??
                  Center(
                    child: Icon(
                      Icons.image,
                      size: 48,
                      color: theme.colors.textDisabled,
                    ),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.typography.titleMedium.copyWith(
                      color: theme.colors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      description!,
                      style: theme.typography.bodySmall.copyWith(
                        color: theme.colors.textSecondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 12),
                  if (rating != null)
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: theme.colors.warning),
                        const SizedBox(width: 4),
                        Text(
                          rating!.toStringAsFixed(1),
                          style: theme.typography.bodySmall.copyWith(
                            color: theme.colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$$price',
                        style: theme.typography.titleLarge.copyWith(
                          color: theme.colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (onAddToCart != null)
                        IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          onPressed: onAddToCart,
                          color: theme.colors.primary,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
