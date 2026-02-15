import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:atomix_design_flutter/src/theme/atomix_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

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

  final theme = AtomixTheme.of(context);

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            theme.colors.primary,
            theme.colors.secondary,
            theme.colors.info,
            theme.colors.success,
          ],
          labelBuilder: (c) {
            if (c == theme.colors.primary) return 'Primary';
            if (c == theme.colors.secondary) return 'Secondary';
            if (c == theme.colors.info) return 'Info';
            if (c == theme.colors.success) return 'Success';
            return 'Custom';
          },
        )
      : null;

  String colorName(Color? c) {
    if (c == theme.colors.primary) return 'theme.colors.primary';
    if (c == theme.colors.secondary) return 'theme.colors.secondary';
    if (c == theme.colors.info) return 'theme.colors.info';
    if (c == theme.colors.success) return 'theme.colors.success';
    return 'null';
  }

  final colorStr = foundationColor != null
      ? '\n  color: ${colorName(foundationColor)},'
      : '';

  final code =
      '''final theme = AtomixTheme.of(context);
AtomixLink(
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
