import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

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
    initialValue: 4.5,
  );

  final size = context.knobs.double.slider(
    label: 'Rating > Size',
    min: 12,
    max: 64,
    initialValue: 32,
  );

  final code =
      '''AtomixRating(
  rating: $rating,
  size: $size,
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixRating(rating: rating, size: size),
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
        AtomixRating(rating: 5.0, size: 40),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixRating(rating: 5.0, size: 40)'''),
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
        AtomixRating(rating: 3.5, size: 40),
        SizedBox(height: 24),
        CodeSnippet(code: '''AtomixRating(rating: 3.5, size: 40)'''),
      ],
    ),
  );
}
