import 'package:flutter/material.dart';
import '../theme/atomix_theme.dart';

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
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The visual variant of the card.
  final AtomixCardVariant variant;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// Optional background color override.
  final Color? backgroundColor;

  /// Optional elevation override.
  final double? elevation;

  /// Optional border radius override.
  final BorderRadius? borderRadius;

  double _getElevation() {
    switch (variant) {
      case AtomixCardVariant.filled:
        return 0; // Filled usually has 0 elevation but distinct color
      case AtomixCardVariant.outlined:
        return 0;
      case AtomixCardVariant.elevated:
        return 2; // Standard elevation
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    // Use theme.colors for default background if not provided
    // Filled: Surface Variant (or similar)
    // Outlined: Surface (transparent)
    // Elevated: Surface
    Color? defaultColor;
    if (variant == AtomixCardVariant.filled) {
      defaultColor = theme.colors.border.withValues(
        alpha: 0.1,
      ); // Placeholder for surface variant
    } else {
      defaultColor = theme.colors.background;
    }

    final card = Card(
      elevation: elevation ?? _getElevation(),
      color: backgroundColor ?? defaultColor,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.all(theme.radius.md),
        side: variant == AtomixCardVariant.outlined
            ? BorderSide(color: theme.colors.outline)
            : BorderSide.none,
      ),
      child: child,
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.all(theme.radius.md),
        child: card,
      );
    }

    return card;
  }
}
