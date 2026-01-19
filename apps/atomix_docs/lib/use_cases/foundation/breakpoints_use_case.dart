import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Breakpoints',
  path: '[Foundation]',
  type: AtomixBreakpoints,
)
Widget breakpointsUseCase(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  String currentBreakpoint = 'XS';
  if (width >= AtomixBreakpoints.xl) {
    currentBreakpoint = 'XL (Monitor)';
  } else if (width >= AtomixBreakpoints.lg) {
    currentBreakpoint = 'LG (Desktop)';
  } else if (width >= AtomixBreakpoints.md) {
    currentBreakpoint = 'MD (Laptop/Tablet)';
  } else if (width >= AtomixBreakpoints.sm) {
    currentBreakpoint = 'SM (Tablet/Phone)';
  }

  return Padding(
    padding: const EdgeInsets.all(AtomixSpacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AtomixText(
          'AtomixBreakpoints',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.md(),
        AtomixText('Current Width: ${width.toStringAsFixed(1)}px'),
        const AtomixSpacer.xs(),
        AtomixBadge(
          label: 'Active: $currentBreakpoint',
          variant: AtomixBadgeVariant.success,
        ),
        const AtomixSpacer.xl(),
        _BreakpointTile('XS', '0px', width >= AtomixBreakpoints.xs),
        _BreakpointTile('SM', '600px', width >= AtomixBreakpoints.sm),
        _BreakpointTile('MD', '900px', width >= AtomixBreakpoints.md),
        _BreakpointTile('LG', '1200px', width >= AtomixBreakpoints.lg),
        _BreakpointTile('XL', '1536px', width >= AtomixBreakpoints.xl),
      ],
    ),
  );
}

class _BreakpointTile extends StatelessWidget {
  final String label;
  final String width;
  final bool isActive;

  const _BreakpointTile(this.label, this.width, this.isActive);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AtomixSpacing.sm),
      padding: const EdgeInsets.all(AtomixSpacing.md),
      decoration: BoxDecoration(
        color: isActive
            ? AtomixColors.primary.withValues(alpha: 0.1)
            : Colors.transparent,
        border: Border.all(
          color: isActive ? AtomixColors.primary : AtomixColors.border,
        ),
        borderRadius: AtomixRadius.mdBorderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AtomixText(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          AtomixText(width),
        ],
      ),
    );
  }
}
