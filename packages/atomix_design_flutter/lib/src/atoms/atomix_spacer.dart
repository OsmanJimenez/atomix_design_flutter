import 'package:flutter/material.dart';
import '../foundation/atomix_spacing.dart';

/// Atomix spacer component.
///
/// A wrapper around SizedBox that uses Atomix spacing tokens.
/// Provides consistent spacing across the design system.
///
/// Example:
/// ```dart
/// Column(
///   children: [
///     Text('First'),
///     AtomixSpacer.md(),
///     Text('Second'),
///   ],
/// )
/// ```
class AtomixSpacer extends StatelessWidget {
  /// Creates an Atomix spacer with custom dimensions.
  const AtomixSpacer({super.key, this.width, this.height});

  /// Creates an extra extra small spacer (4px).
  const AtomixSpacer.xxs({super.key})
    : width = null,
      height = AtomixSpacing.xxs;

  /// Creates an extra small spacer (8px).
  const AtomixSpacer.xs({super.key}) : width = null, height = AtomixSpacing.xs;

  /// Creates a small spacer (12px).
  const AtomixSpacer.sm({super.key}) : width = null, height = AtomixSpacing.sm;

  /// Creates a medium spacer (16px).
  const AtomixSpacer.md({super.key}) : width = null, height = AtomixSpacing.md;

  /// Creates a large spacer (20px).
  const AtomixSpacer.lg({super.key}) : width = null, height = AtomixSpacing.lg;

  /// Creates an extra large spacer (24px).
  const AtomixSpacer.xl({super.key}) : width = null, height = AtomixSpacing.xl;

  /// Creates an extra extra large spacer (32px).
  const AtomixSpacer.xxl({super.key})
    : width = null,
      height = AtomixSpacing.xxl;

  /// Creates an extra extra extra large spacer (40px).
  const AtomixSpacer.xxxl({super.key})
    : width = null,
      height = AtomixSpacing.xxxl;

  /// Creates a horizontal spacer with the specified width.
  const AtomixSpacer.horizontal(double width, {super.key})
    : width = width,
      height = null;

  /// Creates a vertical spacer with the specified height.
  const AtomixSpacer.vertical(double height, {super.key})
    : width = null,
      height = height;

  /// The width of the spacer.
  final double? width;

  /// The height of the spacer.
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height);
  }
}
