import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixUserProfile extends StatelessWidget {
  final String name;
  final String? role;
  final String? avatarUrl;
  final String? initials;
  final VoidCallback? onTap;
  final Widget? trailing;

  const AtomixUserProfile({
    super.key,
    required this.name,
    this.role,
    this.avatarUrl,
    this.initials,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            AtomixAvatar(imageUrl: avatarUrl, initials: initials, size: 40),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: theme.typography.labelLarge.copyWith(
                      color: theme.colors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (role != null)
                    Text(
                      role!,
                      style: theme.typography.bodySmall.copyWith(
                        color: theme.colors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            if (trailing != null) ...[const SizedBox(width: 8), trailing!],
          ],
        ),
      ),
    );
  }
}
