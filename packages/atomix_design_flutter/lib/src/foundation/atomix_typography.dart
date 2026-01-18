import 'package:flutter/material.dart';
import 'atomix_colors.dart';

/// Atomix Design System typography.
///
/// Provides a comprehensive text style system based on Material Design 3
/// with custom font weights and sizes.
class AtomixTypography {
  AtomixTypography._();

  /// Base font family for the design system
  static const String fontFamily = 'Inter';

  /// Font weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  /// Creates a complete TextTheme for light mode
  static TextTheme lightTextTheme() {
    return _createTextTheme(
      displayColor: AtomixColors.textPrimary,
      bodyColor: AtomixColors.textPrimary,
    );
  }

  /// Creates a complete TextTheme for dark mode
  static TextTheme darkTextTheme() {
    return _createTextTheme(
      displayColor: AtomixColors.textPrimaryDark,
      bodyColor: AtomixColors.textPrimaryDark,
    );
  }

  static TextTheme _createTextTheme({
    required Color displayColor,
    required Color bodyColor,
  }) {
    return TextTheme(
      // Display styles - Large, attention-grabbing text
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: bold,
        letterSpacing: -0.25,
        height: 1.12,
        color: displayColor,
        fontFamily: fontFamily,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: bold,
        letterSpacing: 0,
        height: 1.16,
        color: displayColor,
        fontFamily: fontFamily,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: semiBold,
        letterSpacing: 0,
        height: 1.22,
        color: displayColor,
        fontFamily: fontFamily,
      ),

      // Headline styles - Section headers
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: semiBold,
        letterSpacing: 0,
        height: 1.25,
        color: displayColor,
        fontFamily: fontFamily,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: semiBold,
        letterSpacing: 0,
        height: 1.29,
        color: displayColor,
        fontFamily: fontFamily,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: medium,
        letterSpacing: 0,
        height: 1.33,
        color: displayColor,
        fontFamily: fontFamily,
      ),

      // Title styles - Subsection headers
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: medium,
        letterSpacing: 0,
        height: 1.27,
        color: displayColor,
        fontFamily: fontFamily,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: medium,
        letterSpacing: 0.15,
        height: 1.50,
        color: displayColor,
        fontFamily: fontFamily,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: medium,
        letterSpacing: 0.1,
        height: 1.43,
        color: displayColor,
        fontFamily: fontFamily,
      ),

      // Body styles - Main content
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: regular,
        letterSpacing: 0.5,
        height: 1.50,
        color: bodyColor,
        fontFamily: fontFamily,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: regular,
        letterSpacing: 0.25,
        height: 1.43,
        color: bodyColor,
        fontFamily: fontFamily,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: regular,
        letterSpacing: 0.4,
        height: 1.33,
        color: bodyColor,
        fontFamily: fontFamily,
      ),

      // Label styles - Buttons, chips, etc.
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: medium,
        letterSpacing: 0.1,
        height: 1.43,
        color: bodyColor,
        fontFamily: fontFamily,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: medium,
        letterSpacing: 0.5,
        height: 1.33,
        color: bodyColor,
        fontFamily: fontFamily,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: medium,
        letterSpacing: 0.5,
        height: 1.45,
        color: bodyColor,
        fontFamily: fontFamily,
      ),
    );
  }
}
