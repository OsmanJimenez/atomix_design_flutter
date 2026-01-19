import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(name: 'Playground', path: '[Atoms]/Tag', type: AtomixTag)
Widget tagPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Tag > Label',
    initialValue: 'Beta',
  );

  final showIcon = context.knobs.boolean(
    label: 'Tag > Show Icon',
    initialValue: true,
  );

  final color = context.knobs.object.dropdown<Color>(
    label: 'Tag > Theme Color',
    options: [
      AtomixColors.primary,
      AtomixColors.success,
      AtomixColors.error,
      AtomixColors.warning,
      AtomixColors.info,
    ],
    labelBuilder: KnobHelpers.colorLabel,
  );

  final useFoundationRadius = context.knobs.boolean(
    label: 'Foundation > Custom Radius',
    initialValue: false,
  );

  final foundationRadius = useFoundationRadius
      ? context.knobs.object.dropdown<BorderRadius>(
          label: 'Foundation > Radius',
          options: [
            AtomixRadius.xsBorderRadius,
            AtomixRadius.smBorderRadius,
            AtomixRadius.mdBorderRadius,
            AtomixRadius.lgBorderRadius,
            AtomixRadius.fullBorderRadius,
          ],
          labelBuilder: KnobHelpers.radiusLabel,
        )
      : null;

  String colorName(Color? c) {
    if (c == AtomixColors.primary) return 'AtomixColors.primary';
    if (c == AtomixColors.success) return 'AtomixColors.success';
    if (c == AtomixColors.error) return 'AtomixColors.error';
    if (c == AtomixColors.warning) return 'AtomixColors.warning';
    if (c == AtomixColors.info) return 'AtomixColors.info';
    return 'null';
  }

  String radiusName(BorderRadius? r) {
    if (r == AtomixRadius.xsBorderRadius) return 'AtomixRadius.xsBorderRadius';
    if (r == AtomixRadius.smBorderRadius) return 'AtomixRadius.smBorderRadius';
    if (r == AtomixRadius.mdBorderRadius) return 'AtomixRadius.mdBorderRadius';
    if (r == AtomixRadius.lgBorderRadius) return 'AtomixRadius.lgBorderRadius';
    if (r == AtomixRadius.fullBorderRadius)
      return 'AtomixRadius.fullBorderRadius';
    return 'null';
  }

  final radiusStr = foundationRadius != null
      ? '\n  borderRadius: ${radiusName(foundationRadius)},'
      : '';

  final code =
      '''AtomixTag(
  label: '$label',
  icon: ${showIcon ? 'Icons.label' : 'null'},
  color: ${colorName(color)},$radiusStr
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixTag(
            label: label,
            icon: showIcon ? Icons.label : null,
            color: color,
            borderRadius: foundationRadius,
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Success', path: '[Atoms]/Tag', type: AtomixTag)
Widget tagSuccess(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixTag(
          label: 'Success',
          color: AtomixColors.success,
          icon: Icons.check_circle_outline,
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixTag(
  label: 'Success',
  color: AtomixColors.success,
  icon: Icons.check_circle_outline,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Error', path: '[Atoms]/Tag', type: AtomixTag)
Widget tagError(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixTag(
          label: 'Critical',
          color: AtomixColors.error,
          icon: Icons.warning_amber_rounded,
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixTag(
  label: 'Critical',
  color: AtomixColors.error,
  icon: Icons.warning_amber_rounded,
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Info', path: '[Atoms]/Tag', type: AtomixTag)
Widget tagInfo(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixTag(
          label: 'Update Available',
          color: AtomixColors.info,
          icon: Icons.info_outline,
        ),
        SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixTag(
  label: 'Update Available',
  color: AtomixColors.info,
  icon: Icons.info_outline,
)''',
        ),
      ],
    ),
  );
}
