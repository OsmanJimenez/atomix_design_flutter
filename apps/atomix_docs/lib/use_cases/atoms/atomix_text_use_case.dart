import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(name: 'Playground', path: '[Atoms]/Text', type: AtomixText)
Widget atomixTextPlayground(BuildContext context) {
  final data = context.knobs.string(
    label: 'Text > Content',
    initialValue: 'The quick brown fox jumps over the lazy dog',
  );

  final textStyle = context.knobs.object.dropdown<TextStyle>(
    label: 'Text > Typography Style',
    options: [
      Theme.of(context).textTheme.displayLarge!,
      Theme.of(context).textTheme.headlineMedium!,
      Theme.of(context).textTheme.titleLarge!,
      Theme.of(context).textTheme.bodyLarge!,
      Theme.of(context).textTheme.bodyMedium!,
      Theme.of(context).textTheme.labelSmall!,
    ],
    labelBuilder: (style) {
      if (style.fontSize! >= 40) return 'Display Large';
      if (style.fontSize! >= 28) return 'Headline Medium';
      if (style.fontSize! >= 22) return 'Title Large';
      if (style.fontSize! >= 16) return 'Body Large';
      if (style.fontSize! >= 14) return 'Body Medium';
      return 'Label Small';
    },
  );

  final textAlign = context.knobs.object.dropdown<TextAlign>(
    label: 'Text > Align',
    options: TextAlign.values,
    labelBuilder: (value) => value.toString().split('.').last,
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
            AtomixColors.textSecondary,
            AtomixColors.success,
            AtomixColors.error,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  final code =
      '''AtomixText(
  '$data',
  style: Theme.of(context).textTheme.${textStyle.toString()},
  textAlign: $textAlign,
  color: ${useFoundationColor ? '...' : 'null'},
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixText(
            data,
            style: textStyle,
            textAlign: textAlign,
            color: foundationColor,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Heading Large',
  path: '[Atoms]/Text',
  type: AtomixText,
)
Widget atomixTextHeadingLarge(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixText(
            'Heading Large',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixText(
  'Heading Large',
  style: Theme.of(context).textTheme.headlineLarge,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Body Large', path: '[Atoms]/Text', type: AtomixText)
Widget atomixTextBodyLarge(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixText(
            'Body Large Text',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixText(
  'Body Large Text',
  style: Theme.of(context).textTheme.bodyLarge,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Body Medium', path: '[Atoms]/Text', type: AtomixText)
Widget atomixTextBodyMedium(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const AtomixText('Body Medium Text'),
          const SizedBox(height: 24),
          const CodeSnippet(code: '''AtomixText('Body Medium Text')'''),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Label Small', path: '[Atoms]/Text', type: AtomixText)
Widget atomixTextLabelSmall(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixText(
            'Label Small Text',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixText(
  'Label Small Text',
  style: Theme.of(context).textTheme.labelSmall,
)''',
          ),
        ],
      ),
    ),
  );
}
