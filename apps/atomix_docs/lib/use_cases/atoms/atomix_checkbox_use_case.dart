import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

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

  final theme = AtomixTheme.of(context);

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

  final foundationRadius = context.knobs.object.dropdown<BorderRadius>(
    label: 'Foundation > Radius',
    options: [
      BorderRadius.all(theme.radius.xs),
      BorderRadius.all(theme.radius.sm),
      BorderRadius.all(theme.radius.md),
      BorderRadius.all(theme.radius.lg),
      BorderRadius.all(theme.radius.full),
    ],
    initialOption: BorderRadius.all(theme.radius.xs),
    labelBuilder: (r) {
      if (r == BorderRadius.all(theme.radius.xs)) return 'XS';
      if (r == BorderRadius.all(theme.radius.sm)) return 'SM';
      if (r == BorderRadius.all(theme.radius.md)) return 'MD';
      if (r == BorderRadius.all(theme.radius.lg)) return 'LG';
      if (r == BorderRadius.all(theme.radius.full)) return 'Full';
      return 'Custom';
    },
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

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    String getColorName(Color? c) {
      if (c == theme.colors.primary) return 'theme.colors.primary';
      if (c == theme.colors.secondary) return 'theme.colors.secondary';
      if (c == theme.colors.success) return 'theme.colors.success';
      if (c == theme.colors.warning) return 'theme.colors.warning';
      if (c == theme.colors.error) return 'theme.colors.error';
      if (c == theme.colors.info) return 'theme.colors.info';
      return 'null';
    }

    String getRadiusName(BorderRadius? r) {
      if (r == BorderRadius.all(theme.radius.xs))
        return 'BorderRadius.all(theme.radius.xs)';
      if (r == BorderRadius.all(theme.radius.sm))
        return 'BorderRadius.all(theme.radius.sm)';
      if (r == BorderRadius.all(theme.radius.md))
        return 'BorderRadius.all(theme.radius.md)';
      if (r == BorderRadius.all(theme.radius.lg))
        return 'BorderRadius.all(theme.radius.lg)';
      if (r == BorderRadius.all(theme.radius.full))
        return 'BorderRadius.all(theme.radius.full)';
      return 'null';
    }

    final colorStr = widget.activeColor != null
        ? '\n  activeColor: ${getColorName(widget.activeColor)},'
        : '';
    final radiusStr =
        widget.borderRadius != BorderRadius.all(theme.radius.xs) &&
            widget.borderRadius != null
        ? '\n  borderRadius: ${getRadiusName(widget.borderRadius)},'
        : '';

    final code =
        '''final theme = AtomixTheme.of(context);
AtomixCheckbox(
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
