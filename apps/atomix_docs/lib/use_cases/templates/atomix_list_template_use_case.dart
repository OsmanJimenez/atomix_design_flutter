import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Templates]/List',
  type: AtomixListTemplate,
)
Widget atomixListTemplatePlayground(BuildContext context) {
  final title = context.knobs.string(
    label: 'Header Title',
    initialValue: 'My Collection',
  );

  final code =
      '''AtomixListTemplate(
  title: '$title',
  searchBar: AtomixSearchField(hintText: 'Search...'),
  items: [
    AtomixCard(child: ListTile(...)),
  ],
  floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
)''';

  return Column(
    children: [
      Expanded(
        child: AtomixListTemplate(
          title: title,
          searchBar: const AtomixSearchField(hintText: 'Search items...'),
          items: List.generate(
            5,
            (index) => AtomixCard(
              child: ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text('Item ${index + 1}'),
                subtitle: const Text('Secondary text description'),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Code:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CodeSnippet(code: code),
          ],
        ),
      ),
    ],
  );
}

@widgetbook.UseCase(
  name: 'Contact List',
  path: '[Templates]/List',
  type: AtomixListTemplate,
)
Widget atomixListTemplateContacts(BuildContext context) {
  return Column(
    children: [
      Expanded(
        child: AtomixListTemplate(
          title: 'Contacts',
          searchBar: const AtomixSearchField(hintText: 'Search by name...'),
          items: const [
            AtomixCard(
              child: AtomixUserProfile(
                name: 'Alice Johnson',
                role: 'alice@example.com',
                initials: 'AJ',
              ),
            ),
            AtomixCard(
              child: AtomixUserProfile(
                name: 'Bob Smith',
                role: 'bob@example.com',
                initials: 'BS',
              ),
            ),
            AtomixCard(
              child: AtomixUserProfile(
                name: 'Charlie Davis',
                role: 'charlie@example.com',
                initials: 'CD',
              ),
            ),
          ],
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blue,
            child: const Icon(Icons.person_add, color: Colors.white),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(24),
        child: const CodeSnippet(
          code: '''AtomixListTemplate(
  title: 'Contacts',
  searchBar: AtomixSearchField(hintText: 'Search...'),
  items: [
    AtomixCard(child: AtomixUserProfile(...)),
  ],
)''',
        ),
      ),
    ],
  );
}
