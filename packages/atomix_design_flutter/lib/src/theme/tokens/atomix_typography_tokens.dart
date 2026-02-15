import 'package:flutter/material.dart';

/// Defines the typography tokens for the design system.
abstract class AtomixTypographyTokens {
  String get fontFamily;

  // Headlines
  TextStyle get displayLarge;
  TextStyle get displayMedium;
  TextStyle get displaySmall;

  TextStyle get headlineLarge;
  TextStyle get headlineMedium;
  TextStyle get headlineSmall;

  // Titles
  TextStyle get titleLarge;
  TextStyle get titleMedium;
  TextStyle get titleSmall;

  // Body
  TextStyle get bodyLarge;
  TextStyle get bodyMedium;
  TextStyle get bodySmall;

  // Labels (Buttons, Chips, etc.)
  TextStyle get labelLarge;
  TextStyle get labelMedium;
  TextStyle get labelSmall;
}
