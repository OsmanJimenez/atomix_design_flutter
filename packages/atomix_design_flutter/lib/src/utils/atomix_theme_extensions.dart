import 'package:flutter/material.dart';
import '../theme/atomix_theme.dart';
import '../theme/atomix_theme_data.dart';

/// Extension to add custom properties to AtomixTheme
///
/// Example usage:
/// ```dart
/// class MyCustomTheme {
///   final Color customColor;
///   final double customSpacing;
///
///   MyCustomTheme({
///     required this.customColor,
///     required this.customSpacing,
///   });
/// }
///
/// // In your app:
/// AtomixTheme(
///   data: myAtomixThemeData,
///   child: MyApp(),
/// );
///
/// // Access custom theme:
/// final customTheme = Theme.of(context).extension<MyCustomTheme>();
/// ```
extension AtomixThemeExtensions on BuildContext {
  /// Get theme extension
  T? themeExtension<T>() => Theme.of(this).extension<T>();

  /// Get AtomixTheme safely
  AtomixThemeData get atomixTheme => AtomixTheme.of(this);
}

/// Helper to create theme with extensions
class AtomixThemeBuilder {
  /// Create a ThemeData with AtomixTheme and custom extensions
  static ThemeData build({
    required AtomixThemeData atomixTheme,
    Brightness brightness = Brightness.light,
    List<ThemeExtension<dynamic>>? extensions,
  }) {
    return ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: atomixTheme.colors.primary,
        brightness: brightness,
      ),
      extensions: extensions,
    );
  }
}

/// Example custom theme extension
class AtomixCustomColors extends ThemeExtension<AtomixCustomColors> {
  final Color? customColor1;
  final Color? customColor2;

  const AtomixCustomColors({this.customColor1, this.customColor2});

  @override
  AtomixCustomColors copyWith({Color? customColor1, Color? customColor2}) {
    return AtomixCustomColors(
      customColor1: customColor1 ?? this.customColor1,
      customColor2: customColor2 ?? this.customColor2,
    );
  }

  @override
  AtomixCustomColors lerp(AtomixCustomColors? other, double t) {
    if (other is! AtomixCustomColors) return this;
    return AtomixCustomColors(
      customColor1: Color.lerp(customColor1, other.customColor1, t),
      customColor2: Color.lerp(customColor2, other.customColor2, t),
    );
  }
}
