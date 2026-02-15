import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixStepper extends StatelessWidget {
  final List<AtomixStep> steps;
  final int currentStep;
  final ValueChanged<int>? onStepTapped;
  final Axis direction;

  const AtomixStepper({
    super.key,
    required this.steps,
    this.currentStep = 0,
    this.onStepTapped,
    this.direction = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    if (direction == Axis.horizontal) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: steps.asMap().entries.map((entry) {
          final index = entry.key;
          final step = entry.value;
          final isLast = index == steps.length - 1;

          return Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildStepHeader(context, theme, step, index)),
                if (!isLast)
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 12, left: 8, right: 8),
                      height: 2,
                      color: index < currentStep
                          ? theme.colors.primary
                          : theme.colors.border,
                    ),
                  ),
              ],
            ),
          );
        }).toList(),
      );
    }

    return Column(
      children: steps.asMap().entries.map((entry) {
        final index = entry.key;
        final step = entry.value;
        return _buildStepHeader(context, theme, step, index, isVertical: true);
      }).toList(),
    );
  }

  Widget _buildStepHeader(
    BuildContext context,
    AtomixThemeData theme,
    AtomixStep step,
    int index, {
    bool isVertical = false,
  }) {
    final isActive = index == currentStep;
    final isCompleted = index < currentStep;

    final circleColor = isActive || isCompleted
        ? theme.colors.primary
        : theme.colors.surfaceVariant;
    final textColor = isActive || isCompleted
        ? theme.colors.primary
        : theme.colors.textDisabled;

    Widget circle = Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
      child: Center(
        child: isCompleted
            ? Icon(Icons.check, size: 16, color: theme.colors.onPrimary)
            : Text(
                '${index + 1}',
                style: theme.typography.labelSmall.copyWith(
                  color: isActive || isCompleted
                      ? theme.colors.onPrimary
                      : theme.colors.textSecondary,
                ),
              ),
      ),
    );

    if (onStepTapped != null) {
      circle = InkWell(
        onTap: () => onStepTapped!(index),
        borderRadius: BorderRadius.circular(12),
        child: circle,
      );
    }

    final content = Column(
      children: [
        circle,
        const SizedBox(height: 4),
        Text(
          step.title,
          textAlign: TextAlign.center,
          style: theme.typography.labelMedium.copyWith(
            color: isActive ? theme.colors.textPrimary : textColor,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (step.subtitle != null)
          Text(
            step.subtitle!,
            textAlign: TextAlign.center,
            style: theme.typography.labelSmall.copyWith(
              color: theme.colors.textSecondary,
            ),
          ),
      ],
    );

    if (isVertical) {
      return Row(
        children: [
          circle,
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                step.title,
                style: theme.typography.labelMedium.copyWith(
                  color: isActive ? theme.colors.textPrimary : textColor,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              if (step.subtitle != null)
                Text(
                  step.subtitle!,
                  style: theme.typography.labelSmall.copyWith(
                    color: theme.colors.textSecondary,
                  ),
                ),
              const SizedBox(height: 16),
            ],
          ),
        ],
      );
    }

    return content;
  }
}

class AtomixStep {
  final String title;
  final String? subtitle;
  final Widget? content;

  const AtomixStep({required this.title, this.subtitle, this.content});
}
