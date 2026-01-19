import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(name: 'Playground', path: '[Atoms]/Link', type: AtomixLink)
Widget linkPlayground(BuildContext context) {
  final text = context.knobs.string(
    label: 'Link > Text',
    initialValue: 'Click here to learn more',
  );

  final underlineOnHover = context.knobs.boolean(
    label: 'Link > Underline on Hover',
    initialValue: false,
  );

  final isDisabled = context.knobs.boolean(
    label: 'Link > Is Disabled',
    initialValue: false,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Color',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            AtomixColors.primary,
            AtomixColors.secondary,
            AtomixColors.info,
            AtomixColors.success,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  String colorName(Color? c) {
    if (c == AtomixColors.primary) return 'AtomixColors.primary';
    if (c == AtomixColors.secondary) return 'AtomixColors.secondary';
    if (c == AtomixColors.info) return 'AtomixColors.info';
    if (c == AtomixColors.success) return 'AtomixColors.success';
    return 'null';
  }

  final colorStr = foundationColor != null
      ? '\n  color: ${colorName(foundationColor)},'
      : '';

  final code =
      '''AtomixLink(
  text: '$text',
  underlineOnHover: $underlineOnHover,${isDisabled ? '\n  onTap: null,' : '\n  onTap: () {},'}$colorStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixLink(
            text: text,
            underlineOnHover: underlineOnHover,
            onTap: isDisabled ? null : () {},
            color: foundationColor,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Default', path: '[Atoms]/Link', type: AtomixLink)
Widget linkDefault(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixLink(text: 'Standard Link', onTap: null),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixLink(
  text: 'Standard Link',
  onTap: () {},
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Underline on Hover',
  path: '[Atoms]/Link',
  type: AtomixLink,
)
Widget linkHover(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixLink(text: 'Hover me (Web)', underlineOnHover: true, onTap: null),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixLink(
  text: 'Hover me',
  underlineOnHover: true,
  onTap: () {},
)''',
        ),
      ],
    ),
  );
}
