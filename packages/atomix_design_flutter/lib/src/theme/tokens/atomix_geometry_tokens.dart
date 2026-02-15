import 'package:flutter/material.dart';

/// Defines the spacing tokens for layout and padding.
abstract class AtomixSpacingTokens {
  const AtomixSpacingTokens(); // Enable const constructors for subclasses

  double get xxs; // 4
  double get xs; // 8
  double get sm; // 12
  double get md; // 16
  double get lg; // 20
  double get xl; // 24
  double get xxl; // 32
  double get xxxl; // 40
  double get huge; // 48
  double get xhuge; // 64 (formerly section)

  double fromLevel(AtomixSpacingLevel level) {
    switch (level) {
      case AtomixSpacingLevel.xxs:
        return xxs;
      case AtomixSpacingLevel.xs:
        return xs;
      case AtomixSpacingLevel.sm:
        return sm;
      case AtomixSpacingLevel.md:
        return md;
      case AtomixSpacingLevel.lg:
        return lg;
      case AtomixSpacingLevel.xl:
        return xl;
      case AtomixSpacingLevel.xxl:
        return xxl;
      case AtomixSpacingLevel.xxxl:
        return xxxl;
      case AtomixSpacingLevel.huge:
        return huge;
      case AtomixSpacingLevel.xhuge:
        return xhuge;
    }
  }
}

enum AtomixSpacingLevel { xxs, xs, sm, md, lg, xl, xxl, xxxl, huge, xhuge }

/// Defines the border radius tokens for shapes.
abstract class AtomixRadiusTokens {
  const AtomixRadiusTokens();

  Radius get xs; // 4
  Radius get sm; // 8
  Radius get md; // 12
  Radius get lg; // 16
  Radius get xl; // 24
  Radius get full; // 9999

  Radius fromLevel(AtomixRadiusLevel level) {
    switch (level) {
      case AtomixRadiusLevel.xs:
        return xs;
      case AtomixRadiusLevel.sm:
        return sm;
      case AtomixRadiusLevel.md:
        return md;
      case AtomixRadiusLevel.lg:
        return lg;
      case AtomixRadiusLevel.xl:
        return xl;
      case AtomixRadiusLevel.full:
        return full;
    }
  }
}

enum AtomixRadiusLevel { xs, sm, md, lg, xl, full }
