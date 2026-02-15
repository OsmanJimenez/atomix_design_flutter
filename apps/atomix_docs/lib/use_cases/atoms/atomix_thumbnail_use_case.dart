import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

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

  final theme = AtomixTheme.of(context);

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Border Color',
          options: [
            theme.colors.border,
            theme.colors.primary,
            theme.colors.success,
            theme.colors.error,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.border) return 'Border';
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.success) return 'Success';
            if (c == theme.colors.error) return 'Error';
            return 'Custom';
          },
        )
      : null;

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      BorderRadius.all(theme.radius.xs),
      BorderRadius.all(theme.radius.sm),
      BorderRadius.all(theme.radius.md),
      BorderRadius.all(theme.radius.lg),
      BorderRadius.zero,
    ],
    initialOption: BorderRadius.all(theme.radius.sm),
    labelBuilder: (r) {
      if (r == BorderRadius.all(theme.radius.xs)) return 'XS';
      if (r == BorderRadius.all(theme.radius.sm)) return 'SM';
      if (r == BorderRadius.all(theme.radius.md)) return 'MD';
      if (r == BorderRadius.all(theme.radius.lg)) return 'LG';
      return 'Zero';
    },
  );

  String colorName(Color? c) {
    if (c == theme.colors.primary) return 'theme.colors.primary';
    if (c == theme.colors.success) return 'theme.colors.success';
    if (c == theme.colors.error) return 'theme.colors.error';
    if (c == theme.colors.border) return 'theme.colors.border';
    return 'null';
  }

  String radiusName(BorderRadius r) {
    if (r == BorderRadius.all(theme.radius.xs))
      return 'BorderRadius.all(theme.radius.xs)';
    if (r == BorderRadius.all(theme.radius.sm))
      return 'BorderRadius.all(theme.radius.sm)';
    if (r == BorderRadius.all(theme.radius.md))
      return 'BorderRadius.all(theme.radius.md)';
    if (r == BorderRadius.all(theme.radius.lg))
      return 'BorderRadius.all(theme.radius.lg)';
    return 'BorderRadius.zero';
  }

  final colorStr = foundationColor != null
      ? '\n  borderColor: ${colorName(foundationColor)},'
      : '';
  final radiusStr = foundationRadius != BorderRadius.all(theme.radius.sm)
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixThumbnail(
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
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixThumbnail(
          imageUrl: 'https://picsum.photos/300',
          size: 150,
          borderRadius: BorderRadius.all(AtomixTheme.of(context).radius.lg),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
AtomixThumbnail(
  imageUrl: '...',
  size: 150,
  borderRadius: BorderRadius.all(theme.radius.lg),
)''',
        ),
      ],
    ),
  );
}
