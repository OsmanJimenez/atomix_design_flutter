import 'package:flutter/material.dart';

/// Dashboard template with sidebar and header layout
class AtomixDashboardTemplate extends StatelessWidget {
  final Widget? sidebar;
  final Widget? header;
  final Widget body;
  final Color? backgroundColor;

  const AtomixDashboardTemplate({
    super.key,
    this.sidebar,
    this.header,
    required this.body,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          ?sidebar,
          Expanded(
            child: Column(
              children: [
                ?header,
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: body,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
