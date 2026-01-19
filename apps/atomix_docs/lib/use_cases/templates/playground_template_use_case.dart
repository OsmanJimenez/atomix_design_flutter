import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

/// Placeholder for Template documentation
class AtomixTemplates {}

@widgetbook.UseCase(
  name: 'Page Builder',
  path: '[Templates]/Playground',
  type: AtomixTemplates,
)
Widget playgroundTemplate(BuildContext context) {
  // --- PAGE CONFIGURATION ---
  final showCode = context.knobs.boolean(
    label: 'Page > Show Generated Code',
    initialValue: false,
  );

  // Header Config
  final hasHeader = context.knobs.boolean(
    label: 'Header > Has Header',
    initialValue: true,
  );
  final headerTitle = context.knobs.string(
    label: 'Header > Title',
    initialValue: 'My App',
  );
  final headerCentered = context.knobs.boolean(
    label: 'Header > Centered',
    initialValue: false,
  );

  // Layout Config
  final layoutType = context.knobs.object.dropdown<String>(
    label: 'Layout > Type',
    options: ['Grid (Responsive)', 'Column (Vertical)'],
  );

  final globalPadding = context.knobs.object.dropdown<double>(
    label: 'Layout > Page Padding',
    options: [0, 8, 16, 24, 32],
    initialOption: 16,
  );

  // --- SLOT CONFIGURATION ---
  // We'll define 6 slots. Each slot can be a different component.

  List<Map<String, dynamic>> slots = [];

  for (int i = 1; i <= 6; i++) {
    final type = context.knobs.object.dropdown<String>(
      label: 'Slot $i > Component',
      options: [
        'None',
        'Heading',
        'Body Text',
        'Button',
        'TextField',
        'Card',
        'ListTile',
        'Chip',
        'Badge',
        'Icon',
        'Spacer',
        'Divider',
      ],
      initialOption: i == 1 ? 'Heading' : 'None',
    );

    if (type != 'None') {
      final label = context.knobs.string(
        label: 'Slot $i > Text/Label',
        initialValue: _getDefaultLabel(type, i),
      );

      final span = context.knobs.object.dropdown<int>(
        label: 'Slot $i > Grid Span',
        options: [1, 2, 3, 4, 6, 8, 9, 12],
        initialOption: 12,
      );

      slots.add({'index': i, 'type': type, 'label': label, 'span': span});
    }
  }

  // --- COMPONENT BUILDERS ---

  Widget buildComponent(String type, String label) {
    switch (type) {
      case 'Heading':
        return AtomixText(
          label,
          style: Theme.of(context).textTheme.headlineMedium,
        );
      case 'Body Text':
        return AtomixText(label, style: Theme.of(context).textTheme.bodyMedium);
      case 'Button':
        return AtomixButton(label: label, onPressed: () {});
      case 'TextField':
        return AtomixTextField(label: label, hint: 'Type something...');
      case 'Card':
        return AtomixCard(
          variant: AtomixCardVariant.elevated,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AtomixText(label),
          ),
        );
      case 'ListTile':
        return AtomixCard(
          variant: AtomixCardVariant.filled,
          child: AtomixListTile(
            title: label,
            subtitle: 'Secondary information',
            leading: Icons.info_outline,
          ),
        );
      case 'Chip':
        return Wrap(
          children: [AtomixChip(label: label, onSelected: (_) {})],
        );
      case 'Badge':
        return AtomixBadge(label: label, variant: AtomixBadgeVariant.info);
      case 'Icon':
        return const Center(
          child: AtomixIcon(Icons.star, size: 48, color: AtomixColors.primary),
        );
      case 'Spacer':
        return const AtomixSpacer.md();
      case 'Divider':
        return const AtomixDivider();
      default:
        return const SizedBox.shrink();
    }
  }

  // --- CODE GENERATION ---

  String generateCode() {
    final buffer = StringBuffer();
    buffer.writeln('Scaffold(');
    if (hasHeader) {
      buffer.writeln('  appBar: AtomixAppBar(');
      buffer.writeln("    title: '$headerTitle',");
      if (headerCentered) buffer.writeln('    centerTitle: true,');
      buffer.writeln('  ),');
    }
    buffer.writeln('  body: Padding(');
    buffer.writeln('    padding: EdgeInsets.all($globalPadding),');

    if (layoutType.startsWith('Grid')) {
      buffer.writeln('    child: AtomixGrid(');
      buffer.writeln('      children: [');
      for (var slot in slots) {
        buffer.writeln('        AtomixCol(');
        buffer.writeln('          span: ${slot['span']},');
        buffer.writeln(
          '          child: ${_getComponentCode(slot['type'], slot['label'])},',
        );
        buffer.writeln('        ),');
      }
      buffer.writeln('      ],');
      buffer.writeln('    ),');
    } else {
      buffer.writeln('    child: Column(');
      buffer.writeln('      children: [');
      for (var slot in slots) {
        buffer.writeln(
          '        ${_getComponentCode(slot['type'], slot['label'])},',
        );
        if (slot != slots.last) buffer.writeln('        SizedBox(height: 16),');
      }
      buffer.writeln('      ],');
      buffer.writeln('    ),');
    }

    buffer.writeln('  ),');
    buffer.writeln(')');
    return buffer.toString();
  }

  // --- RENDER ---

  Widget buildBody() {
    final content = layoutType.startsWith('Grid')
        ? AtomixGrid(
            children: slots
                .map(
                  (s) => AtomixCol(
                    span: s['span'],
                    child: buildComponent(s['type'], s['label']),
                  ),
                )
                .toList(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: slots
                .map(
                  (s) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: buildComponent(s['type'], s['label']),
                  ),
                )
                .toList(),
          );

    return SingleChildScrollView(
      padding: EdgeInsets.all(globalPadding),
      child: content,
    );
  }

  return Scaffold(
    appBar: hasHeader
        ? AtomixAppBar(title: headerTitle, centerTitle: headerCentered)
        : null,
    body: Column(
      children: [
        Expanded(child: buildBody()),
        if (showCode)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CodeSnippet(code: generateCode()),
          ),
      ],
    ),
  );
}

String _getDefaultLabel(String type, int index) {
  switch (type) {
    case 'Heading':
      return 'Section $index Title';
    case 'Body Text':
      return 'This is a sample description text for the section';
    case 'Button':
      return 'Click Me';
    case 'Card':
      return 'Card Content $index';
    case 'TextField':
      return 'Input $index';
    case 'ListTile':
      return 'List Item $index';
    case 'Chip':
      return 'Tag $index';
    case 'Badge':
      return 'New';
    default:
      return 'Label $index';
  }
}

String _getComponentCode(String type, String label) {
  switch (type) {
    case 'Heading':
      return "AtomixText('$label', style: textTheme.headlineMedium)";
    case 'Body Text':
      return "AtomixText('$label')";
    case 'Button':
      return "AtomixButton(label: '$label', onPressed: () {})";
    case 'TextField':
      return "AtomixTextField(label: '$label')";
    case 'Card':
      return "AtomixCard(child: Padding(padding: EdgeInsets.all(16), child: Text('$label')))";
    case 'ListTile':
      return "AtomixListTile(title: '$label')";
    case 'Chip':
      return "AtomixChip(label: '$label')";
    case 'Badge':
      return "AtomixBadge(label: '$label')";
    case 'Icon':
      return "AtomixIcon(Icons.star)";
    case 'Spacer':
      return "AtomixSpacer.md()";
    case 'Divider':
      return "AtomixDivider()";
    default:
      return "SizedBox()";
  }
}
