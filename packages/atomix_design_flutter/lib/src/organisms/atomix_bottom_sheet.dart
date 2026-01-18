import 'package:flutter/material.dart';
import '../foundation/atomix_spacing.dart';
import '../foundation/atomix_radius.dart';

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
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        borderRadius:
            borderRadius ??
            const BorderRadius.vertical(top: Radius.circular(AtomixRadius.lg)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (showHandle)
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: AtomixSpacing.sm),
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurfaceVariant.withOpacity(0.4),
                  borderRadius: AtomixRadius.fullBorderRadius,
                ),
              ),
            ),
          if (title != null)
            Padding(
              padding: EdgeInsets.fromLTRB(
                AtomixSpacing.xl,
                showHandle ? 0 : AtomixSpacing.xl,
                AtomixSpacing.xl,
                AtomixSpacing.md,
              ),
              child: Text(title!, style: textTheme.titleLarge),
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
