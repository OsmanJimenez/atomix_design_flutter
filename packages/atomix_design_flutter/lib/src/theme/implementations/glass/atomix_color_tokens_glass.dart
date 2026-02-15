import 'package:flutter/material.dart';
import '../../tokens/atomix_color_tokens.dart';

class AtomixColorTokensGlass implements AtomixColorTokens {
  final Brightness brightness;

  const AtomixColorTokensGlass({this.brightness = Brightness.light});

  bool get isLight => brightness == Brightness.light;

  @override
  Color get primary => const Color(0xFF007AFF); // iOS Blue
  @override
  Color get primaryContainer =>
      isLight ? const Color(0x33007AFF) : const Color(0x330A84FF);
  @override
  Color get onPrimary => const Color(0xFFFFFFFF);
  @override
  Color get onPrimaryContainer =>
      isLight ? const Color(0xFF007AFF) : const Color(0xFF0A84FF);

  @override
  Color get secondary => const Color(0xFF5E5CE6); // iOS Indigo
  @override
  Color get secondaryContainer =>
      isLight ? const Color(0x335E5CE6) : const Color(0x335E5CE6);
  @override
  Color get onSecondary => const Color(0xFFFFFFFF);
  @override
  Color get onSecondaryContainer =>
      isLight ? const Color(0xFF5E5CE6) : const Color(0xFF5E5CE6);

  // Glassmorphism essentials: Translucent backgrounds
  @override
  Color get background =>
      isLight ? const Color(0xFFF2F2F7) : const Color(0xFF000000);
  @override
  Color get onBackground =>
      isLight ? const Color(0xFF000000) : const Color(0xFFFFFFFF);

  // Surface is semi-transparent for blur effect
  @override
  Color get surface =>
      isLight ? const Color(0xCCFFFFFF) : const Color(0xCC1C1C1E);
  @override
  Color get onSurface =>
      isLight ? const Color(0xFF000000) : const Color(0xFFFFFFFF);

  @override
  Color get surfaceVariant =>
      isLight ? const Color(0x99FFFFFF) : const Color(0x992C2C2E);
  @override
  Color get onSurfaceVariant =>
      isLight ? const Color(0xFF3C3C43) : const Color(0xFFEBEBF5);

  @override
  Color get success => const Color(0xFF34C759);
  @override
  Color get onSuccess => const Color(0xFFFFFFFF);

  @override
  Color get error => const Color(0xFFFF3B30);
  @override
  Color get onError => const Color(0xFFFFFFFF);

  @override
  Color get warning => const Color(0xFFFFCC00);
  @override
  Color get onWarning => const Color(0xFF000000);

  @override
  Color get info => const Color(0xFF5856D6);
  @override
  Color get onInfo => const Color(0xFFFFFFFF);

  @override
  Color get textPrimary =>
      isLight ? const Color(0xFF000000) : const Color(0xFFFFFFFF);
  @override
  Color get textSecondary =>
      isLight ? const Color(0x993C3C43) : const Color(0x99EBEBF5);
  @override
  Color get textTertiary =>
      isLight ? const Color(0x4D3C3C43) : const Color(0x4DEBEBF5);
  @override
  Color get textDisabled =>
      isLight ? const Color(0x2E3C3C43) : const Color(0x2EEBEBF5);

  @override
  Color get border =>
      isLight ? const Color(0x293C3C43) : const Color(0x29EBEBF5); // Separator color
  @override
  Color get outline =>
      isLight ? const Color(0x293C3C43) : const Color(0x29EBEBF5);
  @override
  Color get divider =>
      isLight ? const Color(0x293C3C43) : const Color(0x29EBEBF5);

  @override
  Color get overlay =>
      isLight ? const Color(0x1F000000) : const Color(0x3FFFFFFF);

  @override
  Color get shadow => const Color(0x26000000); // Soft shadow
}
