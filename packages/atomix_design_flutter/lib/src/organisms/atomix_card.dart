import 'package:flutter/material.dart';
import '../foundation/atomix_elevation.dart';
import '../foundation/atomix_radius.dart';

/// Card variant types.
enum AtomixCardVariant {
  /// Default filled card
  filled,

  /// Outlined card with border
  outlined,

  /// Elevated card with shadow
  elevated,
}

/// Atomix card component.
///
/// A Material Design card with Atomix design tokens.
/// Supports multiple variants for different visual styles.
///
/// Example:
/// ```dart
/// AtomixCard(
///   variant: AtomixCardVariant.elevated,
///   child: Padding(
///     padding: EdgeInsets.all(16),
///     child: Text('Card content'),
///   ),
/// )
/// ```
class AtomixCard extends StatelessWidget {
  /// Creates an Atomix card.
  const AtomixCard({
    super.key,
    required this.child,
    this.variant = AtomixCardVariant.filled,
    this.onTap,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The visual variant of the card.
  final AtomixCardVariant variant;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  double _getElevation() {
    switch (variant) {
      case AtomixCardVariant.filled:
        return AtomixElevation.xs;
      case AtomixCardVariant.outlined:
        return AtomixElevation.none;
      case AtomixCardVariant.elevated:
        return AtomixElevation.md;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final card = Card(
      elevation: _getElevation(),
      shape: RoundedRectangleBorder(
        borderRadius: AtomixRadius.mdBorderRadius,
        side: variant == AtomixCardVariant.outlined
            ? BorderSide(color: colorScheme.outline)
            : BorderSide.none,
      ),
      child: child,
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: AtomixRadius.mdBorderRadius,
        child: card,
      );
    }

    return card;
  }
}
