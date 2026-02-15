import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/Rating',
  type: AtomixRating,
)
Widget atomixRatingPlayground(BuildContext context) {
  final count = context.knobs.int.slider(
    label: 'Star Count',
    initialValue: 5,
    min: 3,
    max: 10,
  );

  final size = context.knobs.double.slider(
    label: 'Size',
    initialValue: 24,
    min: 16,
    max: 48,
  );

  return Center(
    child: _RatingWrapper(count: count, size: size),
  );
}

class _RatingWrapper extends StatefulWidget {
  final int count;
  final double size;

  const _RatingWrapper({required this.count, required this.size});

  @override
  State<_RatingWrapper> createState() => _RatingWrapperState();
}

class _RatingWrapperState extends State<_RatingWrapper> {
  double value = 3.5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AtomixRating(
            value: value,
            count: widget.count,
            size: widget.size,
            onChanged: (newValue) {
              setState(() {
                value = newValue;
              });
            },
          ),
          const SizedBox(height: 16),
          Text('Rating: ${value.toStringAsFixed(1)}'),
          const SizedBox(height: 24),
          CodeSnippet(
            code:
                '''AtomixRating(
  value: $value,
  count: ${widget.count},
  size: ${widget.size},
  onChanged: (newValue) => setState(() => value = newValue),
)''',
          ),
        ],
      ),
    );
  }
}

@widgetbook.UseCase(
  name: '5 Stars',
  path: '[Molecules]/Rating',
  type: AtomixRating,
)
Widget atomixRating5Stars(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const AtomixRating(value: 4.5, count: 5),
          const SizedBox(height: 24),
          CodeSnippet(code: 'AtomixRating(value: 4.5, count: 5)'),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Read Only',
  path: '[Molecules]/Rating',
  type: AtomixRating,
)
Widget atomixRatingReadOnly(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const AtomixRating(value: 3.0, count: 5, onChanged: null),
          const SizedBox(height: 24),
          CodeSnippet(
            code: 'AtomixRating(value: 3.0, count: 5, onChanged: null)',
          ),
        ],
      ),
    ),
  );
}
