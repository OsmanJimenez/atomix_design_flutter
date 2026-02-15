import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

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
    if (color == null) return 'null';
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
