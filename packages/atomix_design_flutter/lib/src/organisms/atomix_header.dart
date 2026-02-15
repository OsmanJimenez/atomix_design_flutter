import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixHeader extends StatelessWidget {
  final String? title;
  final Widget? logo;
  final List<AtomixHeaderItem> items;
  final List<Widget>? actions;

  const AtomixHeader({
    super.key,
    this.title,
    this.logo,
    required this.items,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: theme.colors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (logo != null)
            logo!
          else if (title != null)
            Text(
              title!,
              style: theme.typography.titleLarge.copyWith(
                color: theme.colors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(width: 48),
          Expanded(
            child: Row(
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: InkWell(
                    onTap: item.onTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Text(
                        item.label,
                        style: theme.typography.bodyMedium.copyWith(
                          color: item.isActive
                              ? theme.colors.primary
                              : theme.colors.textPrimary,
                          fontWeight: item.isActive
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          if (actions != null) Row(children: actions!),
        ],
      ),
    );
  }
}

class AtomixHeaderItem {
  final String label;
  final VoidCallback? onTap;
  final bool isActive;

  const AtomixHeaderItem({
    required this.label,
    this.onTap,
    this.isActive = false,
  });
}
