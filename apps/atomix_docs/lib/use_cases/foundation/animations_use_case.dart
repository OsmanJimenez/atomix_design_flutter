import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Animations',
  path: '[Foundation]',
  type: AtomixAnimations,
)
Widget animationsUseCase(BuildContext context) {
  return const _AnimationsDemo();
}

class _AnimationsDemo extends StatefulWidget {
  const _AnimationsDemo();

  @override
  State<_AnimationsDemo> createState() => _AnimationsDemoState();
}

class _AnimationsDemoState extends State<_AnimationsDemo> {
  bool _moved = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AtomixSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AtomixText(
            'AtomixAnimations',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const AtomixSpacer.md(),
          const AtomixText(
            'Consistent durations and curves for a fluid experience.',
          ),
          const AtomixSpacer.xl(),
          _buildAnimationRow(
            'Fast (150ms)',
            AtomixAnimations.fast,
            AtomixAnimations.standard,
          ),
          const AtomixSpacer.lg(),
          _buildAnimationRow(
            'Medium (300ms)',
            AtomixAnimations.medium,
            AtomixAnimations.standard,
          ),
          const AtomixSpacer.lg(),
          _buildAnimationRow(
            'Slow (500ms)',
            AtomixAnimations.slow,
            AtomixAnimations.emphasized,
          ),
          const AtomixSpacer.xl(),
          AtomixButton(
            label: 'Toggle Animation',
            onPressed: () => setState(() => _moved = !_moved),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimationRow(String label, Duration duration, Curve curve) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AtomixText(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const AtomixSpacer.xs(),
        Stack(
          children: [
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AtomixColors.textDisabled.withValues(alpha: 0.1),
                borderRadius: AtomixRadius.smBorderRadius,
              ),
            ),
            AnimatedAlign(
              duration: duration,
              curve: curve,
              alignment: _moved ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  color: _moved ? AtomixColors.primary : AtomixColors.border,
                  borderRadius: AtomixRadius.smBorderRadius,
                ),
                child: const Center(
                  child: Icon(Icons.bolt, color: Colors.white, size: 20),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
