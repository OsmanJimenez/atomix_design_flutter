import 'package:flutter/material.dart';
import '../../tokens/atomix_geometry_tokens.dart';

/// Material Design 3 Spacing Tokens
/// Reference: https://m3.material.io/foundations/layout/applying-layout/spacing
class AtomixSpacingTokensMaterial extends AtomixSpacingTokens {
  const AtomixSpacingTokensMaterial();

  @override
  double get xxs => 4.0; // M3 uses 4dp increments
  @override
  double get xs => 8.0;
  @override
  double get sm => 12.0;
  @override
  double get md => 16.0;
  @override
  double get lg => 20.0;
  @override
  double get xl => 24.0;
  @override
  double get xxl => 32.0;
  @override
  double get xxxl => 40.0;
  @override
  double get huge => 48.0;
  @override
  double get xhuge => 64.0;
}

/// Material Design 3 Radius Tokens
/// Reference: https://m3.material.io/styles/shape/shape-scale-tokens
class AtomixRadiusTokensMaterial extends AtomixRadiusTokens {
  const AtomixRadiusTokensMaterial();

  // M3 Shape Scale: None, Extra Small, Small, Medium, Large, Extra Large, Full
  @override
  Radius get xs => const Radius.circular(4.0); // M3 Extra Small

  @override
  Radius get sm => const Radius.circular(8.0); // M3 Small

  @override
  Radius get md => const Radius.circular(12.0); // M3 Medium

  @override
  Radius get lg => const Radius.circular(16.0); // M3 Large

  @override
  Radius get xl => const Radius.circular(28.0); // M3 Extra Large

  @override
  Radius get full => const Radius.circular(9999.0); // M3 Full (pill shape)
}
