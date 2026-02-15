import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/CodeBlock',
  type: AtomixCodeBlock,
)
Widget atomixCodeBlockPlayground(BuildContext context) {
  final language = context.knobs.string(
    label: 'Language',
    initialValue: 'dart',
  );

  final showCopyButton = context.knobs.boolean(
    label: 'Show Copy Button',
    initialValue: true,
  );

  const code = '''
void main() {
  print('Hello, World!');
  
  final numbers = [1, 2, 3, 4, 5];
  final doubled = numbers.map((n) => n * 2).toList();
  
  print(doubled);
}''';

  final snippetCode =
      '''AtomixCodeBlock(
  code: \'\'\'$code\'\'\',
  language: '$language',
  showCopyButton: $showCopyButton,
)''';

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixCodeBlock(
            code: code,
            language: language.isNotEmpty ? language : null,
            showCopyButton: showCopyButton,
          ),
          const SizedBox(height: 24),
          CodeSnippet(code: snippetCode),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Dart Code',
  path: '[Molecules]/CodeBlock',
  type: AtomixCodeBlock,
)
Widget atomixCodeBlockDart(BuildContext context) {
  const code = '''class Person {
  final String name;
  final int age;
  
  Person(this.name, this.age);
  
  void greet() {
    print('Hello, my name is \$name');
  }
}''';

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const AtomixCodeBlock(code: code, language: 'dart'),
          const SizedBox(height: 24),
          const CodeSnippet(
            code:
                '''AtomixCodeBlock(
  code: \'\'\'$code\'\'\',
  language: 'dart',
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'JSON Code',
  path: '[Molecules]/CodeBlock',
  type: AtomixCodeBlock,
)
Widget atomixCodeBlockJson(BuildContext context) {
  const code = '''{
  "name": "John Doe",
  "age": 30,
  "email": "john@example.com",
  "address": {
    "street": "123 Main St",
    "city": "New York"
  }
}''';

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const AtomixCodeBlock(
            code: code,
            language: 'json',
            showCopyButton: true,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code:
                '''AtomixCodeBlock(
  code: \'\'\'$code\'\'\',
  language: 'json',
  showCopyButton: true,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'No Language',
  path: '[Molecules]/CodeBlock',
  type: AtomixCodeBlock,
)
Widget atomixCodeBlockPlain(BuildContext context) {
  const code = '''This is plain text
without syntax highlighting.

It can contain anything.''';

  return const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixCodeBlock(code: code),
          SizedBox(height: 24),
          CodeSnippet(
            code:
                '''AtomixCodeBlock(
  code: \'\'\'$code\'\'\',
)''',
          ),
        ],
      ),
    ),
  );
}
