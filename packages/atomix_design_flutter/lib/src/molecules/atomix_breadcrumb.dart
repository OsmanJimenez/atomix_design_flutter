import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixBreadcrumb extends StatelessWidget {
  final List<AtomixBreadcrumbItem> items;
  final Widget? separator;

  const AtomixBreadcrumb({super.key, required this.items, this.separator});

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final effectiveSeparator =
        separator ??
        Icon(Icons.chevron_right, size: 16, color: theme.colors.textDisabled);

    final List<Widget> children = [];

    for (int i = 0; i < items.length; i++) {
      children.add(items[i]);
      if (i < items.length - 1) {
        children.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: effectiveSeparator,
          ),
        );
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}
