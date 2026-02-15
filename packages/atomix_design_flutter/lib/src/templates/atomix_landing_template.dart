import 'package:flutter/material.dart';

/// Landing page template for marketing/promotional pages
class AtomixLandingTemplate extends StatelessWidget {
  final Widget? header;
  final Widget? hero;
  final List<Widget> sections;
  final Widget? footer;

  const AtomixLandingTemplate({
    super.key,
    this.header,
    this.hero,
    required this.sections,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ?header,
            ?hero,
            ...sections.map((section) => section),
            ?footer,
          ],
        ),
      ),
    );
  }
}
