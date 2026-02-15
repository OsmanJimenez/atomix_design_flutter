import 'tokens/atomix_color_tokens.dart';
import 'tokens/atomix_typography_tokens.dart';
import 'tokens/atomix_geometry_tokens.dart';

/// Holds the complete configuration for an Atomix Theme.
///
/// This class aggregates all token sets (colors, typography, geometry)
/// into a single immutable data structure.
class AtomixThemeData {
  final AtomixColorTokens colors;
  final AtomixTypographyTokens typography;
  final AtomixSpacingTokens spacing;
  final AtomixRadiusTokens radius;

  const AtomixThemeData({
    required this.colors,
    required this.typography,
    required this.spacing,
    required this.radius,
  });

  /// Creates a copy of this theme data with the given fields replaced with the new values.
  AtomixThemeData copyWith({
    AtomixColorTokens? colors,
    AtomixTypographyTokens? typography,
    AtomixSpacingTokens? spacing,
    AtomixRadiusTokens? radius,
  }) {
    return AtomixThemeData(
      colors: colors ?? this.colors,
      typography: typography ?? this.typography,
      spacing: spacing ?? this.spacing,
      radius: radius ?? this.radius,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AtomixThemeData &&
        other.colors == colors &&
        other.typography == typography &&
        other.spacing == spacing &&
        other.radius == radius;
  }

  @override
  int get hashCode => Object.hash(colors, typography, spacing, radius);
}
