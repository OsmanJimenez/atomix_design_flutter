import 'package:flutter/material.dart';
import '../theme/atomix_theme.dart';

/// Atomix bottom sheet component.
///
/// A Material Design bottom sheet with Atomix design tokens.
/// Provides a consistent way to display bottom sheets.
///
/// Example:
/// ```dart
/// showModalBottomSheet(
///   context: context,
///   builder: (context) => AtomixBottomSheet(
///     title: 'Options',
///     child: Column(
///       children: [
///         ListTile(title: Text('Option 1')),
///         ListTile(title: Text('Option 2')),
///       ],
///     ),
///   ),
/// )
/// ```
class AtomixBottomSheet extends StatelessWidget {
  /// Creates an Atomix bottom sheet.
  const AtomixBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.showHandle = true,
    this.backgroundColor,
    this.borderRadius,
  });

  /// The content of the bottom sheet.
  final Widget child;

  /// Optional title displayed at the top of the bottom sheet.
  final String? title;

  /// Whether to show the drag handle.
  final bool showHandle;

  /// Optional background color override.
  final Color? backgroundColor;

  /// Optional border radius override.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colors.background,
        borderRadius:
            borderRadius ?? BorderRadius.vertical(top: theme.radius.lg),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (showHandle)
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: theme.spacing.sm),
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colors.textSecondary.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.all(theme.radius.full),
                ),
              ),
            ),
          if (title != null)
            Padding(
              padding: EdgeInsets.fromLTRB(
                theme.spacing.xl,
                showHandle ? 0 : theme.spacing.xl,
                theme.spacing.xl,
                theme.spacing.md,
              ),
              child: Text(
                title!,
                style: theme.typography.headlineSmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
