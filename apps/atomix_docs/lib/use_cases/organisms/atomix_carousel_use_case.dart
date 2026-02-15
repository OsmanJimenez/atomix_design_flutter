import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/Carousel',
  type: AtomixCarousel,
)
Widget atomixCarouselPlayground(BuildContext context) {
  final autoPlay = context.knobs.boolean(
    label: 'Auto Play',
    initialValue: true,
  );

  final height = context.knobs.double.slider(
    label: 'Height',
    initialValue: 200,
    min: 150,
    max: 400,
  );

  final code =
      '''AtomixCarousel(
  items: [
    Container(color: Colors.blue, child: Center(child: Text('Slide 1'))),
    Container(color: Colors.green, child: Center(child: Text('Slide 2'))),
    Container(color: Colors.orange, child: Center(child: Text('Slide 3'))),
  ],
  height: ${height.toStringAsFixed(0)},
  autoPlay: $autoPlay,
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixCarousel(
            items: [
              Container(
                color: Colors.blue.shade200,
                child: const Center(child: Text('Slide 1')),
              ),
              Container(
                color: Colors.green.shade200,
                child: const Center(child: Text('Slide 2')),
              ),
              Container(
                color: Colors.orange.shade200,
                child: const Center(child: Text('Slide 3')),
              ),
            ],
            height: height,
            autoPlay: autoPlay,
          ),
          const SizedBox(height: 32),
          const Text(
            'Code:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Image Gallery',
  path: '[Organisms]/Carousel',
  type: AtomixCarousel,
)
Widget atomixCarouselGallery(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixCarousel(
            items: [
              Container(
                color: Colors.purple.shade100,
                child: const Center(
                  child: Icon(Icons.image, size: 64, color: Colors.purple),
                ),
              ),
              Container(
                color: Colors.pink.shade100,
                child: const Center(
                  child: Icon(Icons.photo, size: 64, color: Colors.pink),
                ),
              ),
              Container(
                color: Colors.teal.shade100,
                child: const Center(
                  child: Icon(
                    Icons.photo_library,
                    size: 64,
                    color: Colors.teal,
                  ),
                ),
              ),
            ],
            height: 250,
            autoPlay: true,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixCarousel(
  items: [
    Container(color: Colors.purple.shade100, child: Icon(Icons.image)),
    Container(color: Colors.pink.shade100, child: Icon(Icons.photo)),
    Container(color: Colors.teal.shade100, child: Icon(Icons.photo_library)),
  ],
  height: 250,
  autoPlay: true,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Promotional Banners',
  path: '[Organisms]/Carousel',
  type: AtomixCarousel,
)
Widget atomixCarouselBanners(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixCarousel(
            items: [
              Container(
                color: Colors.red.shade300,
                child: const Center(
                  child: Text(
                    '50% OFF',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.blue.shade300,
                child: const Center(
                  child: Text(
                    'NEW ARRIVALS',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.green.shade300,
                child: const Center(
                  child: Text(
                    'FREE SHIPPING',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
            height: 180,
            autoPlay: true,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixCarousel(
  items: [
    Container(color: Colors.red.shade300, child: Text('50% OFF')),
    Container(color: Colors.blue.shade300, child: Text('NEW ARRIVALS')),
    Container(color: Colors.green.shade300, child: Text('FREE SHIPPING')),
  ],
  height: 180,
  autoPlay: true,
)''',
          ),
        ],
      ),
    ),
  );
}
