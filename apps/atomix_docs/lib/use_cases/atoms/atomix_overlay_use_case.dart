import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/AtomixOverlay',
  type: AtomixOverlay,
)
Widget atomixOverlayPlayground(BuildContext context) {
  final isVisible = context.knobs.boolean(
    label: 'Is Visible',
    initialValue: true,
  );

  final color = context.knobs.color(
    label: 'Overlay Color',
    initialValue: Colors.black54,
  );

  final code =
      '''AtomixOverlay(
  isVisible: $isVisible,
  color: Colors.black54,
  onTap: () {},
  child: Center(child: Text('Overlay Content')),
)''';

  return Stack(
    alignment: Alignment.center,
    children: [
      const Center(child: Text('Content behind overlay')),
      if (isVisible)
        AtomixOverlay(
          isVisible: isVisible,
          color: color,
          onTap: () {},
          child: const Center(
            child: Text(
              'Overlay Content',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      Positioned(
        bottom: 20,
        left: 20,
        right: 20,
        child: CodeSnippet(code: code),
      ),
    ],
  );
}

@widgetbook.UseCase(
  name: 'Dark Overlay',
  path: '[Atoms]/AtomixOverlay',
  type: AtomixOverlay,
)
Widget atomixOverlayDark(BuildContext context) {
  return Stack(
    children: [
      const Center(child: Text('Content')),
      AtomixOverlay(
        isVisible: true,
        color: Colors.black87,
        onTap: () {},
        child: const Center(
          child: Text('Dark Overlay', style: TextStyle(color: Colors.white)),
        ),
      ),
      const Positioned(
        bottom: 20,
        left: 20,
        right: 20,
        child: CodeSnippet(
          code: '''AtomixOverlay(
  isVisible: true,
  color: Colors.black87,
  onTap: () {},
  child: Center(child: Text('Dark Overlay')),
)''',
        ),
      ),
    ],
  );
}

@widgetbook.UseCase(
  name: 'Light Overlay',
  path: '[Atoms]/AtomixOverlay',
  type: AtomixOverlay,
)
Widget atomixOverlayLight(BuildContext context) {
  return Stack(
    children: [
      const Center(child: Text('Content')),
      AtomixOverlay(
        isVisible: true,
        color: Colors.white70,
        onTap: () {},
        child: const Center(child: Text('Light Overlay')),
      ),
      const Positioned(
        bottom: 20,
        left: 20,
        right: 20,
        child: CodeSnippet(
          code: '''AtomixOverlay(
  isVisible: true,
  color: Colors.white70,
  onTap: () {},
  child: Center(child: Text('Light Overlay')),
)''',
        ),
      ),
    ],
  );
}
