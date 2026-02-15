import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/Footer',
  type: AtomixFooter,
)
Widget atomixFooterPlayground(BuildContext context) {
  final code = '''AtomixFooter(
  copyright: '© 2024 Atomix Design',
  sections: [
    AtomixFooterSection(
      title: 'Product',
      links: [
        AtomixFooterLink(label: 'Features'),
        AtomixFooterLink(label: 'Pricing'),
      ],
    ),
  ],
  socialLinks: [
    AtomixSocialLink(icon: Icons.facebook),
  ],
)''';

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AtomixFooter(
          copyright: '© 2024 Atomix Design. All rights reserved.',
          sections: [
            AtomixFooterSection(
              title: 'Product',
              links: const [
                AtomixFooterLink(label: 'Features'),
                AtomixFooterLink(label: 'Pricing'),
                AtomixFooterLink(label: 'Documentation'),
              ],
            ),
            AtomixFooterSection(
              title: 'Company',
              links: const [
                AtomixFooterLink(label: 'About'),
                AtomixFooterLink(label: 'Blog'),
                AtomixFooterLink(label: 'Careers'),
              ],
            ),
          ],
          socialLinks: const [
            AtomixSocialLink(icon: Icons.facebook),
            AtomixSocialLink(icon: Icons.flutter_dash),
            AtomixSocialLink(icon: Icons.code),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Code:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              CodeSnippet(code: code),
            ],
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Simple Footer',
  path: '[Organisms]/Footer',
  type: AtomixFooter,
)
Widget atomixFooterSimple(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        AtomixFooter(
          copyright: '© 2024 My Company',
          sections: [
            AtomixFooterSection(
              title: 'Links',
              links: const [
                AtomixFooterLink(label: 'Privacy Policy'),
                AtomixFooterLink(label: 'Terms of Service'),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: const CodeSnippet(
            code: '''AtomixFooter(
  copyright: '© 2024 My Company',
  sections: [
    AtomixFooterSection(
      title: 'Links',
      links: [
        AtomixFooterLink(label: 'Privacy Policy'),
        AtomixFooterLink(label: 'Terms of Service'),
      ],
    ),
  ],
)''',
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Full Footer',
  path: '[Organisms]/Footer',
  type: AtomixFooter,
)
Widget atomixFooterFull(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        AtomixFooter(
          copyright: '© 2024 Atomix. All rights reserved.',
          sections: [
            AtomixFooterSection(
              title: 'Product',
              links: const [
                AtomixFooterLink(label: 'Features'),
                AtomixFooterLink(label: 'Pricing'),
                AtomixFooterLink(label: 'Docs'),
                AtomixFooterLink(label: 'API'),
              ],
            ),
            AtomixFooterSection(
              title: 'Company',
              links: const [
                AtomixFooterLink(label: 'About Us'),
                AtomixFooterLink(label: 'Blog'),
                AtomixFooterLink(label: 'Careers'),
                AtomixFooterLink(label: 'Press'),
              ],
            ),
            AtomixFooterSection(
              title: 'Support',
              links: const [
                AtomixFooterLink(label: 'Help Center'),
                AtomixFooterLink(label: 'Contact'),
                AtomixFooterLink(label: 'Status'),
              ],
            ),
          ],
          socialLinks: const [
            AtomixSocialLink(icon: Icons.facebook),
            AtomixSocialLink(icon: Icons.flutter_dash),
            AtomixSocialLink(icon: Icons.code),
            AtomixSocialLink(icon: Icons.link),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: const CodeSnippet(
            code: '''AtomixFooter(
  copyright: '© 2024 Atomix. All rights reserved.',
  sections: [
    AtomixFooterSection(title: 'Product', links: [...]),
    AtomixFooterSection(title: 'Company', links: [...]),
    AtomixFooterSection(title: 'Support', links: [...]),
  ],
  socialLinks: [
    AtomixSocialLink(icon: Icons.facebook),
    AtomixSocialLink(icon: Icons.flutter_dash),
  ],
)''',
          ),
        ),
      ],
    ),
  );
}
