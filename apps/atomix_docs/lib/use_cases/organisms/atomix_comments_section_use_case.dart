import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/CommentsSection',
  type: AtomixCommentsSection,
)
Widget atomixCommentsSectionPlayground(BuildContext context) {
  final code = '''AtomixCommentsSection(
  comments: [
    AtomixComment(
      authorName: 'John Doe',
      authorInitials: 'JD',
      text: 'Great article!',
      timestamp: '2 hours ago',
    ),
  ],
  onCommentAdded: (text) {
    print('New comment: \$text');
  },
)''';

  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AtomixCommentsSection(
          comments: const [
            AtomixComment(
              authorName: 'John Doe',
              authorInitials: 'JD',
              text: 'Great article! Very informative.',
              timestamp: '2 hours ago',
            ),
            AtomixComment(
              authorName: 'Jane Smith',
              authorInitials: 'JS',
              text: 'Thanks for sharing this.',
              timestamp: '5 hours ago',
            ),
          ],
          onCommentAdded: (text) {
            print('New comment: $text');
          },
        ),
        const SizedBox(height: 32),
        const Text(
          'Code:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        CodeSnippet(code: code),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Blog Comments',
  path: '[Organisms]/CommentsSection',
  type: AtomixCommentsSection,
)
Widget atomixCommentsSectionBlog(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        AtomixCommentsSection(
          comments: const [
            AtomixComment(
              authorName: 'Alice Johnson',
              authorInitials: 'AJ',
              text: 'This is exactly what I was looking for!',
              timestamp: '1 hour ago',
            ),
            AtomixComment(
              authorName: 'Bob Williams',
              authorInitials: 'BW',
              text: 'Could you elaborate on the second point?',
              timestamp: '3 hours ago',
            ),
            AtomixComment(
              authorName: 'Charlie Brown',
              authorInitials: 'CB',
              text: 'Excellent write-up. Bookmarked for future reference.',
              timestamp: '1 day ago',
            ),
          ],
          onCommentAdded: (text) => print('Comment: $text'),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixCommentsSection(
  comments: [
    AtomixComment(
      authorName: 'Alice Johnson',
      authorInitials: 'AJ',
      text: 'This is exactly what I was looking for!',
      timestamp: '1 hour ago',
    ),
  ],
  onCommentAdded: (text) => print('Comment: \$text'),
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Product Reviews',
  path: '[Organisms]/CommentsSection',
  type: AtomixCommentsSection,
)
Widget atomixCommentsSectionReviews(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        AtomixCommentsSection(
          comments: const [
            AtomixComment(
              authorName: 'Sarah Davis',
              authorInitials: 'SD',
              text: 'Amazing product! Highly recommend.',
              timestamp: '2 days ago',
            ),
            AtomixComment(
              authorName: 'Mike Wilson',
              authorInitials: 'MW',
              text: 'Good quality but shipping took a while.',
              timestamp: '3 days ago',
            ),
          ],
          onCommentAdded: (text) => print('Review: $text'),
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixCommentsSection(
  comments: [
    AtomixComment(
      authorName: 'Sarah Davis',
      authorInitials: 'SD',
      text: 'Amazing product! Highly recommend.',
      timestamp: '2 days ago',
    ),
  ],
  onCommentAdded: (text) => print('Review: \$text'),
)''',
        ),
      ],
    ),
  );
}
