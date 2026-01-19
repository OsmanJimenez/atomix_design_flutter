import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Checkbox',
  type: AtomixCheckbox,
)
Widget checkboxPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Checkbox > Label',
    initialValue: 'Accept Terms',
  );

  final isError = context.knobs.boolean(
    label: 'Checkbox > Is Error',
    initialValue: false,
  );

  final isDisabled = context.knobs.boolean(
    label: 'Checkbox > Is Disabled',
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

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      AtomixRadius.xsBorderRadius,
      AtomixRadius.smBorderRadius,
      AtomixRadius.mdBorderRadius,
      AtomixRadius.lgBorderRadius,
      AtomixRadius.fullBorderRadius,
    ],
    initialOption: AtomixRadius.xsBorderRadius,
    labelBuilder: KnobHelpers.radiusLabel,
  );

  return _CheckboxPlaygroundWrapper(
    label: label,
    isError: isError,
    isDisabled: isDisabled,
    activeColor: foundationColor,
    borderRadius: foundationRadius,
  );
}

class _CheckboxPlaygroundWrapper extends StatefulWidget {
  final String label;
  final bool isError;
  final bool isDisabled;
  final Color? activeColor;
  final BorderRadius? borderRadius;

  const _CheckboxPlaygroundWrapper({
    required this.label,
    required this.isError,
    required this.isDisabled,
    this.activeColor,
    this.borderRadius,
  });

  @override
  State<_CheckboxPlaygroundWrapper> createState() =>
      _CheckboxPlaygroundWrapperState();
}

class _CheckboxPlaygroundWrapperState
    extends State<_CheckboxPlaygroundWrapper> {
  bool _value = false;

  String colorName(Color? color) {
    if (color == AtomixColors.primary) return 'AtomixColors.primary';
    if (color == AtomixColors.secondary) return 'AtomixColors.secondary';
    if (color == AtomixColors.success) return 'AtomixColors.success';
    if (color == AtomixColors.warning) return 'AtomixColors.warning';
    if (color == AtomixColors.error) return 'AtomixColors.error';
    if (color == AtomixColors.info) return 'AtomixColors.info';
    return 'null';
  }

  String radiusName(BorderRadius? radius) {
    if (radius == AtomixRadius.xsBorderRadius)
      return 'AtomixRadius.xsBorderRadius';
    if (radius == AtomixRadius.smBorderRadius)
      return 'AtomixRadius.smBorderRadius';
    if (radius == AtomixRadius.mdBorderRadius)
      return 'AtomixRadius.mdBorderRadius';
    if (radius == AtomixRadius.lgBorderRadius)
      return 'AtomixRadius.lgBorderRadius';
    if (radius == AtomixRadius.fullBorderRadius)
      return 'AtomixRadius.fullBorderRadius';
    return 'null';
  }

  @override
  Widget build(BuildContext context) {
    final colorStr = widget.activeColor != null
        ? '\n  activeColor: ${colorName(widget.activeColor)},'
        : '';
    final radiusStr = widget.borderRadius != AtomixRadius.xsBorderRadius
        ? '\n  borderRadius: ${radiusName(widget.borderRadius)},'
        : '';

    final code =
        '''AtomixCheckbox(
  value: $_value,
  label: '${widget.label}',
  isError: ${widget.isError},
  isDisabled: ${widget.isDisabled},$colorStr$radiusStr
  onChanged: (val) {
    setState(() => _value = val ?? false);
  },
)''';

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            AtomixCheckbox(
              value: _value,
              onChanged: (val) => setState(() => _value = val ?? false),
              label: widget.label,
              isError: widget.isError,
              isDisabled: widget.isDisabled,
              activeColor: widget.activeColor,
              borderRadius: widget.borderRadius,
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
  name: 'Checked',
  path: '[Atoms]/Checkbox',
  type: AtomixCheckbox,
)
Widget checkboxChecked(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixCheckbox(value: true, label: 'Checked state', onChanged: null),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixCheckbox(
  value: true,
  label: 'Checked state',
  onChanged: (val) {},
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Unchecked',
  path: '[Atoms]/Checkbox',
  type: AtomixCheckbox,
)
Widget checkboxUnchecked(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixCheckbox(value: false, label: 'Unchecked state', onChanged: null),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixCheckbox(
  value: false,
  label: 'Unchecked state',
  onChanged: (val) {},
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Error',
  path: '[Atoms]/Checkbox',
  type: AtomixCheckbox,
)
Widget checkboxError(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixCheckbox(
          value: false,
          label: 'Error state',
          isError: true,
          onChanged: null,
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixCheckbox(
  value: false,
  label: 'Error state',
  isError: true,
  onChanged: (val) {},
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Disabled',
  path: '[Atoms]/Checkbox',
  type: AtomixCheckbox,
)
Widget checkboxDisabled(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixCheckbox(
          value: true,
          label: 'Disabled checked',
          isDisabled: true,
          onChanged: null,
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixCheckbox(
  value: true,
  label: 'Disabled checked',
  isDisabled: true,
  onChanged: (val) {},
)''',
        ),
      ],
    ),
  );
}
