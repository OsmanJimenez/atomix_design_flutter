import 'package:flutter/material.dart';

/// Atomix Design System color palette.
///
/// Provides a comprehensive set of semantic colors for the design system,
/// including primary, secondary, surface, background, and status colors.
class AtomixColors {
  AtomixColors._();

  // Primary colors
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryDark = Color(0xFF4F46E5);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // Secondary colors
  static const Color secondary = Color(0xFF8B5CF6); // Purple
  static const Color secondaryLight = Color(0xFFA78BFA);
  static const Color secondaryDark = Color(0xFF7C3AED);
  static const Color onSecondary = Color(0xFFFFFFFF);

  // Surface colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color onSurface = Color(0xFF1F2937);
  static const Color onSurfaceDark = Color(0xFFE5E7EB);

  // Background colors
  static const Color background = Color(0xFFF9FAFB);
  static const Color backgroundDark = Color(0xFF111827);
  static const Color onBackground = Color(0xFF1F2937);
  static const Color onBackgroundDark = Color(0xFFE5E7EB);

  // Status colors - Error
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFF87171);
  static const Color errorDark = Color(0xFFDC2626);
  static const Color onError = Color(0xFFFFFFFF);

  // Status colors - Success
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFF34D399);
  static const Color successDark = Color(0xFF059669);
  static const Color onSuccess = Color(0xFFFFFFFF);

  // Status colors - Warning
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFBBF24);
  static const Color warningDark = Color(0xFFD97706);
  static const Color onWarning = Color(0xFF000000);

  // Status colors - Info
  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFF60A5FA);
  static const Color infoDark = Color(0xFF2563EB);
  static const Color onInfo = Color(0xFFFFFFFF);

  // Text colors
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textDisabled = Color(0xFFD1D5DB);

  // Text colors - Dark mode
  static const Color textPrimaryDark = Color(0xFFF9FAFB);
  static const Color textSecondaryDark = Color(0xFFD1D5DB);
  static const Color textTertiaryDark = Color(0xFF9CA3AF);
  static const Color textDisabledDark = Color(0xFF6B7280);

  // Border colors
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFF374151);

  // Divider colors
  static const Color divider = Color(0xFFE5E7EB);
  static const Color dividerDark = Color(0xFF374151);

  // Overlay colors
  static const Color overlay = Color(0x1F000000);
  static const Color overlayDark = Color(0x3FFFFFFF);
}
