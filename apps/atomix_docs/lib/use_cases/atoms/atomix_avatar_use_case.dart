import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

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

  final forceError = context.knobs.boolean(
    label: 'Avatar > Force Error (Test Fallback)',
    initialValue: false,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Color',
    initialValue: false,
  );

  final theme = AtomixTheme.of(context);

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            theme.colors.primary,
            theme.colors.secondary,
            theme.colors.success,
            theme.colors.warning,
            theme.colors.error,
            theme.colors.info,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.secondary) return 'Secondary';
            if (c == theme.colors.success) return 'Success';
            if (c == theme.colors.warning) return 'Warning';
            if (c == theme.colors.error) return 'Error';
            if (c == theme.colors.info) return 'Info';
            return 'Custom';
          },
        )
      : null;

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      BorderRadius.zero,
      BorderRadius.all(theme.radius.xs),
      BorderRadius.all(theme.radius.sm),
      BorderRadius.all(theme.radius.md),
      BorderRadius.all(theme.radius.lg),
      BorderRadius.circular(size),
    ],
    initialOption: BorderRadius.circular(80),
    labelBuilder: (r) {
      if (r == BorderRadius.zero) return 'Zero';
      if (r == BorderRadius.all(theme.radius.xs)) return 'XS';
      if (r == BorderRadius.all(theme.radius.sm)) return 'SM';
      if (r == BorderRadius.all(theme.radius.md)) return 'MD';
      if (r == BorderRadius.all(theme.radius.lg)) return 'LG';
      return 'Circular';
    },
  );

  return _AvatarPlaygroundWrapper(
    size: size,
    initials: initials,
    imageUrl: useImage
        ? (forceError ? 'https://invalid-url.com/image.png' : imageUrl)
        : null,
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

  String colorName(BuildContext context, Color? color) {
    final theme = AtomixTheme.of(context);
    if (color == theme.colors.primary) return 'theme.colors.primary';
    if (color == theme.colors.secondary) return 'theme.colors.secondary';
    if (color == theme.colors.success) return 'theme.colors.success';
    if (color == theme.colors.warning) return 'theme.colors.warning';
    if (color == theme.colors.error) return 'theme.colors.error';
    if (color == theme.colors.info) return 'theme.colors.info';
    return 'null';
  }

  String radiusName(BuildContext context, BorderRadius? radius) {
    final theme = AtomixTheme.of(context);
    if (radius == BorderRadius.all(theme.radius.xs))
      return 'BorderRadius.all(theme.radius.xs)';
    if (radius == BorderRadius.all(theme.radius.sm))
      return 'BorderRadius.all(theme.radius.sm)';
    if (radius == BorderRadius.all(theme.radius.md))
      return 'BorderRadius.all(theme.radius.md)';
    if (radius == BorderRadius.all(theme.radius.lg))
      return 'BorderRadius.all(theme.radius.lg)';
    if (radius == BorderRadius.zero) return 'BorderRadius.zero';
    return 'BorderRadius.circular(\$size)';
  }

  @override
  Widget build(BuildContext context) {
    final colorStr = backgroundColor != null
        ? '\n  backgroundColor: ${colorName(context, backgroundColor)},'
        : '';
    final radiusStr = borderRadius != BorderRadius.circular(size)
        ? '\n  borderRadius: ${radiusName(context, borderRadius)},'
        : '';

    final code =
        '''final theme = AtomixTheme.of(context);
AtomixAvatar(
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
            CodeSnippet(code: code.toString()),
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
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixAvatar(
          size: 100,
          initials: 'SQ',
          borderRadius: BorderRadius.all(AtomixTheme.of(context).radius.lg),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''final theme = AtomixTheme.of(context);
AtomixAvatar(
  size: 100,
  initials: 'SQ',
  borderRadius: BorderRadius.all(theme.radius.lg),
)''',
        ),
      ],
    ),
  );
}
