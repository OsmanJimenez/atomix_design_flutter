import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/component_readme.dart';
import 'atoms_overview_use_case.dart';

@widgetbook.UseCase(
  name: 'README',
  path: '[Atoms]/README',
  type: AtomixAtomsOverview,
)
Widget atomsReadme(BuildContext context) {
  return const ComponentReadme(
    title: 'Atomic Components',
    description: '''
Atoms are the basic building blocks of our Design System. They are the smallest functional units (like buttons, icons, or labels) that cannot be broken down further without losing their functionality.

### Core Principles
1. **Purity**: Atoms should be simple and focused on a single task.
2. **Consistency**: They use Foundation tokens (colors, spacing, shadows) to ensure a unified look.
3. **Versatility**: Atoms are designed to be reused across all Compounds (Molecules and Organisms).

### Catalog
Browse the **Overview Gallery** to see all available atoms in one place, or explore individual components to see their specific Knobs and variants.
''',
  );
}
