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

  const AtomixBreadcrumbItem({
    super.key,
    required this.label,
    this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AtomixLink(
          text: label,
          onTap: isLast ? null : onTap,
          style: TextStyle(
            fontWeight: isLast ? FontWeight.bold : FontWeight.normal,
            color: isLast ? AtomixColors.textPrimary : AtomixColors.primary,
          ),
        ),
        if (!isLast) ...[
          const AtomixSpacer.xs(),
          const AtomixText(
            '/',
            style: TextStyle(color: AtomixColors.textSecondary),
          ),
          const AtomixSpacer.xs(),
        ],
      ],
    );
  }
}
