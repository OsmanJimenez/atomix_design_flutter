import 'dart:ui';
import '../atomix_theme_data.dart';
import '../implementations/material/atomix_color_tokens_material.dart';
import '../implementations/material/atomix_geometry_tokens_material.dart';
import '../implementations/material/atomix_typography_tokens_material.dart';
import 'atomix_theme_strategy.dart';

class AtomixThemeMaterialize implements AtomixThemeStrategy {
  final Brightness brightness;

  const AtomixThemeMaterialize({this.brightness = Brightness.light});

  @override
  String get id => 'material';

  @override
  String get displayName => 'Material Design';

  @override
  AtomixThemeData get themeData => AtomixThemeData(
    colors: AtomixColorTokensMaterial(brightness: brightness),
    typography: const AtomixTypographyTokensMaterial(),
    spacing: const AtomixSpacingTokensMaterial(),
    radius: const AtomixRadiusTokensMaterial(),
  );
}
