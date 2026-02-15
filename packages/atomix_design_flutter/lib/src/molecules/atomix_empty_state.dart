import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixEmptyState extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? description;
  final Widget? action;

  const AtomixEmptyState({
    super.key,
    this.icon,
    required this.title,
    this.description,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 64, color: theme.colors.textDisabled),
              const SizedBox(height: 16),
            ],
            Text(
              title,
              style: theme.typography.titleLarge.copyWith(
                color: theme.colors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            if (description != null) ...[
              const SizedBox(height: 8),
              Text(
                description!,
                style: theme.typography.bodyMedium.copyWith(
                  color: theme.colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[const SizedBox(height: 24), action!],
          ],
        ),
      ),
    );
  }
}
