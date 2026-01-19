import 'package:flutter/material.dart';

/// Design tokens for advanced shadows in the Atomix Design System.
///
/// These provide more depth and visual hierarchy than standard elevation.
abstract class AtomixShadows {
  /// Subtle shadow for low-level components.
  static List<BoxShadow> get level1 => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  /// Standard shadow for cards and floating elements.
  static List<BoxShadow> get level2 => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  /// Deep shadow for modal elements or primary actions.
  static List<BoxShadow> get level3 => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.1),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];

  /// Very deep shadow for emphasized floating elements.
  static List<BoxShadow> get level4 => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      blurRadius: 24,
      offset: const Offset(0, 12),
    ),
  ];

  /// Maximum depth shadow.
  static List<BoxShadow> get level5 => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.15),
      blurRadius: 32,
      offset: const Offset(0, 16),
    ),
  ];

  /// Internal shadow for "inset" effects (like pressed state).
  static List<BoxShadow> get inset => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 4,
      spreadRadius: -2,
      offset: const Offset(0, 2),
    ),
  ];
}
