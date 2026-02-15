import 'package:flutter/material.dart';
import '../theme/atomix_theme.dart';
import '../theme/atomix_theme_data.dart';
// import '../foundation/atomix_spacing.dart'; // Replaced by tokens
// import '../foundation/atomix_radius.dart'; // Replaced by tokens

/// Button size variants.
enum AtomixButtonSize {
  /// Small button
  sm,

  /// Medium button (default)
  md,

  /// Large button
  lg,
}

/// Button style variants.
enum AtomixButtonVariant {
  /// Primary filled button
  primary,

  /// Secondary outlined button
  secondary,

  /// Tertiary text button
  tertiary,
}

/// Atomix button component.
///
/// A versatile button component with multiple variants, sizes, and states.
/// Built on top of Material buttons with Atomix design tokens.
///
/// Example:
/// ```dart
/// AtomixButton(
///   label: 'Click me',
///   onPressed: () => print('Clicked'),
///   variant: AtomixButtonVariant.primary,
///   size: AtomixButtonSize.md,
/// )
/// ```
class AtomixButton extends StatelessWidget {
  /// Creates an Atomix button.
  const AtomixButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AtomixButtonVariant.primary,
    this.size = AtomixButtonSize.md,
    this.isLoading = false,
    this.icon,
    this.fullWidth = false,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
  });

  /// The text label for the button.
  final String label;

  /// Callback when the button is pressed.
  final VoidCallback? onPressed;

  /// The visual variant of the button.
  final AtomixButtonVariant variant;

  /// The size of the button.
  final AtomixButtonSize size;

  /// Whether the button is in loading state.
  final bool isLoading;

  /// Optional icon to display before the label.
  final IconData? icon;

  /// Whether the button should take full width.
  final bool fullWidth;

  /// Optional background color override.
  final Color? backgroundColor;

  /// Optional foreground color override.
  final Color? foregroundColor;

  /// Optional border radius override.
  final BorderRadius? borderRadius;

  EdgeInsets _getPadding(AtomixThemeData theme) {
    switch (size) {
      case AtomixButtonSize.sm:
        return EdgeInsets.symmetric(
          horizontal: theme.spacing.md,
          vertical: theme.spacing.xs,
        );
      case AtomixButtonSize.md:
        return EdgeInsets.symmetric(
          horizontal: theme.spacing.xl,
          vertical: theme.spacing.sm,
        );
      case AtomixButtonSize.lg:
        return EdgeInsets.symmetric(
          horizontal: theme.spacing.xxl,
          vertical: theme.spacing.md,
        );
    }
  }

  double _getIconSize() {
    switch (size) {
      case AtomixButtonSize.sm:
        return 16;
      case AtomixButtonSize.md:
        return 20;
      case AtomixButtonSize.lg:
        return 24;
    }
  }

  Widget _buildButtonContent(BuildContext context, AtomixThemeData theme) {
    if (isLoading) {
      return SizedBox(
        width: _getIconSize(),
        height: _getIconSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == AtomixButtonVariant.tertiary
                ? theme.colors.primary
                : theme.colors.onPrimary,
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: _getIconSize()),
          SizedBox(width: theme.spacing.xs),
          Text(label),
        ],
      );
    }

    return Text(label);
  }

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final content = _buildButtonContent(context, theme);
    final padding = _getPadding(theme);
    final isDisabled = onPressed == null || isLoading;

    Widget button;

    switch (variant) {
      case AtomixButtonVariant.primary:
        button = FilledButton(
          onPressed: isDisabled ? null : onPressed,
          style: FilledButton.styleFrom(
            padding: padding,
            backgroundColor: backgroundColor ?? theme.colors.primary,
            foregroundColor: foregroundColor ?? theme.colors.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.all(theme.radius.md),
            ),
          ),
          child: content,
        );
        break;

      case AtomixButtonVariant.secondary:
        button = OutlinedButton(
          onPressed: isDisabled ? null : onPressed,
          style: OutlinedButton.styleFrom(
            padding: padding,
            side: BorderSide(color: backgroundColor ?? theme.colors.primary),
            foregroundColor:
                foregroundColor ?? (backgroundColor ?? theme.colors.primary),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.all(theme.radius.md),
            ),
          ),
          child: content,
        );
        break;

      case AtomixButtonVariant.tertiary:
        button = TextButton(
          onPressed: isDisabled ? null : onPressed,
          style: TextButton.styleFrom(
            padding: padding,
            foregroundColor:
                foregroundColor ?? (backgroundColor ?? theme.colors.primary),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.all(theme.radius.sm),
            ),
          ),
          child: content,
        );
        break;
    }

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
