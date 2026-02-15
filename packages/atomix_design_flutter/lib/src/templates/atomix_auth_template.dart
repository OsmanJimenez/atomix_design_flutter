import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// Authentication template for login/signup pages
class AtomixAuthTemplate extends StatelessWidget {
  final Widget form;
  final String? title;
  final String? subtitle;
  final Widget? logo;
  final Widget? backgroundImage;
  final List<Widget>? socialButtons;
  final Widget? footer;

  const AtomixAuthTemplate({
    super.key,
    required this.form,
    this.title,
    this.subtitle,
    this.logo,
    this.backgroundImage,
    this.socialButtons,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (backgroundImage != null) Positioned.fill(child: backgroundImage!),
          Center(
            child: SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.all(32),
                child: AtomixCard(
                  variant: AtomixCardVariant.elevated,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (logo != null) ...[
                          Center(child: logo!),
                          const SizedBox(height: 24),
                        ],
                        if (title != null)
                          Text(
                            title!,
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.center,
                          ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            subtitle!,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                        const SizedBox(height: 32),
                        form,
                        if (socialButtons != null &&
                            socialButtons!.isNotEmpty) ...[
                          const SizedBox(height: 24),
                          const Row(
                            children: [
                              Expanded(child: AtomixDivider()),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text('OR'),
                              ),
                              Expanded(child: AtomixDivider()),
                            ],
                          ),
                          const SizedBox(height: 24),
                          ...socialButtons!,
                        ],
                        if (footer != null) ...[
                          const SizedBox(height: 24),
                          footer!,
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
