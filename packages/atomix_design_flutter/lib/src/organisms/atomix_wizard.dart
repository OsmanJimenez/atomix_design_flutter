import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixWizard extends StatefulWidget {
  final List<AtomixWizardStep> steps;
  final VoidCallback? onComplete;
  final VoidCallback? onCancel;

  const AtomixWizard({
    super.key,
    required this.steps,
    this.onComplete,
    this.onCancel,
  });

  @override
  State<AtomixWizard> createState() => _AtomixWizardState();
}

class _AtomixWizardState extends State<AtomixWizard> {
  int _currentStep = 0;

  void _nextStep() {
    if (_currentStep < widget.steps.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      widget.onComplete?.call();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Stepper indicator
        AtomixStepper(
          currentStep: _currentStep,
          steps: widget.steps.map((s) => AtomixStep(title: s.title)).toList(),
        ),
        const SizedBox(height: 32),
        // Current step content
        Expanded(
          child: SingleChildScrollView(
            child: widget.steps[_currentStep].content,
          ),
        ),
        const SizedBox(height: 24),
        // Navigation buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_currentStep > 0)
              AtomixButton(
                label: 'Back',
                onPressed: _previousStep,
                variant: AtomixButtonVariant.secondary,
              )
            else
              AtomixButton(
                label: 'Cancel',
                onPressed: widget.onCancel,
                variant: AtomixButtonVariant.tertiary,
              ),
            AtomixButton(
              label: _currentStep == widget.steps.length - 1
                  ? 'Complete'
                  : 'Next',
              onPressed: _nextStep,
              variant: AtomixButtonVariant.primary,
            ),
          ],
        ),
      ],
    );
  }
}

class AtomixWizardStep {
  final String title;
  final Widget content;

  const AtomixWizardStep({required this.title, required this.content});
}
