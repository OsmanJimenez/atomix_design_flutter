import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// An individual item for a Breadcrumb navigation.
class AtomixBreadcrumbItem extends StatelessWidget {
  /// The label to display.
  final String label;

  /// Called when the item is tapped.
  final VoidCallback? onTap;

  /// Whether this is the current (last) item.
  final bool isLast;

  /// Custom color for the breadcrumb item.
  final Color? color;

  const AtomixBreadcrumbItem({
    super.key,
    required this.label,
    this.onTap,
    this.isLast = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    return AtomixLink(
      text: label,
      onTap: isLast ? null : onTap,
      color:
          color ?? (isLast ? theme.colors.textPrimary : theme.colors.primary),
      style: TextStyle(
        fontWeight: isLast ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
