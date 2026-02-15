import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/AtomixScrollbar',
  type: AtomixScrollbar,
)
Widget atomixScrollbarPlayground(BuildContext context) {
  final thumbVisibility = context.knobs.boolean(
    label: 'Thumb Visibility',
    initialValue: true,
  );

  final thickness = context.knobs.double.slider(
    label: 'Thickness',
    initialValue: 6,
    min: 2,
    max: 20,
  );

  final code =
      '''AtomixScrollbar(
  thumbVisibility: $thumbVisibility,
  thickness: $thickness,
  child: ListView.builder(
    itemCount: 50,
    itemBuilder: (context, index) => ListTile(title: Text('Item \$index')),
  ),
)''';

  return Center(
    child: Column(
      children: [
        Expanded(
          child: Container(
            width: 300,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: AtomixScrollbar(
              thumbVisibility: thumbVisibility,
              thickness: thickness,
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: CodeSnippet(code: code),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Always Visible',
  path: '[Atoms]/AtomixScrollbar',
  type: AtomixScrollbar,
)
Widget atomixScrollbarAlwaysVisible(BuildContext context) {
  return Center(
    child: Column(
      children: [
        Expanded(
          child: Container(
            width: 300,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: AtomixScrollbar(
              thumbVisibility: true,
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) =>
                    ListTile(title: Text('Item $index')),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CodeSnippet(
            code: '''AtomixScrollbar(
  thumbVisibility: true,
  child: ListView.builder(...),
)''',
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Thick Scrollbar',
  path: '[Atoms]/AtomixScrollbar',
  type: AtomixScrollbar,
)
Widget atomixScrollbarThick(BuildContext context) {
  return Center(
    child: Column(
      children: [
        Expanded(
          child: Container(
            width: 300,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: AtomixScrollbar(
              thumbVisibility: true,
              thickness: 12,
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) =>
                    ListTile(title: Text('Item $index')),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CodeSnippet(
            code: '''AtomixScrollbar(
  thumbVisibility: true,
  thickness: 12,
  child: ListView.builder(...),
)''',
          ),
        ),
      ],
    ),
  );
}
