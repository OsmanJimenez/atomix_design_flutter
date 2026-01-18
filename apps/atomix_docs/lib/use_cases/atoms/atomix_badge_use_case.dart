import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Neutral', type: AtomixBadge)
Widget atomixBadgeNeutral(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixBadge(
            label: 'Neutral',
            variant: AtomixBadgeVariant.neutral,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBadge(
  label: 'Neutral',
  variant: AtomixBadgeVariant.neutral,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Success', type: AtomixBadge)
Widget atomixBadgeSuccess(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixBadge(
            label: 'Success',
            variant: AtomixBadgeVariant.success,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBadge(
  label: 'Success',
  variant: AtomixBadgeVariant.success,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Warning', type: AtomixBadge)
Widget atomixBadgeWarning(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixBadge(
            label: 'Warning',
            variant: AtomixBadgeVariant.warning,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBadge(
  label: 'Warning',
  variant: AtomixBadgeVariant.warning,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Error', type: AtomixBadge)
Widget atomixBadgeError(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixBadge(label: 'Error', variant: AtomixBadgeVariant.error),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBadge(
  label: 'Error',
  variant: AtomixBadgeVariant.error,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Info', type: AtomixBadge)
Widget atomixBadgeInfo(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixBadge(label: 'Info', variant: AtomixBadgeVariant.info),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBadge(
  label: 'Info',
  variant: AtomixBadgeVariant.info,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Icon', type: AtomixBadge)
Widget atomixBadgeWithIcon(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const AtomixBadge(
            label: 'New',
            variant: AtomixBadgeVariant.success,
            icon: Icons.star,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixBadge(
  label: 'New',
  variant: AtomixBadgeVariant.success,
  icon: Icons.star,
)''',
          ),
        ],
      ),
    ),
  );
}
