import 'package:flutter/material.dart';
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

/// Example app demonstrating Atomix Design System usage
void main() {
  runApp(const AtomixExampleApp());
}

class AtomixExampleApp extends StatelessWidget {
  const AtomixExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atomix Design System Example',
      theme: AtomixTheme.light(),
      darkTheme: AtomixTheme.dark(),
      themeMode: ThemeMode.system,
      home: const ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AtomixAppBar(title: 'Atomix Example'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AtomixSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            AtomixText(
              'Welcome to Atomix',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const AtomixSpacer.md(),

            // Badges
            const Wrap(
              spacing: AtomixSpacing.xs,
              runSpacing: AtomixSpacing.xs,
              children: [
                AtomixBadge(label: 'New', variant: AtomixBadgeVariant.success),
                AtomixBadge(label: 'Popular', variant: AtomixBadgeVariant.info),
                AtomixBadge(
                  label: 'Featured',
                  variant: AtomixBadgeVariant.warning,
                ),
              ],
            ),
            const AtomixSpacer.xl(),

            // Card with buttons
            AtomixCard(
              variant: AtomixCardVariant.elevated,
              child: Padding(
                padding: const EdgeInsets.all(AtomixSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AtomixText(
                      'Button Examples',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const AtomixSpacer.md(),
                    AtomixButton(
                      label: 'Primary Button',
                      onPressed: () {},
                      variant: AtomixButtonVariant.primary,
                      fullWidth: true,
                    ),
                    const AtomixSpacer.sm(),
                    AtomixButton(
                      label: 'Secondary Button',
                      onPressed: () {},
                      variant: AtomixButtonVariant.secondary,
                      fullWidth: true,
                    ),
                    const AtomixSpacer.sm(),
                    AtomixButton(
                      label: 'Tertiary Button',
                      onPressed: () {},
                      variant: AtomixButtonVariant.tertiary,
                      fullWidth: true,
                    ),
                  ],
                ),
              ),
            ),
            const AtomixSpacer.xl(),

            // Text Field
            const AtomixTextField(
              label: 'Email',
              hint: 'Enter your email',
              prefixIcon: Icons.email,
            ),
            const AtomixSpacer.lg(),

            // Chips
            Wrap(
              spacing: AtomixSpacing.xs,
              children: [
                AtomixChip(
                  label: 'Flutter',
                  selected: true,
                  onSelected: (selected) {},
                ),
                AtomixChip(
                  label: 'Dart',
                  selected: false,
                  onSelected: (selected) {},
                ),
                AtomixChip(
                  label: 'Material',
                  selected: false,
                  onSelected: (selected) {},
                ),
              ],
            ),
            const AtomixSpacer.xl(),

            // List Tiles
            AtomixCard(
              child: Column(
                children: [
                  AtomixListTile(
                    title: 'Settings',
                    subtitle: 'Manage your preferences',
                    leading: Icons.settings,
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const AtomixDivider(),
                  AtomixListTile(
                    title: 'Profile',
                    subtitle: 'View your profile',
                    leading: Icons.person,
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
