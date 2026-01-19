/// Design tokens for responsive breakpoints in the Atomix Design System.
///
/// Use these values to determine layout changes based on screen width.
abstract class AtomixBreakpoints {
  /// Extra small screens (Phones)
  static const double xs = 0;

  /// Small screens (Large phones / Small tablets)
  static const double sm = 600;

  /// Medium screens (Tablets / Small laptops)
  static const double md = 900;

  /// Large screens (Laptops / Desktops)
  static const double lg = 1200;

  /// Extra large screens (Large monitors)
  static const double xl = 1536;

  /// Helper to check if the screen is mobile sized.
  static bool isMobile(double width) => width < sm;

  /// Helper to check if the screen is tablet sized.
  static bool isTablet(double width) => width >= sm && width < lg;

  /// Helper to check if the screen is desktop sized.
  static bool isDesktop(double width) => width >= lg;
}
