import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/AppBar',
  type: AtomixAppBar,
)
Widget atomixAppBarPlayground(BuildContext context) {
  final title = context.knobs.string(
    label: 'AppBar > Title',
    initialValue: 'Dashboard',
  );

  final centerTitle = context.knobs.boolean(
    label: 'AppBar > Center Title',
    initialValue: false,
  );

  final elevation = context.knobs.object.dropdown<double>(
    label: 'Foundation > Elevation',
    options: [
      AtomixElevation.none,
      AtomixElevation.xs,
      AtomixElevation.sm,
      AtomixElevation.md,
      AtomixElevation.lg,
    ],
    initialOption: AtomixElevation.none,
  );

  final showLeading = context.knobs.boolean(
    label: 'AppBar > Show Leading Icon',
    initialValue: true,
  );

  final leadingIcon = showLeading
      ? context.knobs.object.dropdown<IconData>(
          label: 'AppBar > Leading Icon',
          options: [Icons.menu, Icons.arrow_back, Icons.close, Icons.home],
        )
      : null;

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Background',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Background Color',
          options: [
            AtomixColors.primary,
            AtomixColors.secondary,
            AtomixColors.surface,
            const Color(0xFF1E1E1E),
          ],
          labelBuilder: (color) {
            if (color == AtomixColors.primary) return 'Primary';
            if (color == AtomixColors.secondary) return 'Secondary';
            if (color == AtomixColors.surface) return 'Surface';
            return 'Dark Custom';
          },
        )
      : null;

  // Helper strings
  final centerStr = centerTitle ? '\n  centerTitle: true,' : '';
  final elevationStr = elevation != AtomixElevation.none
      ? '\n  elevation: $elevation,'
      : '';
  final leadingStr = showLeading
      ? '\n  leading: Icons.${leadingIcon.toString().split('(').last.split(')').first},'
      : '';
  final colorStr = useFoundationColor ? '\n  backgroundColor: ...,' : '';

  final code =
      '''Scaffold(
  appBar: AtomixAppBar(
    title: '$title',$centerStr$elevationStr$leadingStr$colorStr
    onLeadingPressed: () {},
  ),
  body: ...,
)''';

  return Scaffold(
    appBar: AtomixAppBar(
      title: title,
      centerTitle: centerTitle,
      elevation: elevation,
      leading: leadingIcon,
      backgroundColor: foundationColor,
      onLeadingPressed: () {},
    ),
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text('Use the Knobs to customize the App Bar above.'),
            const SizedBox(height: 32),
            CodeSnippet(code: code),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Default',
  path: '[Organisms]/AppBar',
  type: AtomixAppBar,
)
Widget atomixAppBarDefault(BuildContext context) {
  return Scaffold(
    appBar: const AtomixAppBar(title: 'Home'),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text('Basic App Bar with title only.'),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixAppBar(
  title: 'Home',
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Leading Icon',
  path: '[Organisms]/AppBar',
  type: AtomixAppBar,
)
Widget atomixAppBarWithLeading(BuildContext context) {
  return Scaffold(
    appBar: AtomixAppBar(
      title: 'Settings',
      leading: Icons.arrow_back,
      onLeadingPressed: () {},
    ),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text('App Bar with a back button.'),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixAppBar(
  title: 'Settings',
  leading: Icons.arrow_back,
  onLeadingPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Actions',
  path: '[Organisms]/AppBar',
  type: AtomixAppBar,
)
Widget atomixAppBarWithActions(BuildContext context) {
  return Scaffold(
    appBar: AtomixAppBar(
      title: 'Feed',
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text('App Bar with multiple actions.'),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixAppBar(
  title: 'Feed',
  actions: [
    IconButton(icon: Icon(Icons.search), onPressed: () {}),
    IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Centered Title',
  path: '[Organisms]/AppBar',
  type: AtomixAppBar,
)
Widget atomixAppBarCentered(BuildContext context) {
  return Scaffold(
    appBar: const AtomixAppBar(title: 'Profile', centerTitle: true),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text('App Bar with centered title (iOS style).'),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixAppBar(
  title: 'Profile',
  centerTitle: true,
)''',
          ),
        ],
      ),
    ),
  );
}
