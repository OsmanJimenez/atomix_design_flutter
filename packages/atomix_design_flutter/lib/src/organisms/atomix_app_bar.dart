import 'package:flutter/material.dart';
import '../theme/atomix_theme.dart';

/// Atomix app bar component.
///
/// A Material Design app bar with Atomix design tokens.
/// Provides consistent navigation and branding across the application.
///
/// Example:
/// ```dart
/// AtomixAppBar(
///   title: 'Home',
///   leading: Icons.menu,
///   onLeadingPressed: () => print('Menu'),
///   actions: [
///     IconButton(icon: Icon(Icons.search), onPressed: () {}),
///   ],
/// )
/// ```
class AtomixAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates an Atomix app bar.
  const AtomixAppBar({
    super.key,
    required this.title,
    this.leading,
    this.onLeadingPressed,
    this.actions,
    this.centerTitle = false,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
  });

  /// The title text displayed in the app bar.
  final String title;

  /// Optional leading icon (typically menu or back).
  final IconData? leading;

  /// Called when the leading icon is pressed.
  final VoidCallback? onLeadingPressed;

  /// Actions to display at the end of the app bar.
  final List<Widget>? actions;

  /// Whether the title should be centered.
  final bool centerTitle;

  /// The elevation of the app bar.
  final double? elevation;

  /// Optional background color override.
  final Color? backgroundColor;

  /// Optional foreground color override.
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    return AppBar(
      title: Text(title, style: theme.typography.headlineSmall),
      centerTitle: centerTitle,
      elevation: elevation ?? 0,
      scrolledUnderElevation: elevation,
      backgroundColor: backgroundColor ?? theme.colors.background,
      foregroundColor: foregroundColor ?? theme.colors.textPrimary,
      leading: leading != null
          ? IconButton(icon: Icon(leading), onPressed: onLeadingPressed)
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
