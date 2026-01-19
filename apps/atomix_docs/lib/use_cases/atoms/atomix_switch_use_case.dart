import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Switch',
  type: AtomixSwitch,
)
Widget switchPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Switch > Label',
    initialValue: 'Notifications',
  );

  final isDisabled = context.knobs.boolean(
    label: 'Switch > Is Disabled',
    initialValue: false,
  );

  return _SwitchPlaygroundWrapper(label: label, isDisabled: isDisabled);
}

class _SwitchPlaygroundWrapper extends StatefulWidget {
  final String label;
  final bool isDisabled;

  const _SwitchPlaygroundWrapper({
    required this.label,
    required this.isDisabled,
  });

  @override
  State<_SwitchPlaygroundWrapper> createState() =>
      _SwitchPlaygroundWrapperState();
}

class _SwitchPlaygroundWrapperState extends State<_SwitchPlaygroundWrapper> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    final code =
        '''AtomixSwitch(
  value: $_value,
  label: '${widget.label}',
  isDisabled: ${widget.isDisabled},
  onChanged: (val) {
    setState(() => _value = val);
  },
)''';

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            AtomixSwitch(
              value: _value,
              onChanged: (val) => setState(() => _value = val),
              label: widget.label,
              isDisabled: widget.isDisabled,
            ),
            const SizedBox(height: 32),
            CodeSnippet(code: code),
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(name: 'States', path: '[Atoms]/Switch', type: AtomixSwitch)
Widget switchStates(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixSwitch(value: true, label: 'Switch is ON', onChanged: null),
          SizedBox(height: 12),
          AtomixSwitch(value: false, label: 'Switch is OFF', onChanged: null),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixSwitch(
  value: true,
  label: 'Switch is ON',
  onChanged: (val) {},
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Disabled',
  path: '[Atoms]/Switch',
  type: AtomixSwitch,
)
Widget switchDisabled(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixSwitch(
            value: true,
            label: 'Disabled Active',
            isDisabled: true,
            onChanged: null,
          ),
          SizedBox(height: 12),
          AtomixSwitch(
            value: false,
            label: 'Disabled Inactive',
            isDisabled: true,
            onChanged: null,
          ),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixSwitch(
  value: true,
  isDisabled: true,
  onChanged: (val) {},
)''',
          ),
        ],
      ),
    ),
  );
}
