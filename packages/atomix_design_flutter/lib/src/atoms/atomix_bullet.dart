import 'package:flutter/material.dart';
import '../theme/atomix_theme.dart';

/// Atomix bullet component.
///
/// A simple dot atom primarily used for list items or indicators.
class AtomixBullet extends StatelessWidget {
  /// Creates an Atomix bullet.
  const AtomixBullet({super.key, this.size = 6.0, this.color});

  /// The size of the bullet dot.
  final double size;

  /// The color of the bullet.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color ?? AtomixTheme.of(context).colors.primary,
        shape: BoxShape.circle,
      ),
    );
  }
}
