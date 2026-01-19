import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Radio',
  type: AtomixRadio,
)
Widget radioPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Radio > Label',
    initialValue: 'Option One',
  );

  final isDisabled = context.knobs.boolean(
    label: 'Radio > Is Disabled',
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

  return _RadioPlaygroundWrapper(
    label: label,
    isDisabled: isDisabled,
    activeColor: foundationColor,
  );
}

class _RadioPlaygroundWrapper extends StatefulWidget {
  final String label;
  final bool isDisabled;
  final Color? activeColor;

  const _RadioPlaygroundWrapper({
    required this.label,
    required this.isDisabled,
    this.activeColor,
  });

  @override
  State<_RadioPlaygroundWrapper> createState() =>
      _RadioPlaygroundWrapperState();
}

class _RadioPlaygroundWrapperState extends State<_RadioPlaygroundWrapper> {
  String? _selectedValue = 'Option 1';

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
        '''AtomixRadio<String>(
  value: 'Option 1',
  groupValue: '$_selectedValue',
  label: '${widget.label}',
  isDisabled: ${widget.isDisabled},$colorStr
  onChanged: (val) {
    setState(() => _selectedValue = val);
  },
)''';

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            AtomixRadio<String>(
              value: 'Option 1',
              groupValue: _selectedValue,
              label: widget.label,
              isDisabled: widget.isDisabled,
              activeColor: widget.activeColor,
              onChanged: (val) => setState(() => _selectedValue = val),
            ),
            const SizedBox(height: 32),
            CodeSnippet(code: code),
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Selected', path: '[Atoms]/Radio', type: AtomixRadio)
Widget radioSelected(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixRadio<int>(
          value: 1,
          groupValue: 1,
          label: 'Selected option',
          onChanged: null,
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixRadio<int>(
  value: 1,
  groupValue: 1,
  label: 'Selected option',
  onChanged: (val) {},
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Unselected',
  path: '[Atoms]/Radio',
  type: AtomixRadio,
)
Widget radioUnselected(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixRadio<int>(
          value: 2,
          groupValue: 1,
          label: 'Unselected option',
          onChanged: null,
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixRadio<int>(
  value: 2,
  groupValue: 1,
  label: 'Unselected option',
  onChanged: (val) {},
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', path: '[Atoms]/Radio', type: AtomixRadio)
Widget radioDisabled(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixRadio<int>(
          value: 1,
          groupValue: 1,
          label: 'Disabled selected',
          isDisabled: true,
          onChanged: null,
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixRadio<int>(
  value: 1,
  groupValue: 1,
  isDisabled: true,
  onChanged: (val) {},
)''',
        ),
      ],
    ),
  );
}
