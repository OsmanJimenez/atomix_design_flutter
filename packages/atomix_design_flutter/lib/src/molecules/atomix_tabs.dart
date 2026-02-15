import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixTabs extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final bool isScrollable;

  const AtomixTabs({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
    this.isScrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: isScrollable
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final title = entry.value;
          final isSelected = index == selectedIndex;

          return InkWell(
            onTap: () => onTabSelected(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected
                        ? theme.colors.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                title,
                style: theme.typography.labelLarge.copyWith(
                  color: isSelected
                      ? theme.colors.primary
                      : theme.colors.textSecondary,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
