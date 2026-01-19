import 'package:flutter/widgets.dart';

/// Design tokens for animations in the Atomix Design System.
///
/// This includes standard durations and curves to ensure consistent
/// motion across the application.
abstract class AtomixAnimations {
  // Durations
  /// Instant transition (0ms)
  static const Duration instant = Duration.zero;

  /// Fast duration (150ms) - used for micro-interactions, like button hover.
  static const Duration fast = Duration(milliseconds: 150);

  /// Medium duration (300ms) - used for entry/exit animations, like dialogs.
  static const Duration medium = Duration(milliseconds: 300);

  /// Slow duration (500ms) - used for complex transitions or layout changes.
  static const Duration slow = Duration(milliseconds: 500);

  // Curves
  /// Standard easing curve for most animations.
  static const Curve standard = Curves.easeInOut;

  /// Acceleration curve for elements exiting the screen.
  static const Curve accelerate = Curves.easeIn;

  /// Deceleration curve for elements entering the screen.
  static const Curve decelerate = Curves.easeOut;

  /// Emphasized curve for important transitions (Material 3 style).
  static const Curve emphasized = Curves.fastOutSlowIn;
}
