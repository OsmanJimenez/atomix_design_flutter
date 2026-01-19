import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Elevation Levels',
  path: '[Foundation]',
  type: AtomixElevation,
)
Widget atomixElevationShowcase(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AtomixElevation - Design Tokens',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Cambia la elevación en lib/src/foundation/atomix_elevation.dart',
          style: TextStyle(color: AtomixColors.textSecondary),
        ),
        const SizedBox(height: 24),

        Wrap(
          spacing: 24,
          runSpacing: 24,
          children: [
            _buildElevationCard('none', AtomixElevation.none, '0px'),
            _buildElevationCard('xs', AtomixElevation.xs, '1px'),
            _buildElevationCard('sm', AtomixElevation.sm, '2px'),
            _buildElevationCard('md', AtomixElevation.md, '3px'),
            _buildElevationCard('lg', AtomixElevation.lg, '4px'),
            _buildElevationCard('xl', AtomixElevation.xl, '6px'),
            _buildElevationCard('xxl', AtomixElevation.xxl, '8px'),
            _buildElevationCard('max', AtomixElevation.max, '12px'),
          ],
        ),

        const SizedBox(height: 32),
        const CodeSnippet(
          code: '''// Usar elevación
Material(
  elevation: AtomixElevation.md,
  borderRadius: AtomixRadius.mdBorderRadius,
  child: Container(
    padding: EdgeInsets.all(AtomixSpacing.md),
    child: Text('Elevated Content'),
  ),
)

// Cambiar elevación globalmente
// Edita: lib/src/foundation/atomix_elevation.dart
static const double md = 3.0;''',
        ),
      ],
    ),
  );
}

Widget _buildElevationCard(String name, double value, String pixels) {
  return Column(
    children: [
      Material(
        elevation: value,
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        child: Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child: Text(
            pixels,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      const SizedBox(height: 12),
      Text(
        'Elevation.$name',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    ],
  );
}
