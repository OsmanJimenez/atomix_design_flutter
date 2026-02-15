import 'package:flutter/material.dart';
import '../../tokens/atomix_color_tokens.dart';

/// Material Expressive Color Tokens
/// Vibrant, saturated colors with personality and dynamism
class AtomixColorTokensExpressive implements AtomixColorTokens {
  final Brightness brightness;

  const AtomixColorTokensExpressive({this.brightness = Brightness.light});

  bool get isLight => brightness == Brightness.light;

  // Vibrant primary colors
  @override
  Color get primary => isLight
      ? const Color(0xFFFF6B35) // Vibrant Orange
      : const Color(0xFFFF8C61); // Lighter Orange

  @override
  Color get primaryContainer => isLight
      ? const Color(0xFFFFE5DB) // Light Orange Container
      : const Color(0xFFCC5528); // Dark Orange Container

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get onPrimaryContainer => isLight
      ? const Color(0xFF8C3000) // Dark Orange
      : const Color(0xFFFFE5DB); // Light Orange

  // Bold secondary colors
  @override
  Color get secondary => isLight
      ? const Color(0xFF7B2CBF) // Vibrant Purple
      : const Color(0xFF9D4EDD); // Lighter Purple

  @override
  Color get secondaryContainer => isLight
      ? const Color(0xFFF3E5FF) // Light Purple Container
      : const Color(0xFF5A1E99); // Dark Purple Container

  @override
  Color get onSecondary => const Color(0xFFFFFFFF);

  @override
  Color get onSecondaryContainer => isLight
      ? const Color(0xFF3C0066) // Dark Purple
      : const Color(0xFFF3E5FF); // Light Purple

  // Dynamic backgrounds
  @override
  Color get background => isLight
      ? const Color(0xFFFFFBFE) // Warm white
      : const Color(0xFF1A0033); // Deep purple-black

  @override
  Color get onBackground =>
      isLight ? const Color(0xFF1C1B1F) : const Color(0xFFE6E1E5);

  @override
  Color get surface =>
      isLight ? const Color(0xFFFFFFFF) : const Color(0xFF2B1B3D); // Purple-tinted dark

  @override
  Color get onSurface =>
      isLight ? const Color(0xFF1C1B1F) : const Color(0xFFE6E1E5);

  @override
  Color get surfaceVariant => isLight
      ? const Color(0xFFFFF4F0) // Warm tint
      : const Color(0xFF3D2E4A); // Purple-tinted variant

  @override
  Color get onSurfaceVariant =>
      isLight ? const Color(0xFF52443C) : const Color(0xFFD7C2D0);

  // Vibrant semantic colors
  @override
  Color get success => isLight
      ? const Color(0xFF00C853) // Bright Green
      : const Color(0xFF69F0AE); // Neon Green

  @override
  Color get onSuccess => const Color(0xFFFFFFFF);

  @override
  Color get error => isLight
      ? const Color(0xFFFF1744) // Bright Red
      : const Color(0xFFFF5252); // Neon Red

  @override
  Color get onError => const Color(0xFFFFFFFF);

  @override
  Color get warning => isLight
      ? const Color(0xFFFFAB00) // Bright Amber
      : const Color(0xFFFFD740); // Neon Amber

  @override
  Color get onWarning => const Color(0xFF000000);

  @override
  Color get info => isLight
      ? const Color(0xFF00B0FF) // Bright Cyan
      : const Color(0xFF40C4FF); // Neon Cyan

  @override
  Color get onInfo => const Color(0xFF000000);

  // Text colors
  @override
  Color get textPrimary =>
      isLight ? const Color(0xFF1C1B1F) : const Color(0xFFE6E1E5);

  @override
  Color get textSecondary =>
      isLight ? const Color(0xFF49454F) : const Color(0xFFCAC4D0);

  @override
  Color get textTertiary =>
      isLight ? const Color(0xFF79747E) : const Color(0xFF938F99);

  @override
  Color get textDisabled =>
      isLight ? const Color(0x611C1B1F) : const Color(0x61E6E1E5);

  // Borders and dividers
  @override
  Color get border =>
      isLight ? const Color(0xFF79747E) : const Color(0xFF938F99);

  @override
  Color get outline =>
      isLight ? const Color(0xFF79747E) : const Color(0xFF938F99);

  @override
  Color get divider =>
      isLight ? const Color(0x1F1C1B1F) : const Color(0x1FE6E1E5);

  // Overlay and shadow with color tint
  @override
  Color get overlay => isLight
      ? const Color(0x1FFF6B35) // Orange-tinted overlay
      : const Color(0x3F7B2CBF); // Purple-tinted overlay

  @override
  Color get shadow => isLight
      ? const Color(0x33FF6B35) // Colored shadow
      : const Color(0x337B2CBF); // Purple shadow
}
