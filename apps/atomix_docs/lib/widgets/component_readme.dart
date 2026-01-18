import 'package:flutter/material.dart';

/// A widget that displays component documentation in markdown-like format
class ComponentReadme extends StatelessWidget {
  final String title;
  final String description;
  final List<ReadmeSection> sections;

  const ComponentReadme({
    super.key,
    required this.title,
    required this.description,
    this.sections = const [],
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Description
          Text(description, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 32),

          // Sections
          ...sections.map(
            (section) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: _buildSection(context, section, isDark),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    ReadmeSection section,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section.title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(section.content, style: Theme.of(context).textTheme.bodyMedium),
        if (section.codeExample != null) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0D1117) : const Color(0xFFF6F8FA),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isDark
                    ? const Color(0xFF30363D)
                    : const Color(0xFFD0D7DE),
              ),
            ),
            child: SelectableText(
              section.codeExample!,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 14,
                color: isDark
                    ? const Color(0xFFE6EDF3)
                    : const Color(0xFF24292F),
              ),
            ),
          ),
        ],
        if (section.items != null && section.items!.isNotEmpty) ...[
          const SizedBox(height: 12),
          ...section.items!.map(
            (item) => Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ', style: Theme.of(context).textTheme.bodyMedium),
                  Expanded(
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class ReadmeSection {
  final String title;
  final String content;
  final String? codeExample;
  final List<String>? items;

  const ReadmeSection({
    required this.title,
    required this.content,
    this.codeExample,
    this.items,
  });
}
