import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// Settings template with sections and navigation
class AtomixSettingsTemplate extends StatelessWidget {
  final String title;
  final List<Widget> sections;
  final Widget? appBar;

  const AtomixSettingsTemplate({
    super.key,
    required this.title,
    required this.sections,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar as PreferredSizeWidget? ?? AtomixAppBar(title: title),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < sections.length; i++) ...[
              sections[i],
              if (i < sections.length - 1) const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }
}
