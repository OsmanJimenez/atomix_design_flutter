import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/ListTile',
  type: AtomixListTile,
)
Widget atomixListTilePlayground(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'List Item Title',
  );

  final subtitle = context.knobs.string(
    label: 'Subtitle',
    initialValue: 'This is a subtitle',
  );

  final showLeading = context.knobs.boolean(
    label: 'Show Leading',
    initialValue: true,
  );

  final showTrailing = context.knobs.boolean(
    label: 'Show Trailing',
    initialValue: true,
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: AtomixListTile(
        title: title,
        subtitle: subtitle.isNotEmpty ? subtitle : null,
        leading: showLeading ? const Icon(Icons.inbox) : null,
        trailing: showTrailing ? const Icon(Icons.chevron_right) : null,
        onTap: () {},
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Avatar',
  path: '[Molecules]/ListTile',
  type: AtomixListTile,
)
Widget atomixListTileWithAvatar(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AtomixListTile(
            title: 'John Doe',
            subtitle: 'Software Engineer',
            leading: const AtomixAvatar(initials: 'JD'),
            trailing: const Icon(Icons.more_vert),
            onTap: () {},
          ),
          const Divider(),
          AtomixListTile(
            title: 'Jane Smith',
            subtitle: 'Product Manager',
            leading: const AtomixAvatar(initials: 'JS'),
            trailing: const Icon(Icons.more_vert),
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Three Line',
  path: '[Molecules]/ListTile',
  type: AtomixListTile,
)
Widget atomixListTileThreeLine(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: AtomixListTile(
        title: 'Notification Title',
        subtitle:
            'This is a longer subtitle that spans multiple lines and provides more detailed information about the list item.',
        leading: const Icon(Icons.notifications),
        trailing: const Icon(Icons.chevron_right),
        isThreeLine: true,
        onTap: () {},
      ),
    ),
  );
}
