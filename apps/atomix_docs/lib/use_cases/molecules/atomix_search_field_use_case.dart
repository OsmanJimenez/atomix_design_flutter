import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/SearchField',
  type: AtomixSearchField,
)
Widget atomixSearchFieldPlayground(BuildContext context) {
  final hintText = context.knobs.string(
    label: 'Hint Text',
    initialValue: 'Search...',
  );

  final autofocus = context.knobs.boolean(
    label: 'Autofocus',
    initialValue: false,
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: _SearchFieldWrapper(hintText: hintText, autofocus: autofocus),
    ),
  );
}

class _SearchFieldWrapper extends StatefulWidget {
  final String hintText;
  final bool autofocus;

  const _SearchFieldWrapper({required this.hintText, required this.autofocus});

  @override
  State<_SearchFieldWrapper> createState() => _SearchFieldWrapperState();
}

class _SearchFieldWrapperState extends State<_SearchFieldWrapper> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final code =
        '''AtomixSearchField(
  hintText: '${widget.hintText}',
  controller: controller,
  autofocus: ${widget.autofocus},
  onChanged: (value) {},
  onClear: () {},
)''';

    return Column(
      children: [
        AtomixSearchField(
          hintText: widget.hintText,
          controller: controller,
          autofocus: widget.autofocus,
          onChanged: (value) {
            setState(() {});
          },
          onClear: () {
            setState(() {});
          },
        ),
        const SizedBox(height: 24),
        CodeSnippet(code: code),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Product Search',
  path: '[Molecules]/SearchField',
  type: AtomixSearchField,
)
Widget atomixSearchFieldProduct(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: _SearchFieldProductWrapper(),
    ),
  );
}

class _SearchFieldProductWrapper extends StatefulWidget {
  const _SearchFieldProductWrapper();

  @override
  State<_SearchFieldProductWrapper> createState() =>
      _SearchFieldProductWrapperState();
}

class _SearchFieldProductWrapperState
    extends State<_SearchFieldProductWrapper> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixSearchField(
          hintText: 'Search products...',
          controller: controller,
          onChanged: (value) {},
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixSearchField(
  hintText: 'Search products...',
  controller: controller,
  onChanged: (value) {},
)''',
        ),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'User Search',
  path: '[Molecules]/SearchField',
  type: AtomixSearchField,
)
Widget atomixSearchFieldUser(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: _SearchFieldUserWrapper(),
    ),
  );
}

class _SearchFieldUserWrapper extends StatefulWidget {
  const _SearchFieldUserWrapper();

  @override
  State<_SearchFieldUserWrapper> createState() =>
      _SearchFieldUserWrapperState();
}

class _SearchFieldUserWrapperState extends State<_SearchFieldUserWrapper> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AtomixSearchField(
          hintText: 'Search users by name or email...',
          controller: controller,
          autofocus: true,
          onChanged: (value) {},
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixSearchField(
  hintText: 'Search users by name or email...',
  controller: controller,
  autofocus: true,
  onChanged: (value) {},
)''',
        ),
      ],
    );
  }
}
