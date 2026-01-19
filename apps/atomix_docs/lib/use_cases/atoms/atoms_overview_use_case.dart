import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Gallery',
  path: '[Atoms]/Overview',
  type: AtomixAtomsOverview,
)
Widget atomsOverviewUseCase(BuildContext context) {
  return const AtomixAtomsOverview();
}

class AtomixAtomsOverview extends StatelessWidget {
  const AtomixAtomsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection('Action & Interaction', [
            _Item(
              'Button',
              const AtomixButton(label: 'Primary', onPressed: null),
            ),
            _Item('Chip', const AtomixChip(label: 'Molecule Chip')),
            _Item('Link', AtomixLink(text: 'Click here', onTap: () {})),
            _Item('Badge', const AtomixBadge(label: 'New')),
          ]),
          const SizedBox(height: 32),
          _buildSection('Form Controls', [
            _Item(
              'Checkbox',
              AtomixCheckbox(value: true, label: 'Checked', onChanged: (v) {}),
            ),
            _Item(
              'Radio',
              AtomixRadio(
                value: true,
                groupValue: true,
                label: 'Selected',
                onChanged: (v) {},
              ),
            ),
            _Item(
              'Switch',
              AtomixSwitch(value: true, label: 'Active', onChanged: (v) {}),
            ),
          ]),
          const SizedBox(height: 32),
          _buildSection('Feedback & Status', [
            _Item('Progress Linear', const AtomixProgressLinear(value: 0.7)),
            _Item(
              'Progress Circular',
              const AtomixProgressCircular(value: 0.7),
            ),
            _Item(
              'Shimmer',
              const AtomixShimmer(
                child: AtomixSkeleton(width: 100, height: 20),
              ),
            ),
            _Item('Rating', const AtomixRating(rating: 4)),
          ]),
          const SizedBox(height: 32),
          _buildSection('Visual & Assets', [
            _Item('Icon', const AtomixIcon(Icons.star)),
            _Item('Avatar', const AtomixAvatar(initials: 'AD')),
            _Item(
              'Thumbnail',
              const AtomixThumbnail(imageUrl: 'https://picsum.photos/50'),
            ),
            _Item('Tag', const AtomixTag(label: 'Beta')),
          ]),
          const SizedBox(height: 32),
          _buildSection('Typography & Layout', [
            _Item(
              'Text',
              AtomixText(
                'Heading Large',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            _Item('Price', const AtomixPriceText(price: 99.99)),
            _Item('Divider', const AtomixDivider()),
            _Item('Spacer', const AtomixSpacer.md()),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AtomixText(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: items,
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String label;
  final Widget widget;

  const _Item(this.label, this.widget);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget,
        const SizedBox(height: 8),
        AtomixText(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AtomixColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
