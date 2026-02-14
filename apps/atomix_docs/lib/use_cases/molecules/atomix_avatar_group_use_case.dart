import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/Avatar Group',
  type: AtomixAvatarGroup,
)
Widget atomixAvatarGroupPlayground(BuildContext context) {
  final size = context.knobs.double.slider(
    label: 'Size',
    initialValue: 40,
    min: 20,
    max: 80,
  );
  final overlap = context.knobs.double.slider(
    label: 'Overlap Fraction',
    initialValue: 0.3,
    min: 0.0,
    max: 0.8,
  );
  final maxVisible = context.knobs.double
      .slider(label: 'Max Visible', initialValue: 5, min: 1, max: 10)
      .toInt();

  final avatars = [
    const AtomixAvatar(initials: 'AB'),
    const AtomixAvatar(initials: 'CD'),
    const AtomixAvatar(initials: 'EF'),
    const AtomixAvatar(initials: 'GH'),
    const AtomixAvatar(initials: 'IJ'),
    const AtomixAvatar(initials: 'KL'),
    const AtomixAvatar(initials: 'MN'),
  ];

  final code =
      '''AtomixAvatarGroup(
  size: $size,
  overlapFraction: $overlap,
  maxVisible: $maxVisible,
  avatars: [ ... ],
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixAvatarGroup(
          size: size,
          overlapFraction: overlap,
          maxVisible: maxVisible,
          avatars: avatars,
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Small',
  path: '[Molecules]/Avatar Group',
  type: AtomixAvatarGroup,
)
Widget atomixAvatarGroupSmall(BuildContext context) {
  return const Center(
    child: AtomixAvatarGroup(
      size: 24,
      overlapFraction: 0.4,
      avatars: [
        AtomixAvatar(initials: 'A'),
        AtomixAvatar(initials: 'B'),
        AtomixAvatar(initials: 'C'),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Excess (Remaining Count)',
  path: '[Molecules]/Avatar Group',
  type: AtomixAvatarGroup,
)
Widget atomixAvatarGroupExcess(BuildContext context) {
  return const Center(
    child: AtomixAvatarGroup(
      size: 48,
      maxVisible: 3,
      avatars: [
        AtomixAvatar(initials: 'U1'),
        AtomixAvatar(initials: 'U2'),
        AtomixAvatar(initials: 'U3'),
        AtomixAvatar(initials: 'U4'),
        AtomixAvatar(initials: 'U5'),
      ],
    ),
  );
}
