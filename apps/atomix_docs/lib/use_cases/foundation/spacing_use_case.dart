import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Spacing Scale', type: AtomixSpacing)
Widget atomixSpacingShowcase(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AtomixSpacing - Design Tokens',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Cambia el espaciado en lib/src/foundation/atomix_spacing.dart',
          style: TextStyle(color: AtomixColors.textSecondary),
        ),
        const SizedBox(height: 24),

        _buildSpacingItem('xs', AtomixSpacing.xs, '4px'),
        _buildSpacingItem('sm', AtomixSpacing.sm, '8px'),
        _buildSpacingItem('md', AtomixSpacing.md, '16px'),
        _buildSpacingItem('lg', AtomixSpacing.lg, '24px'),
        _buildSpacingItem('xl', AtomixSpacing.xl, '32px'),
        _buildSpacingItem('xxl', AtomixSpacing.xxl, '48px'),

        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''// Usar espaciado
Padding(
  padding: EdgeInsets.all(AtomixSpacing.md),
  child: ...,
)

SizedBox(height: AtomixSpacing.lg)

// Cambiar espaciado globalmente
// Edita: lib/src/foundation/atomix_spacing.dart
static const double md = 16.0;''',
        ),
      ],
    ),
  );
}

Widget _buildSpacingItem(String name, double value, String pixels) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(color: AtomixColors.border),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AtomixSpacing.$name',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
              Text(
                pixels,
                style: const TextStyle(
                  fontSize: 12,
                  color: AtomixColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          width: value,
          decoration: BoxDecoration(
            color: AtomixColors.primary.withValues(alpha: 0.3),
            border: Border.all(color: AtomixColors.primary),
          ),
        ),
      ],
    ),
  );
}
