import 'package:flutter/material.dart';
import '../foundation/atomix_spacing.dart';

/// Atomix grid component.
///
/// A responsive 12-column grid system for organizing content.
///
/// Example:
/// ```dart
/// AtomixGrid(
///   columns: 12, // Default
///   gutter: AtomixSpacing.md,
///   children: [
///     AtomixCol(
///       span: 6, // Takes half width
///       child: ...,
///     ),
///     AtomixCol(
///       span: 6,
///       child: ...,
///     ),
///   ],
/// )
/// ```
class AtomixGrid extends StatelessWidget {
  /// Creates an Atomix grid.
  const AtomixGrid({
    super.key,
    required this.children,
    this.columns = 12,
    this.gutter = AtomixSpacing.md,
    this.runSpacing = AtomixSpacing.md,
    this.alignment = WrapAlignment.start,
  });

  /// The list of grid columns.
  final List<AtomixCol> children;

  /// Total number of columns in the grid.
  final int columns;

  /// Horizontal spacing between columns.
  final double gutter;

  /// Vertical spacing between rows.
  final double runSpacing;

  /// How the columns should be placed along the main axis.
  final WrapAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;

        return Wrap(
          alignment: alignment,
          spacing: gutter,
          runSpacing: runSpacing,
          children: children.map((col) {
            // Adjust calculation for simpler Wrap usage
            // A more robust way is to calculate width based on item count in row
            // but for a variable span grid, we need proportional widths.

            // Proportional width calculation minus proportional gutter
            final itemWidth =
                (totalWidth / columns) * col.span -
                (gutter * (1 - col.span / columns));

            return SizedBox(width: itemWidth, child: col.child);
          }).toList(),
        );
      },
    );
  }
}

/// A column within an [AtomixGrid].
class AtomixCol {
  /// Creates an Atomix column.
  const AtomixCol({required this.child, this.span = 12});

  /// The widget content of the column.
  final Widget child;

  /// How many columns this item should span (1-12).
  final int span;
}
