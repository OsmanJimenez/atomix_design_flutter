import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Playground', type: AtomixListTile)
Widget atomixListTilePlayground(BuildContext context) {
  final title = context.knobs.string(
    label: 'ListTile > Title',
    initialValue: 'List Item Title',
  );

  final subtitle = context.knobs.string(
    label: 'ListTile > Subtitle',
    initialValue: 'Supporting text goes here',
  );

  final selected = context.knobs.boolean(
    label: 'ListTile > Selected',
    initialValue: false,
  );

  final enabled = context.knobs.boolean(
    label: 'ListTile > Enabled',
    initialValue: true,
  );

  final showLeading = context.knobs.boolean(
    label: 'ListTile > Show Leading Icon',
    initialValue: true,
  );

  final leadingIcon = showLeading
      ? context.knobs.object.dropdown<IconData>(
          label: 'ListTile > Leading Icon',
          options: [
            Icons.person,
            Icons.settings,
            Icons.info,
            Icons.email,
            Icons.notifications,
          ],
        )
      : null;

  final useFoundationColor = context.knobs.boolean(
    label: 'Tile > Custom Tile Color',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Tile > Color',
          options: [
            AtomixColors.surface,
            AtomixColors.primary.withValues(alpha: 0.1),
            AtomixColors.success.withValues(alpha: 0.1),
            AtomixColors.warning.withValues(alpha: 0.1),
            AtomixColors.error.withValues(alpha: 0.1),
          ],
          labelBuilder: (color) {
            if (color == AtomixColors.surface) return 'Surface';
            return 'Foundation Tint';
          },
        )
      : null;

  // Helper strings
  final subtitleStr = subtitle.isNotEmpty ? '\n  subtitle: \'$subtitle\',' : '';
  final leadingStr = showLeading
      ? '\n  leading: Icons.${leadingIcon.toString().split('(').last.split(')').first},'
      : '';
  final selectedStr = selected ? '\n  selected: true,' : '';
  final enabledStr = !enabled ? '\n  enabled: false,' : '';
  final colorStr = useFoundationColor ? '\n  tileColor: ...,' : '';

  final code =
      '''AtomixListTile(
  title: '$title',$subtitleStr$leadingStr$selectedStr$enabledStr$colorStr
  onTap: () {},
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixListTile(
            title: title,
            subtitle: subtitle.isEmpty ? null : subtitle,
            selected: selected,
            enabled: enabled,
            leading: leadingIcon,
            tileColor: foundationColor,
            onTap: () {},
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Default', type: AtomixListTile)
Widget atomixListTileDefault(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixListTile(title: 'Settings', leading: Icons.settings),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixListTile(
  title: 'Settings',
  leading: Icons.settings,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Subtitle', type: AtomixListTile)
Widget atomixListTileWithSubtitle(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixListTile(
            title: 'Notifications',
            subtitle: 'Manage your alert preferences',
            leading: Icons.notifications,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixListTile(
  title: 'Notifications',
  subtitle: 'Manage your alert preferences',
  leading: Icons.notifications,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Selected', type: AtomixListTile)
Widget atomixListTileSelected(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixListTile(
            title: 'Selected Item',
            subtitle: 'This item is currently active',
            selected: true,
            leading: Icons.check_circle,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixListTile(
  title: 'Selected Item',
  subtitle: 'This item is currently active',
  selected: true,
  leading: Icons.check_circle,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: AtomixListTile)
Widget atomixListTileDisabled(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixListTile(
            title: 'Disabled Item',
            subtitle: 'You cannot interact with this',
            enabled: false,
            leading: Icons.block,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixListTile(
  title: 'Disabled Item',
  subtitle: 'You cannot interact with this',
  enabled: false,
  leading: Icons.block,
)''',
          ),
        ],
      ),
    ),
  );
}
