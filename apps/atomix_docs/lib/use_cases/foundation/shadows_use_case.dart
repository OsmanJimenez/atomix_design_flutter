import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Shadows', path: '[Foundation]', type: AtomixShadows)
Widget shadowsUseCase(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(AtomixSpacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AtomixText(
          'AtomixShadows',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.md(),
        const AtomixText('Modern multi-layered shadows for realistic depth.'),
        const AtomixSpacer.xl(),
        Wrap(
          spacing: AtomixSpacing.xl,
          runSpacing: AtomixSpacing.xl,
          children: [
            _ShadowBox('Level 1', AtomixShadows.level1),
            _ShadowBox('Level 2', AtomixShadows.level2),
            _ShadowBox('Level 3', AtomixShadows.level3),
            _ShadowBox('Level 4', AtomixShadows.level4),
            _ShadowBox('Level 5', AtomixShadows.level5),
            _ShadowBox('Inset', AtomixShadows.inset),
          ],
        ),
      ],
    ),
  );
}

class _ShadowBox extends StatelessWidget {
  final String label;
  final List<BoxShadow> shadows;

  const _ShadowBox(this.label, this.shadows);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AtomixRadius.lgBorderRadius,
            boxShadow: shadows,
          ),
          child: Center(child: AtomixText(label)),
        ),
      ],
    );
  }
}
