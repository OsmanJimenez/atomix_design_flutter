import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Typography Scale', type: AtomixTypography)
Widget atomixTypographyShowcase(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AtomixTypography - Design Tokens',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Cambia la tipografía en lib/src/foundation/atomix_theme.dart',
          style: TextStyle(color: AtomixColors.textSecondary),
        ),
        const SizedBox(height: 24),

        // Display Styles
        _buildTypographySection(context, 'Display', [
          _TypographyItem(
            'displayLarge',
            Theme.of(context).textTheme.displayLarge!,
          ),
          _TypographyItem(
            'displayMedium',
            Theme.of(context).textTheme.displayMedium!,
          ),
          _TypographyItem(
            'displaySmall',
            Theme.of(context).textTheme.displaySmall!,
          ),
        ]),

        // Headline Styles
        _buildTypographySection(context, 'Headline', [
          _TypographyItem(
            'headlineLarge',
            Theme.of(context).textTheme.headlineLarge!,
          ),
          _TypographyItem(
            'headlineMedium',
            Theme.of(context).textTheme.headlineMedium!,
          ),
          _TypographyItem(
            'headlineSmall',
            Theme.of(context).textTheme.headlineSmall!,
          ),
        ]),

        // Title Styles
        _buildTypographySection(context, 'Title', [
          _TypographyItem(
            'titleLarge',
            Theme.of(context).textTheme.titleLarge!,
          ),
          _TypographyItem(
            'titleMedium',
            Theme.of(context).textTheme.titleMedium!,
          ),
          _TypographyItem(
            'titleSmall',
            Theme.of(context).textTheme.titleSmall!,
          ),
        ]),

        // Body Styles
        _buildTypographySection(context, 'Body', [
          _TypographyItem('bodyLarge', Theme.of(context).textTheme.bodyLarge!),
          _TypographyItem(
            'bodyMedium',
            Theme.of(context).textTheme.bodyMedium!,
          ),
          _TypographyItem('bodySmall', Theme.of(context).textTheme.bodySmall!),
        ]),

        // Label Styles
        _buildTypographySection(context, 'Label', [
          _TypographyItem(
            'labelLarge',
            Theme.of(context).textTheme.labelLarge!,
          ),
          _TypographyItem(
            'labelMedium',
            Theme.of(context).textTheme.labelMedium!,
          ),
          _TypographyItem(
            'labelSmall',
            Theme.of(context).textTheme.labelSmall!,
          ),
        ]),

        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''// Usar estilos de texto
Text(
  'Headline',
  style: Theme.of(context).textTheme.headlineMedium,
)

// Cambiar tipografía globalmente
// Edita: lib/src/foundation/atomix_theme.dart
TextTheme(
  headlineMedium: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ),
)''',
        ),
      ],
    ),
  );
}

Widget _buildTypographySection(
  BuildContext context,
  String title,
  List<_TypographyItem> items,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 24),
      Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 12),
      ...items.map((item) => _buildTypographyRow(item)),
    ],
  );
}

Widget _buildTypographyRow(_TypographyItem item) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      border: Border.all(color: AtomixColors.border),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Text('The quick brown fox', style: item.style),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${item.style.fontSize?.toInt()}px / ${item.style.fontWeight?.toString().split('.').last}',
                style: const TextStyle(
                  fontSize: 10,
                  color: AtomixColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _TypographyItem {
  final String name;
  final TextStyle style;

  _TypographyItem(this.name, this.style);
}
