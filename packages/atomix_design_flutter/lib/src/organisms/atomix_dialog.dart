import 'package:flutter/material.dart';
import '../foundation/atomix_spacing.dart';
import '../foundation/atomix_radius.dart';

/// Atomix dialog component.
///
/// A Material Design dialog with Atomix design tokens.
/// Provides a consistent way to display modal dialogs.
///
/// Example:
/// ```dart
/// showDialog(
///   context: context,
///   builder: (context) => AtomixDialog(
///     title: 'Confirm',
///     content: 'Are you sure?',
///     actions: [
///       AtomixButton(
///         label: 'Cancel',
///         onPressed: () => Navigator.pop(context),
///         variant: AtomixButtonVariant.tertiary,
///       ),
///       AtomixButton(
///         label: 'Confirm',
///         onPressed: () => Navigator.pop(context),
///       ),
///     ],
///   ),
/// )
/// ```
class AtomixDialog extends StatelessWidget {
  /// Creates an Atomix dialog.
  const AtomixDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions = const [],
    this.icon,
    this.backgroundColor,
    this.borderRadius,
  });

  /// The title of the dialog.
  final String title;

  /// The content of the dialog.
  final String content;

  /// Actions to display at the bottom of the dialog.
  final List<Widget> actions;

  /// Optional icon to display above the title.
  final IconData? icon;

  /// Optional background color override.
  final Color? backgroundColor;

  /// Optional border radius override.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? AtomixRadius.lgBorderRadius,
      ),
      icon: icon != null ? Icon(icon, size: 32) : null,
      title: Text(title),
      content: Text(content),
      actions: actions.isEmpty
          ? null
          : [
              Padding(
                padding: const EdgeInsets.only(
                  right: AtomixSpacing.xs,
                  bottom: AtomixSpacing.xs,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (int i = 0; i < actions.length; i++) ...[
                      if (i > 0) const SizedBox(width: AtomixSpacing.xs),
                      actions[i],
                    ],
                  ],
                ),
              ),
            ],
    );
  }
}
