/// Atomix Design System elevation scale.
///
/// Provides a consistent elevation system for shadows and depth.
/// Values represent the elevation level used in Material Design.
///
/// Example:
/// ```dart
/// Material(
///   elevation: AtomixElevation.md,
///   child: Container(...),
/// )
/// ```
class AtomixElevation {
  AtomixElevation._();

  /// 0 - No elevation
  static const double none = 0.0;

  /// 1 - Minimal elevation
  static const double xs = 1.0;

  /// 2 - Small elevation
  static const double sm = 2.0;

  /// 3 - Medium elevation (default)
  static const double md = 3.0;

  /// 4 - Large elevation
  static const double lg = 4.0;

  /// 6 - Extra large elevation
  static const double xl = 6.0;

  /// 8 - Extra extra large elevation
  static const double xxl = 8.0;

  /// 12 - Maximum elevation
  static const double max = 12.0;
}
