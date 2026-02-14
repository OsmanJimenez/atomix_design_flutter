import 'package:flutter/material.dart';
import 'atomix_text.dart';

/// Atomix overline component.
///
/// A pre-styled text atom using the labelSmall typography style,
/// typically displayed as uppercase.
class AtomixOverline extends StatelessWidget {
  /// Creates an Atomix overline.
  const AtomixOverline(
    this.data, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.color,
    this.uppercase = true,
  });

  /// The text to display.
  final String data;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// Maximum number of lines for the text to span.
  final int? maxLines;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// Optional color override.
  final Color? color;

  /// Whether to display the text in uppercase.
  final bool uppercase;

  @override
  Widget build(BuildContext context) {
    return AtomixText(
      uppercase ? data.toUpperCase() : data,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        letterSpacing: 1.5,
        fontWeight: FontWeight.bold,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      color: color,
    );
  }
}
