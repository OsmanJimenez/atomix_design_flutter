import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';
import '../../utils/knob_helpers.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Rating',
  type: AtomixRating,
)
Widget ratingPlayground(BuildContext context) {
  final rating = context.knobs.double.slider(
    label: 'Rating > Value',
    min: 0,
    max: 5,
    initialValue: 3.5,
    divisions: 10,
  );

  final size = context.knobs.double.slider(
    label: 'Rating > Size',
    min: 12,
    max: 64,
    initialValue: 24,
  );

  final useFoundationColor = context.knobs.boolean(
    label: 'Foundation > Custom Color',
    initialValue: false,
  );

  final foundationColor = useFoundationColor
      ? context.knobs.object.dropdown<Color>(
          label: 'Foundation > Color',
          options: [
            AtomixColors.warning,
            AtomixColors.primary,
            AtomixColors.success,
            AtomixColors.error,
          ],
          labelBuilder: KnobHelpers.colorLabel,
        )
      : null;

  String colorName(Color? c) {
    if (c == AtomixColors.primary) return 'AtomixColors.primary';
    if (c == AtomixColors.success) return 'AtomixColors.success';
    if (c == AtomixColors.error) return 'AtomixColors.error';
    if (c == AtomixColors.warning) return 'AtomixColors.warning';
    return 'null';
  }

  final colorStr = foundationColor != null
      ? '\n  color: ${colorName(foundationColor)},'
      : '';

  final code =
      '''AtomixRating(
  rating: $rating,
  size: $size,$colorStr
  onRatingChanged: (val) {},
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixRating(
            rating: rating,
            size: size,
            color: foundationColor,
            onRatingChanged: (_) {},
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'High Rating',
  path: '[Atoms]/Rating',
  type: AtomixRating,
)
Widget ratingHigh(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixRating(rating: 5),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixRating(rating: 5)'''),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Half Stars',
  path: '[Atoms]/Rating',
  type: AtomixRating,
)
Widget ratingHalf(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AtomixRating(rating: 2.5),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixRating(rating: 2.5)'''),
      ],
    ),
  );
}
