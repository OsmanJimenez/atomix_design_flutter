import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixTimelineItem extends StatelessWidget {
  final String title;
  final String? description;
  final DateTime? timestamp;
  final Widget? icon;
  final bool isFirst;
  final bool isLast;
  final Color? dotColor;

  const AtomixTimelineItem({
    super.key,
    required this.title,
    this.description,
    this.timestamp,
    this.icon,
    this.isFirst = false,
    this.isLast = false,
    this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final effectiveDotColor = dotColor ?? theme.colors.primary;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator column
          SizedBox(
            width: 40,
            child: Column(
              children: [
                if (!isFirst)
                  Expanded(
                    child: Container(width: 2, color: theme.colors.border),
                  ),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: effectiveDotColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: theme.colors.surface, width: 2),
                  ),
                  child: icon != null ? Center(child: icon!) : null,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: theme.colors.border),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.typography.titleMedium.copyWith(
                      color: theme.colors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (timestamp != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      _formatTimestamp(timestamp!),
                      style: theme.typography.bodySmall.copyWith(
                        color: theme.colors.textSecondary,
                      ),
                    ),
                  ],
                  if (description != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      description!,
                      style: theme.typography.bodyMedium.copyWith(
                        color: theme.colors.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime dt) {
    return '${dt.day}/${dt.month}/${dt.year} ${dt.hour}:${dt.minute.toString().padLeft(2, '0')}';
  }
}
