import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
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

  final theme = AtomixTheme.of(context);

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
            theme.colors.primary,
            theme.colors.secondary,
            theme.colors.success,
            theme.colors.warning,
            theme.colors.error,
            theme.colors.info,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.secondary) return 'Secondary';
            if (c == theme.colors.success) return 'Success';
            if (c == theme.colors.warning) return 'Warning';
            if (c == theme.colors.error) return 'Error';
            if (c == theme.colors.info) return 'Info';
            return 'Custom';
          },
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
    if (color == null) return 'null';
    // We access theme here as well to compare
    final theme = AtomixTheme.of(context);
    if (color == theme.colors.primary) return 'theme.colors.primary';
    if (color == theme.colors.secondary) return 'theme.colors.secondary';
    if (color == theme.colors.success) return 'theme.colors.success';
    if (color == theme.colors.warning) return 'theme.colors.warning';
    if (color == theme.colors.error) return 'theme.colors.error';
    if (color == theme.colors.info) return 'theme.colors.info';
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
