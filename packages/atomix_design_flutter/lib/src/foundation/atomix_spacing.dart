/// Atomix Design System spacing scale.
///
/// Provides a consistent spacing system based on a 4px grid.
/// Use these values for padding, margin, and gap properties.
///
/// Example:
/// ```dart
/// Padding(
///   padding: EdgeInsets.all(AtomixSpacing.md),
///   child: Text('Hello'),
/// )
/// ```
class AtomixSpacing {
  AtomixSpacing._();

  /// 4px - Extra extra small spacing
  static const double xxs = 4.0;

  /// 8px - Extra small spacing
  static const double xs = 8.0;

  /// 12px - Small spacing
  static const double sm = 12.0;

  /// 16px - Medium spacing (default)
  static const double md = 16.0;

  /// 20px - Medium-large spacing
  static const double lg = 20.0;

  /// 24px - Extra large spacing
  static const double xl = 24.0;

  /// 32px - Extra extra large spacing
  static const double xxl = 32.0;

  /// 40px - Extra extra extra large spacing
  static const double xxxl = 40.0;

  /// 48px - Huge spacing
  static const double huge = 48.0;

  /// 64px - Extra huge spacing
  static const double xHuge = 64.0;
}
