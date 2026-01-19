import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A clickable link component.
class AtomixLink extends StatefulWidget {
  /// The text to display.
  final String text;

  /// Called when the link is tapped.
  final VoidCallback? onTap;

  /// Style for the text.
  final TextStyle? style;

  /// Whether to show the underline only on hover (web).
  /// For mobile, it defaults to always visible or custom.
  final bool underlineOnHover;

  /// Custom color for the link.
  final Color? color;

  const AtomixLink({
    super.key,
    required this.text,
    this.onTap,
    this.style,
    this.underlineOnHover = false,
    this.color,
  });

  @override
  State<AtomixLink> createState() => _AtomixLinkState();
}

class _AtomixLinkState extends State<AtomixLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool showUnderline = !widget.underlineOnHover || _isHovered;
    final Color defaultColor = widget.onTap == null
        ? AtomixColors.textDisabled
        : AtomixColors.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AtomixText(
          widget.text,
          style: (widget.style ?? const TextStyle()).copyWith(
            color: widget.color ?? defaultColor,
            decoration: showUnderline
                ? TextDecoration.underline
                : TextDecoration.none,
            decorationColor: widget.color ?? defaultColor,
          ),
        ),
      ),
    );
  }
}
