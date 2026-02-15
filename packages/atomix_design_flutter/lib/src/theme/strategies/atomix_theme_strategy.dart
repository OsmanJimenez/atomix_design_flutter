import 'package:atomix_design_flutter/src/theme/atomix_theme_data.dart';

/// Defines a strategy for applying a specific design language (Theme).
///
/// Implementations of this interface (e.g., [MaterialThemeStrategy], [GlassThemeStrategy])
/// provide the specific [AtomixThemeData] and identifying information.
abstract class AtomixThemeStrategy {
  /// The unique identifier for this strategy (e.g., 'material', 'glass').
  String get id;

  /// The human-readable name of the theme (e.g., 'Material Design', 'Apple Glass').
  String get displayName;

  /// The theme configuration data provided by this strategy.
  AtomixThemeData get themeData;
}
