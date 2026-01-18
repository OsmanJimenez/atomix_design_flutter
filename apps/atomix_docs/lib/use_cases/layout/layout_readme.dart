import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/component_readme.dart';

@widgetbook.UseCase(name: 'README', type: AtomixGrid)
Widget layoutReadme(BuildContext context) {
  return const ComponentReadme(
    title: 'Layout System',
    description: '''
The Layout System provides structural components to organize UI elements consistently.

### AtomixGrid
A responsive 12-column grid system.
- Use `AtomixCol` to specify the span (1-12).
- Automatic Gutter management using `AtomixSpacing`.

### AtomixBox
A versatile container that integrates with all Foundation tokens.
- Apply `padding`, `margin`, `radius`, and `elevation` effortlessly.
- Standardizes background management.

### Best Practices
- Use `AtomixBox` as the base for all custom containers.
- Prefer `AtomixGrid` for horizontally aligned elements to ensure responsiveness.
- Use `AtomixSpacer` for simple vertical spacing between items.
''',
  );
}
