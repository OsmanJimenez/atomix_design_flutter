import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Color Palette', type: AtomixColors)
Widget atomixColorsShowcase(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AtomixColors - Design Tokens',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Cambia estos colores en lib/src/foundation/atomix_colors.dart',
          style: TextStyle(color: AtomixColors.textSecondary),
        ),
        const SizedBox(height: 24),

        // Primary Colors
        _buildColorSection(context, 'Primary Colors', [
          _ColorItem('primary', AtomixColors.primary, '0xFF6366F1'),
          _ColorItem('primaryLight', AtomixColors.primaryLight, '0xFF818CF8'),
          _ColorItem('primaryDark', AtomixColors.primaryDark, '0xFF4F46E5'),
          _ColorItem('onPrimary', AtomixColors.onPrimary, '0xFFFFFFFF'),
        ]),

        // Secondary Colors
        _buildColorSection(context, 'Secondary Colors', [
          _ColorItem('secondary', AtomixColors.secondary, '0xFF8B5CF6'),
          _ColorItem(
            'secondaryLight',
            AtomixColors.secondaryLight,
            '0xFFA78BFA',
          ),
          _ColorItem('secondaryDark', AtomixColors.secondaryDark, '0xFF7C3AED'),
          _ColorItem('onSecondary', AtomixColors.onSecondary, '0xFFFFFFFF'),
        ]),

        // Status Colors
        _buildColorSection(context, 'Status Colors', [
          _ColorItem('success', AtomixColors.success, '0xFF10B981'),
          _ColorItem('error', AtomixColors.error, '0xFFEF4444'),
          _ColorItem('warning', AtomixColors.warning, '0xFFF59E0B'),
          _ColorItem('info', AtomixColors.info, '0xFF3B82F6'),
        ]),

        // Text Colors
        _buildColorSection(context, 'Text Colors', [
          _ColorItem('textPrimary', AtomixColors.textPrimary, '0xFF111827'),
          _ColorItem('textSecondary', AtomixColors.textSecondary, '0xFF6B7280'),
          _ColorItem('textTertiary', AtomixColors.textTertiary, '0xFF9CA3AF'),
          _ColorItem('textDisabled', AtomixColors.textDisabled, '0xFFD1D5DB'),
        ]),

        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''// Usar colores en tu app
Container(
  color: AtomixColors.primary,
  child: Text(
    'Hello',
    style: TextStyle(color: AtomixColors.onPrimary),
  ),
)

// Cambiar colores globalmente
// Edita: lib/src/foundation/atomix_colors.dart
static const Color primary = Color(0xFF6366F1);''',
        ),
      ],
    ),
  );
}

Widget _buildColorSection(
  BuildContext context,
  String title,
  List<_ColorItem> colors,
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
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: colors.map((item) => _buildColorCard(item)).toList(),
      ),
    ],
  );
}

Widget _buildColorCard(_ColorItem item) {
  return Container(
    width: 160,
    decoration: BoxDecoration(
      border: Border.all(color: AtomixColors.border),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.hex,
                style: const TextStyle(
                  fontSize: 10,
                  color: AtomixColors.textSecondary,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _ColorItem {
  final String name;
  final Color color;
  final String hex;

  _ColorItem(this.name, this.color, this.hex);
}
