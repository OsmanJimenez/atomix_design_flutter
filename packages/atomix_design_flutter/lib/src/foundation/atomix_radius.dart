import 'package:flutter/material.dart';

/// Atomix Design System border radius values.
///
/// Provides a consistent set of border radius values for rounded corners.
///
/// Example:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AtomixRadius.md,
///   ),
/// )
/// ```
class AtomixRadius {
  AtomixRadius._();

  /// 4px - Extra small radius
  static const double xs = 4.0;

  /// 8px - Small radius
  static const double sm = 8.0;

  /// 12px - Medium radius (default)
  static const double md = 12.0;

  /// 16px - Large radius
  static const double lg = 16.0;

  /// 24px - Extra large radius
  static const double xl = 24.0;

  /// Full circle/pill shape
  static const double full = 9999.0;

  // BorderRadius shortcuts
  static const BorderRadius xsBorderRadius = BorderRadius.all(
    Radius.circular(xs),
  );
  static const BorderRadius smBorderRadius = BorderRadius.all(
    Radius.circular(sm),
  );
  static const BorderRadius mdBorderRadius = BorderRadius.all(
    Radius.circular(md),
  );
  static const BorderRadius lgBorderRadius = BorderRadius.all(
    Radius.circular(lg),
  );
  static const BorderRadius xlBorderRadius = BorderRadius.all(
    Radius.circular(xl),
  );
  static const BorderRadius fullBorderRadius = BorderRadius.all(
    Radius.circular(full),
  );

  // Radius shortcuts
  static const Radius xsRadius = Radius.circular(xs);
  static const Radius smRadius = Radius.circular(sm);
  static const Radius mdRadius = Radius.circular(md);
  static const Radius lgRadius = Radius.circular(lg);
  static const Radius xlRadius = Radius.circular(xl);
  static const Radius fullRadius = Radius.circular(full);
}
