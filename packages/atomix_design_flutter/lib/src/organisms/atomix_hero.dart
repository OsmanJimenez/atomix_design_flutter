import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixHero extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? description;
  final Widget? image;
  final List<Widget>? actions;
  final Color? backgroundColor;

  const AtomixHero({
    super.key,
    required this.title,
    this.subtitle,
    this.description,
    this.image,
    this.actions,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colors.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (subtitle != null) ...[
                  Text(
                    subtitle!,
                    style: theme.typography.labelLarge.copyWith(
                      color: theme.colors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                Text(
                  title,
                  style: theme.typography.displayLarge.copyWith(
                    color: theme.colors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (description != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    description!,
                    style: theme.typography.bodyLarge.copyWith(
                      color: theme.colors.textSecondary,
                    ),
                  ),
                ],
                if (actions != null && actions!.isNotEmpty) ...[
                  const SizedBox(height: 32),
                  Wrap(spacing: 16, runSpacing: 16, children: actions!),
                ],
              ],
            ),
          ),
          if (image != null) ...[
            const SizedBox(width: 48),
            Expanded(child: image!),
          ],
        ],
      ),
    );
  }
}
