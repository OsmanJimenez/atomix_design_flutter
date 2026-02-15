import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/FileUploader',
  type: AtomixFileUploader,
)
Widget atomixFileUploaderPlayground(BuildContext context) {
  final maxFiles = context.knobs.int.slider(
    label: 'Max Files',
    initialValue: 5,
    min: 1,
    max: 10,
  );

  final code =
      '''AtomixFileUploader(
  maxFiles: $maxFiles,
  onFilesSelected: (files) {
    print('Files selected: \$files');
  },
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AtomixFileUploader(
            maxFiles: maxFiles,
            onFilesSelected: (files) {
              print('Files selected: $files');
            },
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
  name: 'Single File',
  path: '[Organisms]/FileUploader',
  type: AtomixFileUploader,
)
Widget atomixFileUploaderSingle(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixFileUploader(
            maxFiles: 1,
            onFilesSelected: (files) {
              print('File selected: $files');
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixFileUploader(
  maxFiles: 1,
  onFilesSelected: (files) {
    print('File selected: \$files');
  },
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Multiple Files',
  path: '[Organisms]/FileUploader',
  type: AtomixFileUploader,
)
Widget atomixFileUploaderMultiple(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixFileUploader(
            maxFiles: 10,
            onFilesSelected: (files) {
              print('Files selected: ${files.length} files');
            },
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixFileUploader(
  maxFiles: 10,
  onFilesSelected: (files) {
    print('Files selected: \${files.length} files');
  },
)''',
          ),
        ],
      ),
    ),
  );
}
