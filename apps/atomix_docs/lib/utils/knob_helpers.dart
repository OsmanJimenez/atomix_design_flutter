import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';

/// Helper class for Widgetbook knobs to show semantic names instead of raw objects.
class KnobHelpers {
  /// Returns a clean label for AtomixColors.
  static String colorLabel(Color? color) {
    if (color == null) return 'None';
    if (color == AtomixColors.primary) return 'Primary';
    if (color == AtomixColors.secondary) return 'Secondary';
    if (color == AtomixColors.success) return 'Success';
    if (color == AtomixColors.warning) return 'Warning';
    if (color == AtomixColors.error) return 'Error';
    if (color == AtomixColors.info) return 'Info';
    if (color == AtomixColors.background) return 'Background';
    if (color == AtomixColors.surface) return 'Surface';
    if (color == AtomixColors.border) return 'Border';
    if (color == AtomixColors.textPrimary) return 'Text Primary';
    if (color == AtomixColors.textSecondary) return 'Text Secondary';
    if (color == AtomixColors.textDisabled) return 'Text Disabled';
    if (color == AtomixColors.onBackground) return 'On Background';
    return 'Custom Color';
  }

  /// Returns a clean label for AtomixRadius.
  static String radiusLabel(BorderRadius? radius) {
    if (radius == null || radius == BorderRadius.zero) return 'Zero';
    if (radius == AtomixRadius.xsBorderRadius) return 'XS';
    if (radius == AtomixRadius.smBorderRadius) return 'SM';
    if (radius == AtomixRadius.mdBorderRadius) return 'MD';
    if (radius == AtomixRadius.lgBorderRadius) return 'LG';
    if (radius == AtomixRadius.fullBorderRadius) return 'Full';

    return 'Custom Radius';
  }

  /// Returns a clean label for AtomixShadows.
  static String shadowLabel(List<BoxShadow>? shadows) {
    if (shadows == null) return 'None';
    if (shadows == AtomixShadows.level1) return 'Level 1';
    if (shadows == AtomixShadows.level2) return 'Level 2';
    if (shadows == AtomixShadows.level3) return 'Level 3';
    if (shadows == AtomixShadows.level4) return 'Level 4';
    if (shadows == AtomixShadows.level5) return 'Level 5';
    if (shadows == AtomixShadows.inset) return 'Inset';
    return 'Custom Shadow';
  }
}
