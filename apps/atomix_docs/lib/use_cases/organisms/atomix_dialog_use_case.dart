import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Playground', type: AtomixDialog)
Widget atomixDialogPlayground(BuildContext context) {
  final title = context.knobs.string(
    label: 'Dialog > Title',
    initialValue: 'Confirm Action',
  );

  final content = context.knobs.string(
    label: 'Dialog > Content',
    initialValue:
        'Are you sure you want to proceed? This action cannot be undone.',
  );

  final showIcon = context.knobs.boolean(
    label: 'Dialog > Show Icon',
    initialValue: false,
  );

  final iconData = showIcon
      ? context.knobs.object.dropdown<IconData>(
          label: 'Dialog > Icon Type',
          options: [
            Icons.warning,
            Icons.info,
            Icons.help,
            Icons.check_circle,
            Icons.error,
          ],
        )
      : null;

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      AtomixRadius.xsBorderRadius,
      AtomixRadius.smBorderRadius,
      AtomixRadius.mdBorderRadius,
      AtomixRadius.lgBorderRadius,
      AtomixRadius.xlBorderRadius,
      AtomixRadius.fullBorderRadius,
    ],
    initialOption: AtomixRadius.lgBorderRadius,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Background',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Background Color',
          options: [
            AtomixColors.surface,
            AtomixColors.primary.withValues(alpha: 0.05),
            const Color(0xFFF9FAFB),
          ],
        )
      : null;

  // Helper strings
  final iconStr = showIcon
      ? '\n    icon: Icons.${iconData.toString().split('(').last.split(')').first},'
      : '';
  final radiusStr = foundationRadius != AtomixRadius.lgBorderRadius
      ? '\n    borderRadius: ...,'
      : '';
  final colorStr = useFoundationColor ? '\n    backgroundColor: ...,' : '';

  final code =
      '''showDialog(
  context: context,
  builder: (context) => AtomixDialog(
    title: '$title',
    content: '$content',$iconStr$radiusStr$colorStr
    actions: [
      AtomixButton(label: 'Cancel', ...),
      AtomixButton(label: 'Confirm', ...),
    ],
  ),
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixButton(
            label: 'Open Interactive Dialog',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AtomixDialog(
                  title: title,
                  content: content,
                  icon: iconData,
                  backgroundColor: foundationColor,
                  borderRadius: foundationRadius,
                  actions: [
                    AtomixButton(
                      label: 'Cancel',
                      onPressed: () => Navigator.pop(context),
                      variant: AtomixButtonVariant.tertiary,
                    ),
                    AtomixButton(
                      label: 'Confirm',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
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

@widgetbook.UseCase(name: 'Default', type: AtomixDialog)
Widget atomixDialogDefault(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixButton(
            label: 'Show Default Dialog',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AtomixDialog(
                  title: 'Confirm',
                  content: 'Are you sure you want to delete this item?',
                  actions: [
                    AtomixButton(
                      label: 'Cancel',
                      onPressed: () => Navigator.pop(context),
                      variant: AtomixButtonVariant.secondary,
                    ),
                    AtomixButton(
                      label: 'Delete',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixDialog(
  title: 'Confirm',
  content: 'Are you sure you want to delete this item?',
  actions: [
    AtomixButton(label: 'Cancel', ...),
    AtomixButton(label: 'Delete', ...),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Icon', type: AtomixDialog)
Widget atomixDialogWithIcon(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixButton(
            label: 'Show Dialog with Icon',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AtomixDialog(
                  title: 'Success!',
                  content: 'Your changes have been saved successfully.',
                  icon: Icons.check_circle,
                  actions: [
                    AtomixButton(
                      label: 'Great',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixDialog(
  title: 'Success!',
  content: '...',
  icon: Icons.check_circle,
  actions: [...],
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Simple Dialog', type: AtomixDialog)
Widget atomixDialogSimple(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixButton(
            label: 'Show Simple Dialog',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AtomixDialog(
                  title: 'Notice',
                  content: 'This is a simple dialog without actions.',
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixDialog(
  title: 'Notice',
  content: 'This is a simple dialog without actions.',
)''',
          ),
        ],
      ),
    ),
  );
}
