import 'dart:ui';
import '../atomix_theme_data.dart';
import '../implementations/glass/atomix_color_tokens_glass.dart';
import '../implementations/glass/atomix_geometry_tokens_glass.dart';
import '../implementations/material/atomix_typography_tokens_material.dart';
import 'atomix_theme_strategy.dart';

/// Apple Glass Theme Strategy
/// Implements authentic glassmorphism with blur effects and iOS design language
class AtomixThemeGlass implements AtomixThemeStrategy {
  final Brightness brightness;

  const AtomixThemeGlass({this.brightness = Brightness.light});

  @override
  String get id => 'glass';

  @override
  String get displayName => 'Apple Glass';

  @override
  AtomixThemeData get themeData => AtomixThemeData(
    colors: AtomixColorTokensGlass(brightness: brightness),
    typography: const AtomixTypographyTokensMaterial(), // TODO: Use SF Pro font
    spacing: const AtomixSpacingTokensGlass(),
    radius: const AtomixRadiusTokensGlass(),
  );

  /// Get blur configuration for glassmorphism
  /// Use this in components that need glass effect
  AtomixBlurConfig get blurConfig => AtomixBlurConfig.medium;
}
