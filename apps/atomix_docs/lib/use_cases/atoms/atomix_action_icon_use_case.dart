import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Action Icon',
  type: AtomixActionIcon,
)
Widget atomixActionIconPlayground(BuildContext context) {
  final icon = context.knobs.object.dropdown<IconData>(
    label: 'Icon',
    options: [Icons.add, Icons.remove, Icons.edit, Icons.delete, Icons.share],
  );
  final size = context.knobs.double.slider(
    label: 'Size',
    initialValue: 24,
    min: 16,
    max: 48,
  );
  final tooltip = context.knobs.string(
    label: 'Tooltip',
    initialValue: 'Action',
  );

  final code =
      '''AtomixActionIcon(
  icon: Icons.${icon.toString().split('(').last.split(')').first},
  size: $size,
  tooltip: '$tooltip',
  onPressed: () {},
)''';

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixActionIcon(
          icon: icon,
          size: size,
          tooltip: tooltip,
          onPressed: () {},
        ),
        const SizedBox(height: 32),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Small',
  path: '[Atoms]/Action Icon',
  type: AtomixActionIcon,
)
Widget atomixActionIconSmall(BuildContext context) {
  return const Center(
    child: AtomixActionIcon(icon: Icons.edit, size: 16, tooltip: 'Edit'),
  );
}

@widgetbook.UseCase(
  name: 'Custom Color',
  path: '[Atoms]/Action Icon',
  type: AtomixActionIcon,
)
Widget atomixActionIconCustomColor(BuildContext context) {
  return const Center(
    child: AtomixActionIcon(
      icon: Icons.favorite,
      color: Colors.red,
      tooltip: 'Favorite',
    ),
  );
}
