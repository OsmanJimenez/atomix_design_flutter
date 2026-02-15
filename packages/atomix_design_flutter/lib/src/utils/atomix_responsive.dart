import 'package:flutter/material.dart';
import '../foundation/atomix_breakpoints.dart';

/// Extension to get responsive values based on screen size
extension AtomixResponsive on BuildContext {
  /// Get screen width
  double get width => MediaQuery.of(this).size.width;

  /// Get screen height
  double get height => MediaQuery.of(this).size.height;

  /// Check if device is mobile
  bool get isMobile => width < AtomixBreakpoints.sm;

  /// Check if device is tablet
  bool get isTablet =>
      width >= AtomixBreakpoints.sm && width < AtomixBreakpoints.lg;

  /// Check if device is desktop
  bool get isDesktop => width >= AtomixBreakpoints.lg;

  /// Check if device is large desktop
  bool get isDesktopLarge => width >= AtomixBreakpoints.xl;

  /// Get responsive value based on screen size
  T responsive<T>({required T mobile, T? tablet, T? desktop, T? desktopLarge}) {
    if (isDesktopLarge && desktopLarge != null) return desktopLarge;
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }

  /// Get responsive padding
  EdgeInsets get responsivePadding => responsive(
    mobile: const EdgeInsets.all(16),
    tablet: const EdgeInsets.all(24),
    desktop: const EdgeInsets.all(32),
  );

  /// Get responsive spacing
  double get responsiveSpacing =>
      responsive(mobile: 16, tablet: 24, desktop: 32);
}

/// Widget that builds different layouts based on screen size
class AtomixResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const AtomixResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AtomixBreakpoints.lg && desktop != null) {
          return desktop!;
        }
        if (constraints.maxWidth >= AtomixBreakpoints.sm && tablet != null) {
          return tablet!;
        }
        return mobile;
      },
    );
  }
}
