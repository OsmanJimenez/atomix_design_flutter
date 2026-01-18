import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixBottomSheet)
Widget atomixBottomSheetDefault(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixButton(
            label: 'Show Bottom Sheet',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const AtomixBottomSheet(
                  title: 'Options',
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AtomixListTile(title: 'Option 1', leading: Icons.star),
                      AtomixListTile(
                        title: 'Option 2',
                        leading: Icons.favorite,
                      ),
                      AtomixListTile(title: 'Option 3', leading: Icons.share),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''showModalBottomSheet(
  context: context,
  builder: (context) => AtomixBottomSheet(
    title: 'Options',
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AtomixListTile(title: 'Option 1', leading: Icons.star),
        AtomixListTile(title: 'Option 2', leading: Icons.favorite),
        AtomixListTile(title: 'Option 3', leading: Icons.share),
      ],
    ),
  ),
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Without Handle', type: AtomixBottomSheet)
Widget atomixBottomSheetWithoutHandle(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixButton(
            label: 'Show Bottom Sheet (No Handle)',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => AtomixBottomSheet(
                  title: 'Settings',
                  showHandle: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AtomixListTile(
                        title: 'Account',
                        leading: Icons.person,
                        onTap: () {},
                      ),
                      AtomixListTile(
                        title: 'Privacy',
                        leading: Icons.lock,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''showModalBottomSheet(
  context: context,
  builder: (context) => AtomixBottomSheet(
    title: 'Settings',
    showHandle: false,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AtomixListTile(title: 'Account', leading: Icons.person),
        AtomixListTile(title: 'Privacy', leading: Icons.lock),
      ],
    ),
  ),
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Action', type: AtomixBottomSheet)
Widget atomixBottomSheetWithAction(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixButton(
            label: 'Show Bottom Sheet with Action',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => AtomixBottomSheet(
                  title: 'Share',
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Share this content with:'),
                      ),
                      AtomixListTile(
                        title: 'Twitter',
                        leading: Icons.share,
                        onTap: () {},
                      ),
                      AtomixListTile(
                        title: 'Facebook',
                        leading: Icons.share,
                        onTap: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: AtomixButton(
                          label: 'Cancel',
                          variant: AtomixButtonVariant.tertiary,
                          onPressed: () => Navigator.pop(context),
                          fullWidth: true,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''showModalBottomSheet(
  context: context,
  builder: (context) => AtomixBottomSheet(
    title: 'Share',
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Share this content with:'),
        AtomixListTile(title: 'Twitter', leading: Icons.share),
        AtomixListTile(title: 'Facebook', leading: Icons.share),
        AtomixButton(
          label: 'Cancel',
          variant: AtomixButtonVariant.tertiary,
          onPressed: () => Navigator.pop(context),
          fullWidth: true,
        ),
      ],
    ),
  ),
)''',
          ),
        ],
      ),
    ),
  );
}
