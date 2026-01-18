import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(name: 'Primary', type: AtomixButton)
Widget atomixButtonPrimary(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Primary Button',
            variant: AtomixButtonVariant.primary,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Primary Button',
  variant: AtomixButtonVariant.primary,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Secondary', type: AtomixButton)
Widget atomixButtonSecondary(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Secondary Button',
            variant: AtomixButtonVariant.secondary,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Secondary Button',
  variant: AtomixButtonVariant.secondary,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Tertiary', type: AtomixButton)
Widget atomixButtonTertiary(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Tertiary Button',
            variant: AtomixButtonVariant.tertiary,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Tertiary Button',
  variant: AtomixButtonVariant.tertiary,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Small', type: AtomixButton)
Widget atomixButtonSmall(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Small Button',
            size: AtomixButtonSize.sm,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Small Button',
  size: AtomixButtonSize.sm,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Large', type: AtomixButton)
Widget atomixButtonLarge(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Large Button',
            size: AtomixButtonSize.lg,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Large Button',
  size: AtomixButtonSize.lg,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: AtomixButton)
Widget atomixButtonDisabled(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AtomixButton(label: 'Disabled Button', onPressed: null),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Disabled Button',
  onPressed: null, // null makes it disabled
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Loading', type: AtomixButton)
Widget atomixButtonLoading(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Loading Button',
            isLoading: true,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Loading Button',
  isLoading: true,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Icon', type: AtomixButton)
Widget atomixButtonWithIcon(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Button with Icon',
            icon: Icons.star,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Button with Icon',
  icon: Icons.star,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Full Width', type: AtomixButton)
Widget atomixButtonFullWidth(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixButton(
            label: 'Full Width Button',
            fullWidth: true,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixButton(
  label: 'Full Width Button',
  fullWidth: true,
  onPressed: () {},
)''',
          ),
        ],
      ),
    ),
  );
}
