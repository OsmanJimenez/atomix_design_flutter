import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(name: 'Playground', path: '[Atoms]/Icon', type: AtomixIcon)
Widget atomixIconPlayground(BuildContext context) {
  final icon = context.knobs.object.dropdown<IconData>(
    label: 'Icon > Type',
    options: [
      Icons.home,
      Icons.settings,
      Icons.person,
      Icons.favorite,
      Icons.star,
      Icons.notifications,
      Icons.search,
      Icons.email,
      Icons.check_circle,
      Icons.error,
    ],
  );

  final size = context.knobs.double.slider(
    label: 'Icon > Size',
    initialValue: 24,
    min: 12,
    max: 120,
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
            AtomixColors.error,
            AtomixColors.info,
            AtomixColors.warning,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  // Helper strings
  final iconName = icon.toString().split('(').last.split(')').first;
  final colorStr = useFoundationColor ? '\n  color: ...,' : '';

  final code =
      '''AtomixIcon(
  Icons.$iconName,
  size: $size,$colorStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixIcon(icon, size: size, color: foundationColor),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Sizes', path: '[Atoms]/Icon', type: AtomixIcon)
Widget atomixIconSizes(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AtomixIcon(Icons.favorite, size: 16),
              SizedBox(width: 16),
              AtomixIcon(Icons.favorite, size: 24),
              SizedBox(width: 16),
              AtomixIcon(Icons.favorite, size: 32),
              SizedBox(width: 16),
              AtomixIcon(Icons.favorite, size: 48),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''Row(
  children: [
    AtomixIcon(Icons.favorite, size: 16),
    AtomixIcon(Icons.favorite, size: 24),
    AtomixIcon(Icons.favorite, size: 32),
    AtomixIcon(Icons.favorite, size: 48),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Colors', path: '[Atoms]/Icon', type: AtomixIcon)
Widget atomixIconColors(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AtomixIcon(Icons.star, color: AtomixColors.primary),
              const SizedBox(width: 16),
              AtomixIcon(Icons.check_circle, color: AtomixColors.success),
              const SizedBox(width: 16),
              AtomixIcon(Icons.error, color: AtomixColors.error),
              const SizedBox(width: 16),
              AtomixIcon(Icons.info, color: AtomixColors.info),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''Row(
  children: [
    AtomixIcon(Icons.star, color: AtomixColors.primary),
    AtomixIcon(Icons.check_circle, color: AtomixColors.success),
    AtomixIcon(Icons.error, color: AtomixColors.error),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}
