import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Organisms]/ActivityFeed',
  type: AtomixActivityFeed,
)
Widget atomixActivityFeedPlayground(BuildContext context) {
  final code = '''AtomixActivityFeed(
  activities: [
    AtomixActivity(
      title: 'User registered',
      description: 'John Doe joined',
      timestamp: DateTime.now(),
    ),
    AtomixActivity(
      title: 'New comment',
      description: 'Jane commented',
      timestamp: DateTime.now(),
    ),
  ],
)''';

  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AtomixActivityFeed(
          activities: [
            AtomixActivity(
              title: 'User registered',
              description: 'John Doe joined the platform',
              timestamp: DateTime.now().subtract(const Duration(hours: 1)),
            ),
            AtomixActivity(
              title: 'New comment',
              description: 'Jane Smith commented on your post',
              timestamp: DateTime.now().subtract(const Duration(hours: 3)),
            ),
            AtomixActivity(
              title: 'File uploaded',
              description: 'Document.pdf was uploaded',
              timestamp: DateTime.now().subtract(const Duration(hours: 5)),
            ),
          ],
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
  name: 'Social Feed',
  path: '[Organisms]/ActivityFeed',
  type: AtomixActivityFeed,
)
Widget atomixActivityFeedSocial(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        AtomixActivityFeed(
          activities: [
            AtomixActivity(
              title: 'New Follower',
              description: 'Alice started following you',
              timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
            ),
            AtomixActivity(
              title: 'Post Liked',
              description: 'Bob liked your photo',
              timestamp: DateTime.now().subtract(const Duration(hours: 2)),
            ),
            AtomixActivity(
              title: 'Mentioned',
              description: 'Charlie mentioned you in a comment',
              timestamp: DateTime.now().subtract(const Duration(hours: 4)),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixActivityFeed(
  activities: [
    AtomixActivity(
      title: 'New Follower',
      description: 'Alice started following you',
      timestamp: DateTime.now().subtract(Duration(minutes: 30)),
    ),
    AtomixActivity(
      title: 'Post Liked',
      description: 'Bob liked your photo',
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
    ),
  ],
)''',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'System Events',
  path: '[Organisms]/ActivityFeed',
  type: AtomixActivityFeed,
)
Widget atomixActivityFeedSystem(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        AtomixActivityFeed(
          activities: [
            AtomixActivity(
              title: 'System Update',
              description: 'Version 2.0 installed successfully',
              timestamp: DateTime.now().subtract(const Duration(days: 1)),
            ),
            AtomixActivity(
              title: 'Backup Complete',
              description: 'Daily backup finished',
              timestamp: DateTime.now().subtract(const Duration(days: 2)),
            ),
            AtomixActivity(
              title: 'Security Alert',
              description: 'New login from unknown device',
              timestamp: DateTime.now().subtract(const Duration(days: 3)),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const CodeSnippet(
          code: '''AtomixActivityFeed(
  activities: [
    AtomixActivity(
      title: 'System Update',
      description: 'Version 2.0 installed successfully',
      timestamp: DateTime.now().subtract(Duration(days: 1)),
    ),
    AtomixActivity(
      title: 'Backup Complete',
      description: 'Daily backup finished',
      timestamp: DateTime.now().subtract(Duration(days: 2)),
    ),
  ],
)''',
        ),
      ],
    ),
  );
}
