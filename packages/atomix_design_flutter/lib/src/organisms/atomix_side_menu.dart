import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixSideMenu extends StatelessWidget {
  final List<AtomixSideMenuItem> items;
  final String? header;
  final Widget? headerWidget;
  final Widget? footer;

  const AtomixSideMenu({
    super.key,
    required this.items,
    this.header,
    this.headerWidget,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Container(
      width: 280,
      color: theme.colors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (headerWidget != null)
            headerWidget!
          else if (header != null)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                header!,
                style: theme.typography.titleLarge.copyWith(
                  color: theme.colors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return _buildMenuItem(context, item, theme);
              },
            ),
          ),
          if (footer != null) footer!,
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    AtomixSideMenuItem item,
    AtomixThemeData theme,
  ) {
    return InkWell(
      onTap: item.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: item.isSelected ? theme.colors.primaryContainer : null,
        ),
        child: Row(
          children: [
            if (item.icon != null) ...[
              Icon(
                item.icon,
                size: 20,
                color: item.isSelected
                    ? theme.colors.primary
                    : theme.colors.textSecondary,
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                item.label,
                style: theme.typography.bodyMedium.copyWith(
                  color: item.isSelected
                      ? theme.colors.primary
                      : theme.colors.textPrimary,
                  fontWeight: item.isSelected
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
            if (item.badge != null) ...[
              const SizedBox(width: 8),
              AtomixBadge(
                label: item.badge!,
                variant: AtomixBadgeVariant.error,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class AtomixSideMenuItem {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isSelected;
  final String? badge;

  const AtomixSideMenuItem({
    required this.label,
    this.icon,
    this.onTap,
    this.isSelected = false,
    this.badge,
  });
}
