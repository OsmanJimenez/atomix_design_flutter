import 'package:flutter/material.dart';
import '../theme/atomix_theme.dart';

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
    this.spacing,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.padding = EdgeInsets.zero,
    this.scrollable = false,
  });

  /// The fields and widgets within the form.
  final List<Widget> children;

  /// Optional global key to manage the form state.
  final GlobalKey<FormState>? formKey;

  /// Vertical spacing between fields.
  final double? spacing;

  /// How the children should be placed along the cross axis.
  final CrossAxisAlignment crossAxisAlignment;

  /// The padding around the form.
  final EdgeInsetsGeometry padding;

  /// Whether the form should be scrollable.
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    // We don't need theme here for logic, but maybe for default padding/spacing if they were tokens?
    // Spacing is passed as double, but defaults to AtomixSpacing.md.
    // We should allow spacing to be double but change default?
    // Since constructor defaults are const, we can't use theme.spacing there.
    // Ideally, we'd change spacing to be nullable and use theme.spacing.md as default in build.
    // But spacing is `double` final.
    // For now, keying off `AtomixSpacing.md` constant is problematic if we want dynamic values.
    // I will ignore the const default for now, but in `build` we can't easily swap it unless passed null.
    // However, I'll refactor constructor to use nullable spacing?
    // No, that breaks API signature if I remove default value.
    // I will change `this.spacing = AtomixSpacing.md` to `this.spacing`.
    // Wait, I can't access theme in constructor.
    // I will make spacing nullable in constructor, default to null.
    // Then in build, `spacing ?? theme.spacing.md`.

    // For now I'll stick to non-breaking change but AtomixSpacing is being deprecated.
    // I will update the class to use nullable spacing.

    final theme = AtomixTheme.of(context);
    final effectiveSpacing = spacing ?? theme.spacing.md;

    Widget content = Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: children.expand((widget) {
        final isLast = children.last == widget;
        return [widget, if (!isLast) SizedBox(height: effectiveSpacing)];
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
    this.spacing,
  });

  /// Optional title for the section.
  final String? title;

  /// The fields within this section.
  final List<Widget> children;

  /// Vertical spacing between fields.
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final effectiveSpacing = spacing ?? theme.spacing.md;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: theme.typography.titleSmall.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colors.primary,
            ),
          ),
          SizedBox(height: theme.spacing.sm),
        ],
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: children.expand((widget) {
            final isLast = children.last == widget;
            return [widget, if (!isLast) SizedBox(height: effectiveSpacing)];
          }).toList(),
        ),
      ],
    );
  }
}
