import 'package:flutter/material.dart';
import '../theme/atomix_theme.dart';
import 'atomix_text.dart';

/// Atomix heading component.
///
/// A pre-styled text atom using the headlineMedium typography style.
class AtomixHeading extends StatelessWidget {
  /// Creates an Atomix heading.
  const AtomixHeading(
    this.data, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.color,
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

  @override
  Widget build(BuildContext context) {
    return AtomixText(
      data,
      style: AtomixTheme.of(context).typography.headlineMedium,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      color: color,
    );
  }
}
