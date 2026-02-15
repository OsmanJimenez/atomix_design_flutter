import 'package:flutter/material.dart';
import '../../tokens/atomix_geometry_tokens.dart';

class AtomixRadiusTokensExpressive extends AtomixRadiusTokens {
  const AtomixRadiusTokensExpressive();

  @override
  Radius get xs => const Radius.circular(8.0); // Larger start
  @override
  Radius get sm => const Radius.circular(16.0);
  @override
  Radius get md => const Radius.circular(24.0); // Standard container
  @override
  Radius get lg => const Radius.circular(32.0);
  @override
  Radius get xl => const Radius.circular(40.0);
  @override
  Radius get full => const Radius.circular(9999.0);
}

class AtomixSpacingTokensExpressive extends AtomixSpacingTokens {
  const AtomixSpacingTokensExpressive();

  @override
  double get xxs => 4.0; // Keep small small
  @override
  double get xs => 8.0;
  @override
  double get sm => 12.0;
  @override
  double get md => 20.0; // Larger gap
  @override
  double get lg => 28.0;
  @override
  double get xl => 36.0;
  @override
  double get xxl => 48.0;
  @override
  double get xxxl => 64.0;
  @override
  double get huge => 80.0;
  @override
  double get xhuge => 96.0;
}
