import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Playground', type: AtomixBottomSheet)
Widget atomixBottomSheetPlayground(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Sheet Title',
  );

  final showHandle = context.knobs.boolean(
    label: 'Show Handle',
    initialValue: true,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Custom Background',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.list<Color>(
          label: 'Background Color',
          options: [
            AtomixColors.surface,
            const Color(0xFFF3F4F6),
            const Color(0xFFE5E7EB),
          ],
        )
      : null;

  final foundationRadius = context.knobs.list<BorderRadius>(
    label: 'Foundation Radius (Top)',
    options: [
      const BorderRadius.vertical(top: Radius.circular(AtomixRadius.xs)),
      const BorderRadius.vertical(top: Radius.circular(AtomixRadius.sm)),
      const BorderRadius.vertical(top: Radius.circular(AtomixRadius.md)),
      const BorderRadius.vertical(top: Radius.circular(AtomixRadius.lg)),
      const BorderRadius.vertical(top: Radius.circular(AtomixRadius.xl)),
    ],
    initialOption: const BorderRadius.vertical(
      top: Radius.circular(AtomixRadius.lg),
    ),
  );

  // Helper strings
  final handleStr = !showHandle ? '\n    showHandle: false,' : '';
  final radiusStr =
      foundationRadius !=
          const BorderRadius.vertical(top: Radius.circular(AtomixRadius.lg))
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

@widgetbook.UseCase(name: 'Default', type: AtomixBottomSheet)
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
                        AtomixListTile(title: 'Option 1', leading: Icons.star),
                        AtomixListTile(
                          title: 'Option 2',
                          leading: Icons.favorite,
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

@widgetbook.UseCase(name: 'Without Handle', type: AtomixBottomSheet)
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

@widgetbook.UseCase(name: 'With Action', type: AtomixBottomSheet)
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
