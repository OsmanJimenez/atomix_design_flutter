import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

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

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Color',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Active Color',
          options: [
            AtomixColors.primary,
            AtomixColors.secondary,
            AtomixColors.success,
            AtomixColors.warning,
            AtomixColors.error,
            AtomixColors.info,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  return _SwitchPlaygroundWrapper(
    label: label,
    isDisabled: isDisabled,
    activeColor: foundationColor,
  );
}

class _SwitchPlaygroundWrapper extends StatefulWidget {
  final String label;
  final bool isDisabled;
  final Color? activeColor;

  const _SwitchPlaygroundWrapper({
    required this.label,
    required this.isDisabled,
    this.activeColor,
  });

  @override
  State<_SwitchPlaygroundWrapper> createState() =>
      _SwitchPlaygroundWrapperState();
}

class _SwitchPlaygroundWrapperState extends State<_SwitchPlaygroundWrapper> {
  bool _value = true;

  String colorName(Color? color) {
    if (color == AtomixColors.primary) return 'AtomixColors.primary';
    if (color == AtomixColors.secondary) return 'AtomixColors.secondary';
    if (color == AtomixColors.success) return 'AtomixColors.success';
    if (color == AtomixColors.warning) return 'AtomixColors.warning';
    if (color == AtomixColors.error) return 'AtomixColors.error';
    if (color == AtomixColors.info) return 'AtomixColors.info';
    return 'null';
  }

  @override
  Widget build(BuildContext context) {
    final colorStr = widget.activeColor != null
        ? '\n  activeColor: ${colorName(widget.activeColor)},'
        : '';

    final code =
        '''AtomixSwitch(
  value: $_value,
  label: '${widget.label}',
  isDisabled: ${widget.isDisabled},$colorStr
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
              activeColor: widget.activeColor,
            ),
            const SizedBox(height: 32),
            CodeSnippet(code: code),
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Switch ON',
  path: '[Atoms]/Switch',
  type: AtomixSwitch,
)
Widget switchOn(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixSwitch(value: true, label: 'Active state', onChanged: null),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixSwitch(
  value: true,
  label: 'Active state',
  onChanged: (val) {},
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Switch OFF',
  path: '[Atoms]/Switch',
  type: AtomixSwitch,
)
Widget switchOff(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixSwitch(value: false, label: 'Inactive state', onChanged: null),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixSwitch(
  value: false,
  label: 'Inactive state',
  onChanged: (val) {},
)''',
        ),
      ],
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
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixSwitch(
          value: true,
          label: 'Disabled switch',
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
  );
}
