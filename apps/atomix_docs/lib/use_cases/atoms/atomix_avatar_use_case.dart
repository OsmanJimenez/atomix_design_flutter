import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Avatar',
  type: AtomixAvatar,
)
Widget avatarPlayground(BuildContext context) {
  final size = context.knobs.double.slider(
    label: 'Avatar > Size',
    min: 20,
    max: 200,
    initialValue: 80,
  );

  final initials = context.knobs.string(
    label: 'Avatar > Initials',
    initialValue: 'OJ',
  );

  final imageUrl = context.knobs.string(
    label: 'Avatar > Image URL',
    initialValue: 'https://i.pravatar.cc/300',
  );

  final useImage = context.knobs.boolean(
    label: 'Avatar > Use Image',
    initialValue: true,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Color',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            AtomixColors.primary,
            AtomixColors.secondary,
            AtomixColors.success,
            AtomixColors.warning,
            AtomixColors.error,
            AtomixColors.info,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      BorderRadius.zero,
      AtomixRadius.xsBorderRadius,
      AtomixRadius.smBorderRadius,
      AtomixRadius.mdBorderRadius,
      AtomixRadius.lgBorderRadius,
      BorderRadius.circular(size),
    ],
    initialOption: BorderRadius.circular(80),
    labelBuilder: KnobHelpers.radiusLabel,
  );

  return _AvatarPlaygroundWrapper(
    size: size,
    initials: initials,
    imageUrl: useImage ? imageUrl : null,
    backgroundColor: foundationColor,
    borderRadius: foundationRadius,
  );
}

class _AvatarPlaygroundWrapper extends StatelessWidget {
  final double size;
  final String? initials;
  final String? imageUrl;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  const _AvatarPlaygroundWrapper({
    required this.size,
    this.initials,
    this.imageUrl,
    this.backgroundColor,
    this.borderRadius,
  });

  String colorName(Color? color) {
    if (color == AtomixColors.primary) return 'AtomixColors.primary';
    if (color == AtomixColors.secondary) return 'AtomixColors.secondary';
    if (color == AtomixColors.success) return 'AtomixColors.success';
    if (color == AtomixColors.warning) return 'AtomixColors.warning';
    if (color == AtomixColors.error) return 'AtomixColors.error';
    if (color == AtomixColors.info) return 'AtomixColors.info';
    return 'null';
  }

  String radiusName(BorderRadius? radius) {
    if (radius == AtomixRadius.xsBorderRadius)
      return 'AtomixRadius.xsBorderRadius';
    if (radius == AtomixRadius.smBorderRadius)
      return 'AtomixRadius.smBorderRadius';
    if (radius == AtomixRadius.mdBorderRadius)
      return 'AtomixRadius.mdBorderRadius';
    if (radius == AtomixRadius.lgBorderRadius)
      return 'AtomixRadius.lgBorderRadius';
    if (radius == BorderRadius.zero) return 'BorderRadius.zero';
    return 'BorderRadius.circular($size)';
  }

  @override
  Widget build(BuildContext context) {
    final colorStr = backgroundColor != null
        ? '\n  backgroundColor: ${colorName(backgroundColor)},'
        : '';
    final radiusStr = borderRadius != BorderRadius.circular(size)
        ? '\n  borderRadius: ${radiusName(borderRadius)},'
        : '';

    final code =
        '''AtomixAvatar(
  size: $size,
  initials: '$initials',
  ${imageUrl != null ? "imageUrl: '$imageUrl'," : "// No image"}$colorStr$radiusStr
)''';

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            AtomixAvatar(
              size: size,
              initials: initials,
              imageUrl: imageUrl,
              backgroundColor: backgroundColor,
              borderRadius: borderRadius,
            ),
            const SizedBox(height: 32),
            CodeSnippet(code: code),
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'With Image',
  path: '[Atoms]/Avatar',
  type: AtomixAvatar,
)
Widget avatarWithImage(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixAvatar(size: 100, imageUrl: 'https://i.pravatar.cc/300'),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixAvatar(
  size: 100,
  imageUrl: 'https://i.pravatar.cc/300',
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Initials',
  path: '[Atoms]/Avatar',
  type: AtomixAvatar,
)
Widget avatarWithInitials(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixAvatar(size: 100, initials: 'AD'),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixAvatar(
  size: 100,
  initials: 'AD',
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Squircle',
  path: '[Atoms]/Avatar',
  type: AtomixAvatar,
)
Widget avatarSquircle(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixAvatar(
          size: 100,
          initials: 'SQ',
          borderRadius: AtomixRadius.lgBorderRadius,
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixAvatar(
  size: 100,
  initials: 'SQ',
  borderRadius: AtomixRadius.lgBorderRadius,
)''',
        ),
      ],
    ),
  );
}
