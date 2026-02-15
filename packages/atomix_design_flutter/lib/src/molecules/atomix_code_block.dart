import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixCodeBlock extends StatelessWidget {
  final String code;
  final String? language;
  final bool showCopyButton;

  const AtomixCodeBlock({
    super.key,
    required this.code,
    this.language,
    this.showCopyButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (language != null || showCopyButton)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: theme.colors.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (language != null)
                    Text(
                      language!,
                      style: theme.typography.labelSmall.copyWith(
                        color: theme.colors.textSecondary,
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  if (showCopyButton)
                    IconButton(
                      icon: Icon(Icons.copy, size: 16),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: code));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Code copied!')),
                        );
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                ],
              ),
            ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
            child: SelectableText(
              code,
              style: theme.typography.bodySmall.copyWith(
                fontFamily: 'monospace',
                color: theme.colors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
