import 'package:flutter/material.dart';

/// Defines the color palette tokens for the design system.
///
/// Implementations of this interface provide specific color values
/// for different themes (e.g., Material, Glass, Expressive).
abstract class AtomixColorTokens {
  // Brand Colors
  Color get primary;
  Color get onPrimary;
  Color get primaryContainer;
  Color get onPrimaryContainer;

  Color get secondary;
  Color get onSecondary;
  Color get secondaryContainer;
  Color get onSecondaryContainer;

  // Background & Surface
  Color get background;
  Color get onBackground;
  Color get surface;
  Color get onSurface;
  Color get surfaceVariant;
  Color get onSurfaceVariant;

  // Semantic Colors (Status)
  Color get success;
  Color get onSuccess;
  Color get error;
  Color get onError;
  Color get warning;
  Color get onWarning;
  Color get info;
  Color get onInfo;

  // Typography Colors
  Color get textPrimary;
  Color get textSecondary;
  Color get textTertiary;
  Color get textDisabled;

  // UI Element Colors
  Color get border;
  Color get outline;
  Color get divider;
  Color get overlay;
  Color get shadow;
}
