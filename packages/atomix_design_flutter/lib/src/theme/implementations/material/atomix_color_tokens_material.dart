import 'package:flutter/material.dart';
import '../../tokens/atomix_color_tokens.dart';

/// Material Design 3 Color Tokens
/// Reference: https://m3.material.io/styles/color/roles
class AtomixColorTokensMaterial implements AtomixColorTokens {
  final Brightness brightness;

  const AtomixColorTokensMaterial({this.brightness = Brightness.light});

  bool get isLight => brightness == Brightness.light;

  // Primary colors - M3 uses a tonal palette
  @override
  Color get primary => isLight
      ? const Color(0xFF6750A4) // M3 Primary40
      : const Color(0xFFD0BCFF); // M3 Primary80

  @override
  Color get primaryContainer => isLight
      ? const Color(0xFFEADDFF) // M3 PrimaryContainer90
      : const Color(0xFF4F378B); // M3 PrimaryContainer30

  @override
  Color get onPrimary => isLight
      ? const Color(0xFFFFFFFF) // M3 OnPrimary100
      : const Color(0xFF381E72); // M3 OnPrimary20

  @override
  Color get onPrimaryContainer => isLight
      ? const Color(0xFF21005D) // M3 OnPrimaryContainer10
      : const Color(0xFFEADDFF); // M3 OnPrimaryContainer90

  // Secondary colors
  @override
  Color get secondary => isLight
      ? const Color(0xFF625B71) // M3 Secondary40
      : const Color(0xFFCCC2DC); // M3 Secondary80

  @override
  Color get secondaryContainer => isLight
      ? const Color(0xFFE8DEF8) // M3 SecondaryContainer90
      : const Color(0xFF4A4458); // M3 SecondaryContainer30

  @override
  Color get onSecondary => isLight
      ? const Color(0xFFFFFFFF) // M3 OnSecondary100
      : const Color(0xFF332D41); // M3 OnSecondary20

  @override
  Color get onSecondaryContainer => isLight
      ? const Color(0xFF1D192B) // M3 OnSecondaryContainer10
      : const Color(0xFFE8DEF8); // M3 OnSecondaryContainer90

  // Surface colors - M3 uses surface containers
  @override
  Color get background => isLight
      ? const Color(0xFFFEF7FF) // M3 Surface (light)
      : const Color(0xFF141218); // M3 Surface (dark)

  @override
  Color get onBackground => isLight
      ? const Color(0xFF1D1B20) // M3 OnSurface
      : const Color(0xFFE6E0E9); // M3 OnSurface

  @override
  Color get surface => isLight
      ? const Color(0xFFFEF7FF) // M3 Surface
      : const Color(0xFF141218); // M3 Surface

  @override
  Color get onSurface => isLight
      ? const Color(0xFF1D1B20) // M3 OnSurface
      : const Color(0xFFE6E0E9); // M3 OnSurface

  @override
  Color get surfaceVariant => isLight
      ? const Color(0xFFE7E0EC) // M3 SurfaceVariant
      : const Color(0xFF49454F); // M3 SurfaceVariant

  @override
  Color get onSurfaceVariant => isLight
      ? const Color(0xFF49454F) // M3 OnSurfaceVariant
      : const Color(0xFFCAC4D0); // M3 OnSurfaceVariant

  // Semantic colors (custom, not in M3 spec but needed for design system)
  @override
  Color get success => isLight
      ? const Color(0xFF2E7D32) // Green 700
      : const Color(0xFF66BB6A); // Green 400

  @override
  Color get onSuccess => const Color(0xFFFFFFFF);

  @override
  Color get error => isLight
      ? const Color(0xFFB3261E) // M3 Error40
      : const Color(0xFFF2B8B5); // M3 Error80

  @override
  Color get onError => isLight
      ? const Color(0xFFFFFFFF) // M3 OnError100
      : const Color(0xFF601410); // M3 OnError20

  @override
  Color get warning => isLight
      ? const Color(0xFFF57C00) // Orange 700
      : const Color(0xFFFFB74D); // Orange 300

  @override
  Color get onWarning => const Color(0xFFFFFFFF);

  @override
  Color get info => isLight
      ? const Color(0xFF1976D2) // Blue 700
      : const Color(0xFF64B5F6); // Blue 300

  @override
  Color get onInfo => const Color(0xFFFFFFFF);

  // Text colors
  @override
  Color get textPrimary => isLight
      ? const Color(0xFF1D1B20) // M3 OnSurface
      : const Color(0xFFE6E0E9); // M3 OnSurface

  @override
  Color get textSecondary => isLight
      ? const Color(0xFF49454F) // M3 OnSurfaceVariant
      : const Color(0xFFCAC4D0); // M3 OnSurfaceVariant

  @override
  Color get textTertiary => isLight
      ? const Color(0xFF79747E) // M3 Outline
      : const Color(0xFF938F99); // M3 Outline

  @override
  Color get textDisabled => isLight
      ? const Color(0x611D1B20) // M3 OnSurface 38% opacity
      : const Color(0x61E6E0E9); // M3 OnSurface 38% opacity

  // Borders and dividers
  @override
  Color get border => isLight
      ? const Color(0xFF79747E) // M3 Outline
      : const Color(0xFF938F99); // M3 Outline

  @override
  Color get outline => isLight
      ? const Color(0xFF79747E) // M3 Outline
      : const Color(0xFF938F99); // M3 Outline

  @override
  Color get divider => isLight
      ? const Color(0x1F1D1B20) // M3 OutlineVariant
      : const Color(0x1FE6E0E9); // M3 OutlineVariant

  // Overlay and shadow
  @override
  Color get overlay => isLight
      ? const Color(0x1F000000) // 12% black
      : const Color(0x3FFFFFFF); // 25% white

  @override
  Color get shadow => const Color(0x33000000); // M3 Shadow (20% black)
}
