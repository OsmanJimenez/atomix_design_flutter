import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/RadioGroup',
  type: AtomixRadioGroup,
)
Widget atomixRadioGroupPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Select an Option',
  );

  final errorText = context.knobs.string(label: 'Error Text', initialValue: '');

  final direction = context.knobs.list(
    label: 'Direction',
    options: [Axis.vertical, Axis.horizontal],
    initialOption: Axis.vertical,
    labelBuilder: (a) => a == Axis.vertical ? 'Vertical' : 'Horizontal',
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: _RadioGroupWrapper(
        label: label,
        errorText: errorText.isEmpty ? null : errorText,
        direction: direction,
      ),
    ),
  );
}

class _RadioGroupWrapper extends StatefulWidget {
  final String? label;
  final String? errorText;
  final Axis direction;

  const _RadioGroupWrapper({
    this.label,
    this.errorText,
    required this.direction,
  });

  @override
  State<_RadioGroupWrapper> createState() => _RadioGroupWrapperState();
}

class _RadioGroupWrapperState extends State<_RadioGroupWrapper> {
  String groupValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    final code =
        '''AtomixRadioGroup<String>(
  label: '${widget.label}',
  direction: Axis.${widget.direction.name},
  groupValue: groupValue,
  onChanged: (value) => setState(() => groupValue = value!),
  options: [
    AtomixRadioOption(label: 'Option 1', value: 'Option 1'),
    AtomixRadioOption(label: 'Option 2', value: 'Option 2'),
    AtomixRadioOption(label: 'Option 3', value: 'Option 3', enabled: false),
    AtomixRadioOption(label: 'Option 4', value: 'Option 4'),
  ],
)''';

    return Column(
      children: [
        AtomixRadioGroup<String>(
          label: widget.label,
          errorText: widget.errorText,
          direction: widget.direction,
          groupValue: groupValue,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                groupValue = value;
              });
            }
          },
          options: const [
            AtomixRadioOption(label: 'Option 1', value: 'Option 1'),
            AtomixRadioOption(label: 'Option 2', value: 'Option 2'),
            AtomixRadioOption(
              label: 'Option 3 (Disabled)',
              value: 'Option 3',
              enabled: false,
            ),
            AtomixRadioOption(label: 'Option 4', value: 'Option 4'),
          ],
        ),
        const SizedBox(height: 24),
        CodeSnippet(code: code),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Payment Method',
  path: '[Molecules]/RadioGroup',
  type: AtomixRadioGroup,
)
Widget atomixRadioGroupPayment(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: _RadioGroupPaymentWrapper(),
    ),
  );
}

class _RadioGroupPaymentWrapper extends StatefulWidget {
  const _RadioGroupPaymentWrapper();

  @override
  State<_RadioGroupPaymentWrapper> createState() =>
      _RadioGroupPaymentWrapperState();
}

class _RadioGroupPaymentWrapperState extends State<_RadioGroupPaymentWrapper> {
  String groupValue = 'credit';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixRadioGroup<String>(
          label: 'Payment Method',
          groupValue: groupValue,
          onChanged: (value) => setState(() => groupValue = value!),
          options: const [
            AtomixRadioOption(label: 'Credit Card', value: 'credit'),
            AtomixRadioOption(label: 'PayPal', value: 'paypal'),
            AtomixRadioOption(label: 'Bank Transfer', value: 'bank'),
          ],
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixRadioGroup<String>(
  label: 'Payment Method',
  groupValue: groupValue,
  onChanged: (value) => setState(() => groupValue = value!),
  options: [
    AtomixRadioOption(label: 'Credit Card', value: 'credit'),
    AtomixRadioOption(label: 'PayPal', value: 'paypal'),
    AtomixRadioOption(label: 'Bank Transfer', value: 'bank'),
  ],
)''',
        ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Horizontal Layout',
  path: '[Molecules]/RadioGroup',
  type: AtomixRadioGroup,
)
Widget atomixRadioGroupHorizontal(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: _RadioGroupHorizontalWrapper(),
    ),
  );
}

class _RadioGroupHorizontalWrapper extends StatefulWidget {
  const _RadioGroupHorizontalWrapper();

  @override
  State<_RadioGroupHorizontalWrapper> createState() =>
      _RadioGroupHorizontalWrapperState();
}

class _RadioGroupHorizontalWrapperState
    extends State<_RadioGroupHorizontalWrapper> {
  String groupValue = 'yes';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixRadioGroup<String>(
          label: 'Subscribe to newsletter?',
          direction: Axis.horizontal,
          groupValue: groupValue,
          onChanged: (value) => setState(() => groupValue = value!),
          options: const [
            AtomixRadioOption(label: 'Yes', value: 'yes'),
            AtomixRadioOption(label: 'No', value: 'no'),
          ],
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixRadioGroup<String>(
  label: 'Subscribe to newsletter?',
  direction: Axis.horizontal,
  groupValue: groupValue,
  onChanged: (value) => setState(() => groupValue = value!),
  options: [
    AtomixRadioOption(label: 'Yes', value: 'yes'),
    AtomixRadioOption(label: 'No', value: 'no'),
  ],
)''',
        ),
      ],
    );
  }
}
