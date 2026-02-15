import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/BottomSheet',
  type: AtomixBottomSheet,
)
Widget atomixBottomSheetPlayground(BuildContext context) {
  final title = context.knobs.string(
    label: 'BottomSheet > Title',
    initialValue: 'Sheet Title',
  );

  final showHandle = context.knobs.boolean(
    label: 'BottomSheet > Show Handle',
    initialValue: true,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Background',
    initialValue: false,
  );

  final theme = AtomixTheme.of(context);

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Background Color',
          options: [
            theme.colors.surface,
            const Color(0xFFF3F4F6),
            const Color(0xFFE5E7EB),
          ],
        )
      : null;

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius (Top)',
    options: [
      BorderRadius.vertical(top: theme.radius.xs),
      BorderRadius.vertical(top: theme.radius.sm),
      BorderRadius.vertical(top: theme.radius.md),
      BorderRadius.vertical(top: theme.radius.lg),
      BorderRadius.vertical(top: theme.radius.xl),
    ],
    initialOption: BorderRadius.vertical(top: theme.radius.lg),
  );

  // Helper strings
  final handleStr = !showHandle ? '\n    showHandle: false,' : '';
  final radiusStr =
      foundationRadius != BorderRadius.vertical(top: theme.radius.lg)
      ? '\n    borderRadius: ...,'
      : '';

  final code =
      '''showModalBottomSheet(
  context: context,
  builder: (context) => AtomixBottomSheet(
    title: '$title',$handleStr$radiusStr
    child: Padding(
      padding: EdgeInsets.all(24),
      child: Text('Sheet Content'),
    ),
  ),
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixButton(
            label: 'Open Interactive Bottom Sheet',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => AtomixBottomSheet(
                  title: title.isEmpty ? null : title,
                  showHandle: showHandle,
                  backgroundColor: foundationColor,
                  borderRadius: foundationRadius,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Interactive Bottom Sheet content goes here.',
                        ),
                        const SizedBox(height: 24),
                        AtomixButton(
                          label: 'Close',
                          onPressed: () => Navigator.pop(context),
                          fullWidth: true,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Default',
  path: '[Organisms]/BottomSheet',
  type: AtomixBottomSheet,
)
Widget atomixBottomSheetDefault(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixButton(
            label: 'Show Default Bottom Sheet',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => const AtomixBottomSheet(
                  title: 'Options',
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AtomixListTile(
                          title: 'Option 1',
                          leading: const Icon(Icons.star),
                        ),
                        AtomixListTile(
                          title: 'Option 2',
                          leading: const Icon(Icons.favorite),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBottomSheet(
  title: 'Options',
  child: Column(...),
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Without Handle',
  path: '[Organisms]/BottomSheet',
  type: AtomixBottomSheet,
)
Widget atomixBottomSheetNoHandle(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixButton(
            label: 'Show without Handle',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => const AtomixBottomSheet(
                  title: 'Settings',
                  showHandle: false,
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text('A bottom sheet without the drag handle.'),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBottomSheet(
  title: 'Settings',
  showHandle: false,
  child: ...,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Action',
  path: '[Organisms]/BottomSheet',
  type: AtomixBottomSheet,
)
Widget atomixBottomSheetWithAction(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixButton(
            label: 'Show with Action',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => AtomixBottomSheet(
                  title: 'Delete Confirmation',
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Are you sure you want to delete?'),
                        const SizedBox(height: 24),
                        AtomixButton(
                          label: 'Delete Now',
                          variant: AtomixButtonVariant.primary,
                          onPressed: () => Navigator.pop(context),
                          fullWidth: true,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBottomSheet(
  title: 'Delete Confirmation',
  child: Column(...),
)''',
          ),
        ],
      ),
    ),
  );
}
