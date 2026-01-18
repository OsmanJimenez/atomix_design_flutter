import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

/// Placeholder for Template documentation
class AtomixTemplates {}

@widgetbook.UseCase(name: 'Full Page Playground', type: AtomixTemplates)
Widget playgroundTemplate(BuildContext context) {
  final headerOption = context.knobs.list<String>(
    label: 'Header',
    options: ['AppBar Default', 'AppBar Centered', 'None'],
  );

  final bodyOption = context.knobs.list<String>(
    label: 'Body Content',
    options: ['Grid Layout', 'Card List', 'Form Example', 'Empty'],
  );

  final footerOption = context.knobs.list<String>(
    label: 'Footer',
    options: ['Button Group', 'Bottom Sheet Style', 'None'],
  );

  Widget? buildHeader() {
    if (headerOption == 'AppBar Default') {
      return const AtomixAppBar(title: 'App Title');
    }
    if (headerOption == 'AppBar Centered') {
      return const AtomixAppBar(title: 'App Title', centerTitle: true);
    }
    return null;
  }

  Widget buildBody() {
    if (bodyOption == 'Grid Layout') {
      return Padding(
        padding: const EdgeInsets.all(AtomixSpacing.md),
        child: AtomixGrid(
          children: [
            for (int i = 0; i < 6; i++)
              AtomixCol(
                span: 6,
                child: AtomixCard(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Item $i'),
                  ),
                ),
              ),
          ],
        ),
      );
    }
    if (bodyOption == 'Card List') {
      return ListView.separated(
        padding: const EdgeInsets.all(AtomixSpacing.md),
        itemCount: 5,
        separatorBuilder: (_, __) => const AtomixSpacer.md(),
        itemBuilder: (context, index) => AtomixCard(
          child: AtomixListTile(
            title: 'Card Item $index',
            subtitle: 'This is a description',
            leading: Icons.label,
          ),
        ),
      );
    }
    if (bodyOption == 'Form Example') {
      return Padding(
        padding: const EdgeInsets.all(AtomixSpacing.lg),
        child: Column(
          children: [
            const AtomixTextField(label: 'Username', hint: 'Enter name'),
            const AtomixSpacer.md(),
            const AtomixTextField(
              label: 'Password',
              hint: 'Enter password',
              obscureText: true,
            ),
            const AtomixSpacer.lg(),
            AtomixButton(label: 'Submit', fullWidth: true, onPressed: () {}),
          ],
        ),
      );
    }
    return const Center(child: Text('Empty State'));
  }

  Widget? buildFooter() {
    if (footerOption == 'Button Group') {
      return Padding(
        padding: const EdgeInsets.all(AtomixSpacing.md),
        child: Row(
          children: [
            Expanded(
              child: AtomixButton(
                label: 'Cancel',
                variant: AtomixButtonVariant.secondary,
                onPressed: () {},
              ),
            ),
            const AtomixSpacer.horizontal(AtomixSpacing.md),
            Expanded(
              child: AtomixButton(label: 'Confirm', onPressed: () {}),
            ),
          ],
        ),
      );
    }
    if (footerOption == 'Bottom Sheet Style') {
      return AtomixBox(
        backgroundColor: Theme.of(context).cardColor,
        elevation: AtomixElevation.md,
        padding: const EdgeInsets.all(AtomixSpacing.lg),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Sticky Footer Action'),
            const AtomixSpacer.sm(),
            AtomixButton(label: 'Continue', fullWidth: true, onPressed: () {}),
          ],
        ),
      );
    }
    return null;
  }

  final header = buildHeader();

  return Scaffold(
    appBar: header is PreferredSizeWidget ? header : null,
    body: buildBody(),
    bottomNavigationBar: buildFooter(),
  );
}
