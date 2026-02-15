import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// Detail page template with header and content sections
class AtomixDetailTemplate extends StatelessWidget {
  final Widget? appBar;
  final Widget? header;
  final List<Widget> sections;
  final Widget? floatingActionButton;
  final List<Widget>? actions;

  const AtomixDetailTemplate({
    super.key,
    this.appBar,
    this.header,
    required this.sections,
    this.floatingActionButton,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBar as PreferredSizeWidget? ??
          AtomixAppBar(title: '', actions: actions),
      floatingActionButton: floatingActionButton,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (header != null) header!,
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < sections.length; i++) ...[
                    sections[i],
                    if (i < sections.length - 1) const SizedBox(height: 32),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
