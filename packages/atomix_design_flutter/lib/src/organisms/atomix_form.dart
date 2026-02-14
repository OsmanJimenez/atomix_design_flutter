import 'package:flutter/material.dart';
import '../foundation/atomix_spacing.dart';

/// Atomix form organism.
///
/// A layout organism that manages a group of fields with consistent vertical spacing.
///
/// Example:
/// ```dart
/// AtomixForm(
///   children: [
///     AtomixTextFormField(label: 'Name'),
///     AtomixTextFormField(label: 'Email'),
///     AtomixButton(label: 'Submit', onPressed: () {}),
///   ],
/// )
/// ```
class AtomixForm extends StatelessWidget {
  /// Creates an Atomix form.
  const AtomixForm({
    super.key,
    required this.children,
    this.formKey,
    this.spacing = AtomixSpacing.md,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.padding = EdgeInsets.zero,
    this.scrollable = false,
  });

  /// The fields and widgets within the form.
  final List<Widget> children;

  /// Optional global key to manage the form state.
  final GlobalKey<FormState>? formKey;

  /// Vertical spacing between fields.
  final double spacing;

  /// How the children should be placed along the cross axis.
  final CrossAxisAlignment crossAxisAlignment;

  /// The padding around the form.
  final EdgeInsetsGeometry padding;

  /// Whether the form should be scrollable.
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: children.expand((widget) {
        final isLast = children.last == widget;
        return [widget, if (!isLast) SizedBox(height: spacing)];
      }).toList(),
    );

    if (padding != EdgeInsets.zero) {
      content = Padding(padding: padding, child: content);
    }

    if (scrollable) {
      content = SingleChildScrollView(child: content);
    }

    return Form(key: formKey, child: content);
  }
}

/// A section within an [AtomixForm] for grouping related fields.
class AtomixFormSection extends StatelessWidget {
  /// Creates a form section.
  const AtomixFormSection({
    super.key,
    this.title,
    required this.children,
    this.spacing = AtomixSpacing.md,
  });

  /// Optional title for the section.
  final String? title;

  /// The fields within this section.
  final List<Widget> children;

  /// Vertical spacing between fields.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: AtomixSpacing.sm),
        ],
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: children.expand((widget) {
            final isLast = children.last == widget;
            return [widget, if (!isLast) SizedBox(height: spacing)];
          }).toList(),
        ),
      ],
    );
  }
}
