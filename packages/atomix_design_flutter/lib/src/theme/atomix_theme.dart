import 'package:flutter/material.dart';
import '../foundation/atomix_colors.dart';
import '../foundation/atomix_typography.dart';
import '../foundation/atomix_radius.dart';
import '../foundation/atomix_elevation.dart';
import 'atomix_theme_data.dart';
import 'strategies/atomix_theme_strategy.dart';
import 'strategies/atomix_theme_materialize.dart';

/// Applies an [AtomixThemeStrategy] to the widget tree.
///
/// This widget injects the [AtomixThemeData] provided by the [strategy]
/// into the context, allowing descendant widgets to access design tokens.
///
/// It also provides static factory methods [light] and [dark] for backward
/// compatibility with [MaterialApp.theme].
class AtomixTheme extends InheritedWidget {
  final AtomixThemeStrategy strategy;
  final AtomixThemeData data;

  AtomixTheme({
    super.key,
    this.strategy = const AtomixThemeMaterialize(), // Default strategy
    required super.child,
  }) : data = strategy.themeData;

  static AtomixThemeData of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AtomixTheme>();
    if (result == null) {
      return const AtomixThemeMaterialize().themeData;
    }
    return result.data;
  }

  @override
  bool updateShouldNotify(AtomixTheme oldWidget) {
    return strategy.id != oldWidget.strategy.id || data != oldWidget.data;
  }

  // ===========================================================================
  // Legacy / Compatibility Layer (Static Factors for ThemeData)
  // ===========================================================================

  /// Creates a light theme with Atomix design tokens (Legacy)
  static ThemeData light() {
    return _createTheme(
      brightness: Brightness.light,
      colorScheme: _lightColorScheme(),
      textTheme: AtomixTypography.lightTextTheme(),
    );
  }

  /// Creates a dark theme with Atomix design tokens (Legacy)
  static ThemeData dark() {
    return _createTheme(
      brightness: Brightness.dark,
      colorScheme: _darkColorScheme(),
      textTheme: AtomixTypography.darkTextTheme(),
    );
  }

  /// Creates a custom theme with optional overrides (Legacy)
  static ThemeData themeData({
    Brightness brightness = Brightness.light,
    Color? primaryColor,
    Color? secondaryColor,
    TextTheme? textTheme,
    ColorScheme? colorScheme,
  }) {
    final isLight = brightness == Brightness.light;
    final baseColorScheme = isLight ? _lightColorScheme() : _darkColorScheme();
    final baseTextTheme = isLight
        ? AtomixTypography.lightTextTheme()
        : AtomixTypography.darkTextTheme();

    return _createTheme(
      brightness: brightness,
      colorScheme:
          colorScheme ??
          baseColorScheme.copyWith(
            primary: primaryColor ?? baseColorScheme.primary,
            secondary: secondaryColor ?? baseColorScheme.secondary,
          ),
      textTheme: textTheme ?? baseTextTheme,
    );
  }

  static ColorScheme _lightColorScheme() {
    return ColorScheme.light(
      primary: AtomixColors.primary,
      onPrimary: AtomixColors.onPrimary,
      primaryContainer: AtomixColors.primaryLight,
      onPrimaryContainer: AtomixColors.primaryDark,
      secondary: AtomixColors.secondary,
      onSecondary: AtomixColors.onSecondary,
      secondaryContainer: AtomixColors.secondaryLight,
      onSecondaryContainer: AtomixColors.secondaryDark,
      error: AtomixColors.error,
      onError: AtomixColors.onError,
      errorContainer: AtomixColors.errorLight,
      onErrorContainer: AtomixColors.errorDark,
      surface: AtomixColors.surface,
      onSurface: AtomixColors.onSurface,
      surfaceContainerHighest: AtomixColors.background,
      outline: AtomixColors.border,
      outlineVariant: AtomixColors.divider,
    );
  }

  static ColorScheme _darkColorScheme() {
    return ColorScheme.dark(
      primary: AtomixColors.primary,
      onPrimary: AtomixColors.onPrimary,
      primaryContainer: AtomixColors.primaryDark,
      onPrimaryContainer: AtomixColors.primaryLight,
      secondary: AtomixColors.secondary,
      onSecondary: AtomixColors.onSecondary,
      secondaryContainer: AtomixColors.secondaryDark,
      onSecondaryContainer: AtomixColors.secondaryLight,
      error: AtomixColors.error,
      onError: AtomixColors.onError,
      errorContainer: AtomixColors.errorDark,
      onErrorContainer: AtomixColors.errorLight,
      surface: AtomixColors.surfaceDark,
      onSurface: AtomixColors.onSurfaceDark,
      surfaceContainerHighest: AtomixColors.backgroundDark,
      outline: AtomixColors.borderDark,
      outlineVariant: AtomixColors.dividerDark,
    );
  }

  static ThemeData _createTheme({
    required Brightness brightness,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: AtomixElevation.xs,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: AtomixElevation.sm,
        shape: RoundedRectangleBorder(
          borderRadius: AtomixRadius.mdBorderRadius,
        ),
        clipBehavior: Clip.antiAlias,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: AtomixElevation.sm,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: AtomixRadius.mdBorderRadius,
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: AtomixRadius.mdBorderRadius,
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: AtomixRadius.mdBorderRadius,
          ),
          side: BorderSide(color: colorScheme.outline),
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: AtomixRadius.smBorderRadius,
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: brightness == Brightness.light
            ? AtomixColors.surface
            : AtomixColors.surfaceDark,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: AtomixRadius.mdBorderRadius,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AtomixRadius.mdBorderRadius,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AtomixRadius.mdBorderRadius,
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AtomixRadius.mdBorderRadius,
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AtomixRadius.mdBorderRadius,
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        labelStyle: textTheme.bodyMedium,
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: brightness == Brightness.light
              ? AtomixColors.textTertiary
              : AtomixColors.textTertiaryDark,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surface,
        selectedColor: colorScheme.primaryContainer,
        disabledColor: colorScheme.surfaceContainerHighest,
        labelStyle: textTheme.labelMedium ?? const TextStyle(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: AtomixRadius.smBorderRadius,
          side: BorderSide(color: colorScheme.outline),
        ),
      ),
      dialogTheme: DialogThemeData(
        elevation: AtomixElevation.xl,
        shape: RoundedRectangleBorder(
          borderRadius: AtomixRadius.lgBorderRadius,
        ),
        titleTextStyle: textTheme.headlineSmall,
        contentTextStyle: textTheme.bodyMedium,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        elevation: AtomixElevation.xl,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AtomixRadius.lg),
          ),
        ),
        clipBehavior: Clip.antiAlias,
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        titleTextStyle: textTheme.bodyLarge,
        subtitleTextStyle: textTheme.bodyMedium?.copyWith(
          color: brightness == Brightness.light
              ? AtomixColors.textSecondary
              : AtomixColors.textSecondaryDark,
        ),
      ),
      iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),
    );
  }
}
