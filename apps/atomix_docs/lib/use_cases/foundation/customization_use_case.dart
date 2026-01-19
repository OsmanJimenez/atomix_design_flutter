import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(
  name: 'Theme Customization',
  path: '[Foundation]',
  type: AtomixTheme,
)
Widget customizationGuide(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Single Source of Truth',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'El sistema de diseño está construido para que los cambios se realicen en un solo lugar y se repliquen en toda la aplicación. Aquí te explicamos cómo personalizarlo:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 32),

        _buildGuideSection(
          '🎨 Colores',
          'Para cambiar la paleta de colores global:',
          'lib/src/foundation/atomix_colors.dart',
          '''static const Color primary = Color(0xFF6366F1);
static const Color success = Color(0xFF10B981);''',
        ),

        _buildGuideSection(
          '📝 Fuentes y Tipografía',
          'Los estilos de texto y la fuente principal se definen en el tema:',
          'lib/src/foundation/atomix_theme.dart',
          '''// Dentro de _baseThemeData
fontFamily: 'Poppins',
textTheme: TextTheme(
  headlineMedium: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ),
),''',
        ),

        _buildGuideSection(
          '📐 Espaciado y Layout',
          'La escala de 4px se puede ajustar en:',
          'lib/src/foundation/atomix_spacing.dart',
          '''static const double xs = 4.0;
static const double md = 16.0;''',
        ),

        _buildGuideSection(
          '🔲 Bordes y Redondeo',
          'Ajusta la curvatura de todos los componentes:',
          'lib/src/foundation/atomix_radius.dart',
          '''static const double md = 12.0;''',
        ),

        _buildGuideSection(
          '🌑 Sombras y Profundidad',
          'Define los niveles de elevación en:',
          'lib/src/foundation/atomix_elevation.dart',
          '''static const double md = 3.0;''',
        ),

        const Divider(height: 64),
        const Text(
          'Estructura de Carpetas',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('📂 lib/src/'),
                Text('  ├── 📂 foundation/ (Tokens - Cambia aquí)'),
                Text('  ├── 📂 atoms/ (Widgets básicos)'),
                Text('  ├── 📂 molecules/ (Combinaciones simples)'),
                Text('  └── 📂 organisms/ (Componentes complejos)'),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildGuideSection(
  String title,
  String description,
  String filePath,
  String example,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Text(description),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          'Archivo: $filePath',
          style: const TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.italic,
            fontFamily: 'monospace',
          ),
        ),
      ),
      const SizedBox(height: 12),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1117),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          example,
          style: const TextStyle(
            color: Color(0xFFE6EDF3),
            fontFamily: 'monospace',
            fontSize: 13,
          ),
        ),
      ),
      const SizedBox(height: 32),
    ],
  );
}
