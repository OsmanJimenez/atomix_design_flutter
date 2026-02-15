import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/Stepper',
  type: AtomixStepper,
)
Widget atomixStepperPlayground(BuildContext context) {
  final direction = context.knobs.list(
    label: 'Direction',
    options: [Axis.horizontal, Axis.vertical],
    initialOption: Axis.horizontal,
    labelBuilder: (a) => a == Axis.vertical ? 'Vertical' : 'Horizontal',
  );

  return Center(child: _StepperWrapper(direction: direction));
}

class _StepperWrapper extends StatefulWidget {
  final Axis direction;

  const _StepperWrapper({required this.direction});

  @override
  State<_StepperWrapper> createState() => _StepperWrapperState();
}

class _StepperWrapperState extends State<_StepperWrapper> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final code =
        '''AtomixStepper(
  currentStep: currentStep,
  direction: Axis.${widget.direction.name},
  onStepTapped: (index) => setState(() => currentStep = index),
  steps: [
    AtomixStep(title: 'Account', subtitle: 'Personal Details'),
    AtomixStep(title: 'Address', subtitle: 'Shipping Info'),
    AtomixStep(title: 'Payment', subtitle: 'Credit Card'),
    AtomixStep(title: 'Confirm', subtitle: 'Review Order'),
  ],
)''';

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          AtomixStepper(
            currentStep: currentStep,
            direction: widget.direction,
            onStepTapped: (index) {
              setState(() {
                currentStep = index;
              });
            },
            steps: const [
              AtomixStep(title: 'Account', subtitle: 'Personal Details'),
              AtomixStep(title: 'Address', subtitle: 'Shipping Info'),
              AtomixStep(title: 'Payment', subtitle: 'Credit Card'),
              AtomixStep(title: 'Confirm', subtitle: 'Review Order'),
            ],
          ),
          const SizedBox(height: 24),
          CodeSnippet(code: code),
        ],
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Checkout Flow',
  path: '[Molecules]/Stepper',
  type: AtomixStepper,
)
Widget atomixStepperCheckout(BuildContext context) {
  return const Center(child: _StepperCheckoutWrapper());
}

class _StepperCheckoutWrapper extends StatefulWidget {
  const _StepperCheckoutWrapper();

  @override
  State<_StepperCheckoutWrapper> createState() =>
      _StepperCheckoutWrapperState();
}

class _StepperCheckoutWrapperState extends State<_StepperCheckoutWrapper> {
  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixStepper(
            currentStep: currentStep,
            onStepTapped: (index) => setState(() => currentStep = index),
            steps: const [
              AtomixStep(title: 'Cart', subtitle: 'Review Items'),
              AtomixStep(title: 'Shipping', subtitle: 'Delivery Address'),
              AtomixStep(title: 'Payment', subtitle: 'Payment Method'),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixStepper(
  currentStep: currentStep,
  onStepTapped: (index) => setState(() => currentStep = index),
  steps: [
    AtomixStep(title: 'Cart', subtitle: 'Review Items'),
    AtomixStep(title: 'Shipping', subtitle: 'Delivery Address'),
    AtomixStep(title: 'Payment', subtitle: 'Payment Method'),
  ],
)''',
          ),
        ],
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Vertical Stepper',
  path: '[Molecules]/Stepper',
  type: AtomixStepper,
)
Widget atomixStepperVertical(BuildContext context) {
  return const Center(child: _StepperVerticalWrapper());
}

class _StepperVerticalWrapper extends StatefulWidget {
  const _StepperVerticalWrapper();

  @override
  State<_StepperVerticalWrapper> createState() =>
      _StepperVerticalWrapperState();
}

class _StepperVerticalWrapperState extends State<_StepperVerticalWrapper> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixStepper(
            currentStep: currentStep,
            direction: Axis.vertical,
            onStepTapped: (index) => setState(() => currentStep = index),
            steps: const [
              AtomixStep(title: 'Sign Up', subtitle: 'Create Account'),
              AtomixStep(title: 'Verify Email', subtitle: 'Check Inbox'),
              AtomixStep(title: 'Complete Profile', subtitle: 'Add Details'),
            ],
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixStepper(
  currentStep: currentStep,
  direction: Axis.vertical,
  onStepTapped: (index) => setState(() => currentStep = index),
  steps: [
    AtomixStep(title: 'Sign Up', subtitle: 'Create Account'),
    AtomixStep(title: 'Verify Email', subtitle: 'Check Inbox'),
    AtomixStep(title: 'Complete Profile', subtitle: 'Add Details'),
  ],
)''',
          ),
        ],
      ),
    );
  }
}
