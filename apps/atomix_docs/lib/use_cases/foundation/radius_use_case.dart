import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Border Radius',
  path: '[Foundation]',
  type: AtomixRadius,
)
Widget atomixRadiusShowcase(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AtomixRadius - Design Tokens',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Cambia el border radius en lib/src/foundation/atomix_radius.dart',
          style: TextStyle(color: AtomixColors.textSecondary),
        ),
        const SizedBox(height: 24),

        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildRadiusCard('xs', AtomixRadius.xsBorderRadius, '4px'),
            _buildRadiusCard('sm', AtomixRadius.smBorderRadius, '8px'),
            _buildRadiusCard('md', AtomixRadius.mdBorderRadius, '12px'),
            _buildRadiusCard('lg', AtomixRadius.lgBorderRadius, '16px'),
            _buildRadiusCard('xl', AtomixRadius.xlBorderRadius, '24px'),
            _buildRadiusCard('full', AtomixRadius.fullBorderRadius, '9999px'),
          ],
        ),

        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''// Usar border radius
Container(
  decoration: BoxDecoration(
    borderRadius: AtomixRadius.md,
    color: Colors.blue,
  ),
)

// Cambiar radius globalmente
// Edita: lib/src/foundation/atomix_radius.dart
static final BorderRadius md = BorderRadius.circular(8);''',
        ),
      ],
    ),
  );
}

Widget _buildRadiusCard(String name, BorderRadius radius, String pixels) {
  return Column(
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: AtomixColors.primary.withValues(alpha: 0.2),
          border: Border.all(color: AtomixColors.primary, width: 2),
          borderRadius: radius,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
      Text(
        pixels,
        style: const TextStyle(fontSize: 10, color: AtomixColors.textSecondary),
      ),
    ],
  );
}
