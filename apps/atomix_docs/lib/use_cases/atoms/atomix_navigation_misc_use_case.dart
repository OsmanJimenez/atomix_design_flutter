import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Navigation & Misc',
  path: '[Atoms]',
  type: AtomixBreadcrumbItem,
)
Widget navigationMiscUseCase(BuildContext context) {
  final activeTab = context.knobs.boolean(
    label: 'Is Tab Active',
    initialValue: true,
  );

  return SingleChildScrollView(
    padding: const EdgeInsets.all(AtomixSpacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AtomixText(
          'Navigation & Misc Atoms',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.md(),
        const AtomixText(
          'Individual atomic components for navigation bars and tab systems.',
        ),
        const AtomixSpacer.xl(),

        // Breadcrumbs
        const AtomixText(
          'AtomixBreadcrumbItem',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.sm(),
        Row(
          children: [
            AtomixBreadcrumbItem(label: 'Home', onTap: () {}),
            AtomixBreadcrumbItem(label: 'Products', onTap: () {}),
            AtomixBreadcrumbItem(label: 'Details', isLast: true),
          ],
        ),
        const AtomixSpacer.lg(),

        // Tab Indicator
        const AtomixText(
          'AtomixTabIndicator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.sm(),
        SizedBox(
          width: 100,
          child: Column(
            children: [
              const AtomixText('Tab Label'),
              const AtomixSpacer.xs(),
              AtomixTabIndicator(isActive: activeTab),
            ],
          ),
        ),

        const AtomixSpacer.xl(),
        CodeSnippet(
          code:
              '''// Breadcrumb
AtomixBreadcrumbItem(
  label: 'Home',
  onTap: () {},
)

// Tab Indicator
AtomixTabIndicator(
  isActive: $activeTab,
)''',
        ),
      ],
    ),
  );
}
