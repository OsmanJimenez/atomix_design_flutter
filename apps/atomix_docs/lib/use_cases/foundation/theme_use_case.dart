import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Theme Playground',
  type: AtomixTheme,
  path: '[Foundation]/Theme',
)
Widget buildThemePlayground(BuildContext context) {
  final theme = AtomixTheme.of(context);

  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AtomixText(
          'Current Theme Visualization',
          style: theme.typography.headlineMedium,
        ),
        AtomixText(
          'This playground visualizes the currently active theme tokens. '
          'Change the theme using the addon controls in the sidebar.',
          style: theme.typography.bodyMedium,
        ),
        const SizedBox(height: 32),
        AtomixText('Colors', style: theme.typography.headlineSmall),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _ColorSwatch('Primary', theme.colors.primary),
            _ColorSwatch('Secondary', theme.colors.secondary),
            _ColorSwatch('Surface', theme.colors.surface),
            _ColorSwatch('Success', theme.colors.success),
            _ColorSwatch('Warning', theme.colors.warning),
            _ColorSwatch('Error', theme.colors.error),
            _ColorSwatch('Info', theme.colors.info),
            _ColorSwatch('Text Primary', theme.colors.textPrimary),
            _ColorSwatch('Text Secondary', theme.colors.textSecondary),
            _ColorSwatch('Border', theme.colors.border),
          ],
        ),
        const SizedBox(height: 32),
        AtomixText('Typography', style: theme.typography.headlineSmall),
        const SizedBox(height: 16),
        _TypographySample('Display Large', theme.typography.displayLarge),
        _TypographySample('Display Medium', theme.typography.displayMedium),
        _TypographySample('Display Small', theme.typography.displaySmall),
        _TypographySample('Headline Large', theme.typography.headlineLarge),
        _TypographySample('Headline Medium', theme.typography.headlineMedium),
        _TypographySample('Headline Small', theme.typography.headlineSmall),
        _TypographySample('Title Large', theme.typography.titleLarge),
        _TypographySample('Title Medium', theme.typography.titleMedium),
        _TypographySample('Title Small', theme.typography.titleSmall),
        _TypographySample('Body Large', theme.typography.bodyLarge),
        _TypographySample('Body Medium', theme.typography.bodyMedium),
        _TypographySample('Body Small', theme.typography.bodySmall),
        _TypographySample('Label Large', theme.typography.labelLarge),
        _TypographySample('Label Medium', theme.typography.labelMedium),
        _TypographySample('Label Small', theme.typography.labelSmall),
        const SizedBox(height: 32),
        AtomixText('Radii', style: theme.typography.headlineSmall),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          children: [
            _RadiusBox('XS', theme.radius.xs),
            _RadiusBox('SM', theme.radius.sm),
            _RadiusBox('MD', theme.radius.md),
            _RadiusBox('LG', theme.radius.lg),
            _RadiusBox('XL', theme.radius.xl),
            _RadiusBox('Full', theme.radius.full),
          ],
        ),
        const SizedBox(height: 32),
        AtomixText('Spacing', style: theme.typography.headlineSmall),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          children: [
            _SpacingBox('XS', theme.spacing.xs),
            _SpacingBox('SM', theme.spacing.sm),
            _SpacingBox('MD', theme.spacing.md),
            _SpacingBox('LG', theme.spacing.lg),
            _SpacingBox('XL', theme.spacing.xl),
          ],
        ),
        const SizedBox(height: 32),
        AtomixText(
          'Live Component Preview',
          style: theme.typography.headlineSmall,
        ),
        const SizedBox(height: 16),
        AtomixCard(
          variant: AtomixCardVariant.elevated,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AtomixText('Card Title', style: theme.typography.titleLarge),
                const SizedBox(height: 8),
                const AtomixText(
                  'This card demonstrates how various components look together under the current theme.',
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    AtomixButton(
                      label: 'Primary Action',
                      onPressed: () {},
                      variant: AtomixButtonVariant.primary,
                    ),
                    const SizedBox(width: 16),
                    AtomixButton(
                      label: 'Secondary',
                      onPressed: () {},
                      variant: AtomixButtonVariant.secondary,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const AtomixTextField(
                  label: 'Input Field',
                  hint: 'Type something...',
                  prefixIcon: Icons.edit,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const AtomixChip(label: 'Chip 1', selected: true),
                    const SizedBox(width: 8),
                    const AtomixChip(label: 'Chip 2'),
                    const Spacer(),
                    AtomixSwitch(value: true, onChanged: (_) {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class _ColorSwatch extends StatelessWidget {
  final String name;
  final Color color;

  const _ColorSwatch(this.name, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.withAlpha(50)),
          ),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(
          '#${color.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}

class _TypographySample extends StatelessWidget {
  final String name;
  final TextStyle style;

  const _TypographySample(this.name, this.style);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              name,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          Expanded(
            child: Text(
              'The quick brown fox jumps over the lazy dog',
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}

class _RadiusBox extends StatelessWidget {
  final String label;
  final Radius radius;

  const _RadiusBox(this.label, this.radius);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AtomixTheme.of(context).colors.primary.withAlpha(50),
            borderRadius: BorderRadius.all(radius),
            border: Border.all(color: AtomixTheme.of(context).colors.primary),
          ),
          alignment: Alignment.center,
          child: Text(
            radius.x.toString(),
            style: TextStyle(
              color: AtomixTheme.of(context).colors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _SpacingBox extends StatelessWidget {
  final String label;
  final double spacing;

  const _SpacingBox(this.label, this.spacing);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: spacing,
          height: spacing,
          color: AtomixTheme.of(context).colors.secondary,
        ),
        const SizedBox(height: 8),
        Text('$label ($spacing)'),
      ],
    );
  }
}
