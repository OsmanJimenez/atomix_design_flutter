import 'package:flutter/material.dart';
import '../foundation/atomix_spacing.dart';
import '../foundation/atomix_radius.dart';

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

  EdgeInsets _getPadding() {
    switch (size) {
      case AtomixButtonSize.sm:
        return const EdgeInsets.symmetric(
          horizontal: AtomixSpacing.md,
          vertical: AtomixSpacing.xs,
        );
      case AtomixButtonSize.md:
        return const EdgeInsets.symmetric(
          horizontal: AtomixSpacing.xl,
          vertical: AtomixSpacing.sm,
        );
      case AtomixButtonSize.lg:
        return const EdgeInsets.symmetric(
          horizontal: AtomixSpacing.xxl,
          vertical: AtomixSpacing.md,
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

  Widget _buildButtonContent(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: _getIconSize(),
        height: _getIconSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == AtomixButtonVariant.tertiary
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: _getIconSize()),
          const SizedBox(width: AtomixSpacing.xs),
          Text(label),
        ],
      );
    }

    return Text(label);
  }

  @override
  Widget build(BuildContext context) {
    final content = _buildButtonContent(context);
    final padding = _getPadding();
    final isDisabled = onPressed == null || isLoading;

    Widget button;

    switch (variant) {
      case AtomixButtonVariant.primary:
        button = FilledButton(
          onPressed: isDisabled ? null : onPressed,
          style: FilledButton.styleFrom(
            padding: padding,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? AtomixRadius.mdBorderRadius,
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
            side: backgroundColor != null
                ? BorderSide(color: backgroundColor!)
                : null,
            foregroundColor: foregroundColor ?? backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? AtomixRadius.mdBorderRadius,
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
            foregroundColor: foregroundColor ?? backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? AtomixRadius.smBorderRadius,
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
