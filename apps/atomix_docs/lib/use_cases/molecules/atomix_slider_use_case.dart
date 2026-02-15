import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/Slider',
  type: AtomixSlider,
)
Widget atomixSliderPlayground(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Volume');

  final min = context.knobs.double.slider(
    label: 'Min',
    initialValue: 0,
    min: 0,
    max: 50,
  );

  final max = context.knobs.double.slider(
    label: 'Max',
    initialValue: 100,
    min: 50,
    max: 200,
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: _SliderWrapper(title: title, min: min, max: max),
    ),
  );
}

class _SliderWrapper extends StatefulWidget {
  final String title;
  final double min;
  final double max;

  const _SliderWrapper({
    required this.title,
    required this.min,
    required this.max,
  });

  @override
  State<_SliderWrapper> createState() => _SliderWrapperState();
}

class _SliderWrapperState extends State<_SliderWrapper> {
  double value = 50;

  @override
  Widget build(BuildContext context) {
    final code =
        '''AtomixSlider(
  value: ${value.toStringAsFixed(0)},
  onChanged: (newValue) => setState(() => value = newValue),
  min: ${widget.min},
  max: ${widget.max},
  title: '${widget.title}',
  divisions: 10,
)''';

    return Column(
      children: [
        AtomixSlider(
          value: value.clamp(widget.min, widget.max),
          onChanged: (newValue) {
            setState(() {
              value = newValue;
            });
          },
          min: widget.min,
          max: widget.max,
          title: widget.title,
          divisions: 10,
        ),
        const SizedBox(height: 24),
        CodeSnippet(code: code),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Volume Control',
  path: '[Molecules]/Slider',
  type: AtomixSlider,
)
Widget atomixSliderVolume(BuildContext context) {
  return const Center(
    child: Padding(padding: EdgeInsets.all(24), child: _SliderVolumeWrapper()),
  );
}

class _SliderVolumeWrapper extends StatefulWidget {
  const _SliderVolumeWrapper();

  @override
  State<_SliderVolumeWrapper> createState() => _SliderVolumeWrapperState();
}

class _SliderVolumeWrapperState extends State<_SliderVolumeWrapper> {
  double value = 70;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixSlider(
          value: value,
          onChanged: (v) => setState(() => value = v),
          min: 0,
          max: 100,
          title: 'Volume',
        ),
        const SizedBox(height: 24),
        CodeSnippet(
          code: '''AtomixSlider(
  value: value,
  onChanged: (v) => setState(() => value = v),
  min: 0,
  max: 100,
  title: 'Volume',
)''',
        ),
      ],
    );
  }
}
