import 'dart:ui';
import '../atomix_theme_data.dart';
import '../implementations/expressive/atomix_color_tokens_expressive.dart';
import '../implementations/expressive/atomix_geometry_tokens_expressive.dart';
import '../implementations/material/atomix_typography_tokens_material.dart';
import 'atomix_theme_strategy.dart';

/// Material Expressive Theme Strategy
/// Bold, vibrant, and dynamic design with personality
class AtomixThemeExpressive implements AtomixThemeStrategy {
  final Brightness brightness;

  const AtomixThemeExpressive({this.brightness = Brightness.light});

  @override
  String get id => 'expressive';

  @override
  String get displayName => 'Material Expressive';

  @override
  AtomixThemeData get themeData => AtomixThemeData(
    colors: AtomixColorTokensExpressive(brightness: brightness),
    typography: const AtomixTypographyTokensMaterial(),
    spacing: const AtomixSpacingTokensExpressive(),
    radius: const AtomixRadiusTokensExpressive(),
  );
}
