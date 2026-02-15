import 'package:flutter/material.dart';
import '../../tokens/atomix_geometry_tokens.dart';

/// iOS/Apple Design Spacing Tokens
/// Reference: https://developer.apple.com/design/human-interface-guidelines/layout
class AtomixSpacingTokensGlass extends AtomixSpacingTokens {
  const AtomixSpacingTokensGlass();

  // iOS uses 8pt grid system
  @override
  double get xxs => 4.0;
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

/// iOS/Apple Design Radius Tokens
/// Reference: https://developer.apple.com/design/human-interface-guidelines/components
class AtomixRadiusTokensGlass extends AtomixRadiusTokens {
  const AtomixRadiusTokensGlass();

  // iOS uses specific corner radius values
  @override
  Radius get xs => const Radius.circular(6.0); // Small components

  @override
  Radius get sm => const Radius.circular(10.0); // Buttons, small cards

  @override
  Radius get md => const Radius.circular(12.0); // Cards, sheets

  @override
  Radius get lg => const Radius.circular(16.0); // Large cards

  @override
  Radius get xl => const Radius.circular(20.0); // Modal sheets

  @override
  Radius get full => const Radius.circular(9999.0); // Circular/pill
}

/// Blur configuration for glassmorphism effect
class AtomixBlurConfig {
  final double sigmaX;
  final double sigmaY;
  final double opacity;

  const AtomixBlurConfig({
    required this.sigmaX,
    required this.sigmaY,
    required this.opacity,
  });

  /// Light blur for subtle glassmorphism
  static const light = AtomixBlurConfig(
    sigmaX: 10.0,
    sigmaY: 10.0,
    opacity: 0.7,
  );

  /// Medium blur for standard glassmorphism
  static const medium = AtomixBlurConfig(
    sigmaX: 20.0,
    sigmaY: 20.0,
    opacity: 0.8,
  );

  /// Strong blur for prominent glassmorphism
  static const strong = AtomixBlurConfig(
    sigmaX: 30.0,
    sigmaY: 30.0,
    opacity: 0.9,
  );
}
