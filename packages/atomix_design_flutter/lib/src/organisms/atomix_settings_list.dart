import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixSettingsList extends StatelessWidget {
  final List<AtomixSettingsGroup> groups;

  const AtomixSettingsList({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: groups.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final group = groups[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (group.title != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  group.title!,
                  style: theme.typography.labelLarge.copyWith(
                    color: theme.colors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            Container(
              decoration: BoxDecoration(
                color: theme.colors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.colors.border),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: group.items.length,
                separatorBuilder: (context, index) => const AtomixDivider(),
                itemBuilder: (context, itemIndex) {
                  final item = group.items[itemIndex];
                  return AtomixListTile(
                    title: item.title,
                    subtitle: item.subtitle,
                    leading: item.icon != null ? Icon(item.icon) : null,
                    trailing: item.trailing,
                    onTap: item.onTap,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class AtomixSettingsGroup {
  final String? title;
  final List<AtomixSettingsItem> items;

  const AtomixSettingsGroup({this.title, required this.items});
}

class AtomixSettingsItem {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Widget? trailing;
  final VoidCallback? onTap;

  const AtomixSettingsItem({
    required this.title,
    this.subtitle,
    this.icon,
    this.trailing,
    this.onTap,
  });
}
