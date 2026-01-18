import 'package:flutter/material.dart';

/// Atomix text component.
///
/// A simple wrapper around Flutter's Text widget that uses Atomix typography.
/// Provides a consistent text rendering across the design system.
///
/// Example:
/// ```dart
/// AtomixText(
///   'Hello World',
///   style: Theme.of(context).textTheme.bodyLarge,
/// )
/// ```
class AtomixText extends StatelessWidget {
  /// Creates an Atomix text widget.
  const AtomixText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
    this.color,
  });

  /// The text to display.
  final String data;

  /// The style to apply to the text.
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// Maximum number of lines for the text to span.
  final int? maxLines;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// A semantic label for the text.
  final String? semanticsLabel;

  /// Optional color override.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style?.copyWith(color: color) ?? TextStyle(color: color),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
    );
  }
}
