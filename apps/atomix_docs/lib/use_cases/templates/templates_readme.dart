import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/component_readme.dart';
import 'playground_template_use_case.dart';

@widgetbook.UseCase(name: 'README', type: AtomixTemplates)
Widget templatesReadme(BuildContext context) {
  return const ComponentReadme(
    title: 'Templates',
    description: '''
Templates are high-level page layouts that demonstrate how to combine Atoms, Molecules, and Organisms into complete screens.

### Playground Template
The **Playground Template** is a dynamic tool that allows you to:
1. **Experiment with Layouts**: Test different AppBar, Body, and Footer combinations.
2. **Component Synergy**: See how components look and feel when placed together.
3. **Response Verification**: Check how your designs behave on different screen sizes using the Grid and Box systems.

Use the Knobs to customize the template parts and assembly your own screen!
''',
  );
}
