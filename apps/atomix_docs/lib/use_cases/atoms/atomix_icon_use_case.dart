import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import '../../widgets/code_snippet.dart';

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

  final theme = AtomixTheme.of(context);

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            theme.colors.primary,
            theme.colors.secondary,
            theme.colors.success,
            theme.colors.error,
            theme.colors.info,
            theme.colors.warning,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.secondary) return 'Secondary';
            if (c == theme.colors.success) return 'Success';
            if (c == theme.colors.error) return 'Error';
            if (c == theme.colors.info) return 'Info';
            if (c == theme.colors.warning) return 'Warning';
            return 'Custom';
          },
        )
      : null;

  // Helper strings
  final iconName = icon.toString().split('(').last.split(')').first;

  String colorName(Color? c) {
    if (c == theme.colors.primary) return 'theme.colors.primary';
    if (c == theme.colors.secondary) return 'theme.colors.secondary';
    if (c == theme.colors.success) return 'theme.colors.success';
    if (c == theme.colors.error) return 'theme.colors.error';
    if (c == theme.colors.info) return 'theme.colors.info';
    if (c == theme.colors.warning) return 'theme.colors.warning';
    return 'null';
  }

  final colorStr = useFoundationColor
      ? '\n  color: ${colorName(foundationColor)},'
      : '';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixIcon(
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
  final theme = AtomixTheme.of(context);
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AtomixIcon(Icons.star, color: theme.colors.primary),
              const SizedBox(width: 16),
              AtomixIcon(Icons.check_circle, color: theme.colors.success),
              const SizedBox(width: 16),
              AtomixIcon(Icons.error, color: theme.colors.error),
              const SizedBox(width: 16),
              AtomixIcon(Icons.info, color: theme.colors.info),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''final theme = AtomixTheme.of(context);
Row(
  children: [
    AtomixIcon(Icons.star, color: theme.colors.primary),
    AtomixIcon(Icons.check_circle, color: theme.colors.success),
    AtomixIcon(Icons.error, color: theme.colors.error),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}
