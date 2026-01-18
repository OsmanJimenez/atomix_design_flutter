import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixAppBar)
Widget atomixAppBarDefault(BuildContext context) {
  return Scaffold(
    appBar: const AtomixAppBar(title: 'Home'),
    body: const Center(child: Text('App Bar Example')),
  );
}

@widgetbook.UseCase(name: 'With Leading Icon', type: AtomixAppBar)
Widget atomixAppBarWithLeading(BuildContext context) {
  return Scaffold(
    appBar: AtomixAppBar(
      title: 'Settings',
      leading: Icons.menu,
      onLeadingPressed: () {},
    ),
    body: const Center(child: Text('App Bar with Menu')),
  );
}

@widgetbook.UseCase(name: 'With Actions', type: AtomixAppBar)
Widget atomixAppBarWithActions(BuildContext context) {
  return Scaffold(
    appBar: AtomixAppBar(
      title: 'Messages',
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
      ],
    ),
    body: const Center(child: Text('App Bar with Actions')),
  );
}

@widgetbook.UseCase(name: 'Centered Title', type: AtomixAppBar)
Widget atomixAppBarCentered(BuildContext context) {
  return Scaffold(
    appBar: const AtomixAppBar(title: 'Centered', centerTitle: true),
    body: const Center(child: Text('Centered App Bar')),
  );
}
