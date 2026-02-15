import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixFooter extends StatelessWidget {
  final String? copyright;
  final List<AtomixFooterSection> sections;
  final List<AtomixSocialLink>? socialLinks;

  const AtomixFooter({
    super.key,
    this.copyright,
    required this.sections,
    this.socialLinks,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Container(
      color: theme.colors.surfaceVariant,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 48,
            runSpacing: 24,
            children: sections.map((section) {
              return SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section.title,
                      style: theme.typography.titleSmall.copyWith(
                        color: theme.colors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...section.links.map(
                      (link) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: InkWell(
                          onTap: link.onTap,
                          child: Text(
                            link.label,
                            style: theme.typography.bodyMedium.copyWith(
                              color: theme.colors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          if (socialLinks != null && socialLinks!.isNotEmpty) ...[
            const SizedBox(height: 32),
            const AtomixDivider(),
            const SizedBox(height: 24),
            Row(
              children: socialLinks!.map((link) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    icon: Icon(link.icon),
                    onPressed: link.onTap,
                    color: theme.colors.textSecondary,
                  ),
                );
              }).toList(),
            ),
          ],
          if (copyright != null) ...[
            const SizedBox(height: 24),
            const AtomixDivider(),
            const SizedBox(height: 24),
            Text(
              copyright!,
              style: theme.typography.bodySmall.copyWith(
                color: theme.colors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class AtomixFooterSection {
  final String title;
  final List<AtomixFooterLink> links;

  const AtomixFooterSection({required this.title, required this.links});
}

class AtomixFooterLink {
  final String label;
  final VoidCallback? onTap;

  const AtomixFooterLink({required this.label, this.onTap});
}

class AtomixSocialLink {
  final IconData icon;
  final VoidCallback? onTap;

  const AtomixSocialLink({required this.icon, this.onTap});
}
