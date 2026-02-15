import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixStatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final String? trend;
  final bool isPositiveTrend;
  final Color? backgroundColor;

  const AtomixStatCard({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.trend,
    this.isPositiveTrend = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: theme.typography.labelMedium.copyWith(
                  color: theme.colors.textSecondary,
                ),
              ),
              if (icon != null)
                Icon(icon, size: 20, color: theme.colors.textSecondary),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.typography.displaySmall.copyWith(
              color: theme.colors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (trend != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  isPositiveTrend ? Icons.trending_up : Icons.trending_down,
                  size: 16,
                  color: isPositiveTrend
                      ? theme.colors.success
                      : theme.colors.error,
                ),
                const SizedBox(width: 4),
                Text(
                  trend!,
                  style: theme.typography.bodySmall.copyWith(
                    color: isPositiveTrend
                        ? theme.colors.success
                        : theme.colors.error,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
