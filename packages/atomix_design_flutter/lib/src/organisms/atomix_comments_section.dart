import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixCommentsSection extends StatefulWidget {
  final List<AtomixComment> comments;
  final ValueChanged<String>? onCommentAdded;

  const AtomixCommentsSection({
    super.key,
    required this.comments,
    this.onCommentAdded,
  });

  @override
  State<AtomixCommentsSection> createState() => _AtomixCommentsSectionState();
}

class _AtomixCommentsSectionState extends State<AtomixCommentsSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addComment() {
    if (_controller.text.isNotEmpty) {
      widget.onCommentAdded?.call(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comments (${widget.comments.length})',
          style: theme.typography.titleMedium.copyWith(
            color: theme.colors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        // Comment input
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AtomixAvatar(initials: 'ME', size: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                children: [
                  AtomixTextField(
                    controller: _controller,
                    hint: 'Add a comment...',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AtomixButton(
                        label: 'Comment',
                        onPressed: _addComment,
                        size: AtomixButtonSize.sm,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Comments list
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.comments.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final comment = widget.comments[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AtomixAvatar(initials: comment.authorInitials, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            comment.authorName,
                            style: theme.typography.labelMedium.copyWith(
                              color: theme.colors.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            comment.timestamp,
                            style: theme.typography.bodySmall.copyWith(
                              color: theme.colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        comment.text,
                        style: theme.typography.bodyMedium.copyWith(
                          color: theme.colors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class AtomixComment {
  final String authorName;
  final String authorInitials;
  final String text;
  final String timestamp;

  const AtomixComment({
    required this.authorName,
    required this.authorInitials,
    required this.text,
    required this.timestamp,
  });
}
