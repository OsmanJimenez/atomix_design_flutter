import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Thumbnail',
  type: AtomixThumbnail,
)
Widget thumbnailPlayground(BuildContext context) {
  final imageUrl = context.knobs.string(
    label: 'Thumbnail > Image URL',
    initialValue: 'https://picsum.photos/200',
  );

  final size = context.knobs.double.slider(
    label: 'Thumbnail > Size',
    min: 32,
    max: 200,
    initialValue: 80,
  );

  final hasBorder = context.knobs.boolean(
    label: 'Thumbnail > Has Border',
    initialValue: true,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Border Color',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Border Color',
          options: [
            AtomixColors.border,
            AtomixColors.primary,
            AtomixColors.success,
            AtomixColors.error,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      AtomixRadius.xsBorderRadius,
      AtomixRadius.smBorderRadius,
      AtomixRadius.mdBorderRadius,
      AtomixRadius.lgBorderRadius,
      BorderRadius.zero,
    ],
    initialOption: AtomixRadius.smBorderRadius,
    labelBuilder: KnobHelpers.radiusLabel,
  );

  String colorName(Color? c) {
    if (c == AtomixColors.primary) return 'AtomixColors.primary';
    if (c == AtomixColors.success) return 'AtomixColors.success';
    if (c == AtomixColors.error) return 'AtomixColors.error';
    if (c == AtomixColors.border) return 'AtomixColors.border';
    return 'null';
  }

  String radiusName(BorderRadius r) {
    if (r == AtomixRadius.xsBorderRadius) return 'AtomixRadius.xsBorderRadius';
    if (r == AtomixRadius.smBorderRadius) return 'AtomixRadius.smBorderRadius';
    if (r == AtomixRadius.mdBorderRadius) return 'AtomixRadius.mdBorderRadius';
    if (r == AtomixRadius.lgBorderRadius) return 'AtomixRadius.lgBorderRadius';
    return 'BorderRadius.zero';
  }

  final colorStr = foundationColor != null
      ? '\n  borderColor: ${colorName(foundationColor)},'
      : '';
  final radiusStr = foundationRadius != AtomixRadius.smBorderRadius
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''AtomixThumbnail(
  imageUrl: '$imageUrl',
  size: $size,
  hasBorder: $hasBorder,$colorStr$radiusStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixThumbnail(
            imageUrl: imageUrl,
            size: size,
            hasBorder: hasBorder,
            borderColor: foundationColor,
            borderRadius: foundationRadius,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Standard',
  path: '[Atoms]/Thumbnail',
  type: AtomixThumbnail,
)
Widget thumbnailStandard(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixThumbnail(imageUrl: 'https://picsum.photos/100', size: 64),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixThumbnail(
  imageUrl: '...',
  size: 64,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Large Round',
  path: '[Atoms]/Thumbnail',
  type: AtomixThumbnail,
)
Widget thumbnailLarge(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixThumbnail(
          imageUrl: 'https://picsum.photos/300',
          size: 150,
          borderRadius: AtomixRadius.lgBorderRadius,
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixThumbnail(
  imageUrl: '...',
  size: 150,
  borderRadius: AtomixRadius.lgBorderRadius,
)''',
        ),
      ],
    ),
  );
}
