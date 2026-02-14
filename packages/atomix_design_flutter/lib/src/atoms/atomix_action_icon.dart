import 'package:flutter/material.dart';

/// Atomix action icon component.
///
/// A clickable icon with hover and pressed states.
class AtomixActionIcon extends StatelessWidget {
  /// Creates an Atomix action icon.
  const AtomixActionIcon({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
    this.size = 24.0,
    this.tooltip,
    this.padding = const EdgeInsets.all(8.0),
  });

  /// The icon to display.
  final IconData icon;

  /// The callback that is called when the icon is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The color of the icon.
  final Color? color;

  /// The size of the icon.
  final double size;

  /// Text that describes the action that will occur when the icon is pressed.
  final String? tooltip;

  /// The amount of space by which to inset the icon.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Icon(icon, size: size, color: color);

    if (tooltip != null) {
      iconWidget = Tooltip(message: tooltip!, child: iconWidget);
    }

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(size),
      child: Padding(padding: padding, child: iconWidget),
    );
  }
}
