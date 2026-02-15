import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/TimelineItem',
  type: AtomixTimelineItem,
)
Widget atomixTimelineItemPlayground(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AtomixTimelineItem(
            title: 'Order Placed',
            description: 'Your order has been successfully placed.',
            timestamp: DateTime.now().subtract(const Duration(days: 2)),
            isFirst: true,
          ),
          AtomixTimelineItem(
            title: 'Processing',
            description: 'Your order is being prepared.',
            timestamp: DateTime.now().subtract(const Duration(days: 1)),
          ),
          AtomixTimelineItem(
            title: 'Shipped',
            description: 'Your order has been shipped.',
            timestamp: DateTime.now(),
          ),
          const AtomixTimelineItem(
            title: 'Delivered',
            description: 'Expected delivery date.',
            isLast: true,
          ),
          const SizedBox(height: 32),
          const CodeSnippet(
            code: '''Column(
  children: [
    AtomixTimelineItem(
      title: 'Order Placed',
      description: 'Your order has been successfully placed.',
      timestamp: DateTime.now().subtract(Duration(days: 2)),
      isFirst: true,
    ),
    AtomixTimelineItem(
      title: 'Processing',
      description: 'Your order is being prepared.',
      timestamp: DateTime.now().subtract(Duration(days: 1)),
    ),
    AtomixTimelineItem(
      title: 'Shipped',
      description: 'Your order has been shipped.',
      timestamp: DateTime.now(),
    ),
    AtomixTimelineItem(
      title: 'Delivered',
      description: 'Expected delivery date.',
      isLast: true,
    ),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Project Timeline',
  path: '[Molecules]/TimelineItem',
  type: AtomixTimelineItem,
)
Widget atomixTimelineItemProject(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixTimelineItem(
            title: 'Project Started',
            description: 'Initial planning and requirements gathering.',
            timestamp: DateTime.now().subtract(const Duration(days: 30)),
            isFirst: true,
          ),
          AtomixTimelineItem(
            title: 'Design Phase',
            description: 'UI/UX design and prototyping completed.',
            timestamp: DateTime.now().subtract(const Duration(days: 20)),
          ),
          AtomixTimelineItem(
            title: 'Development',
            description: 'Core features implementation in progress.',
            timestamp: DateTime.now().subtract(const Duration(days: 10)),
          ),
          const AtomixTimelineItem(
            title: 'Launch',
            description: 'Scheduled for next month.',
            isLast: true,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixTimelineItem(
  title: 'Project Started',
  description: 'Initial planning and requirements gathering.',
  timestamp: DateTime.now().subtract(Duration(days: 30)),
  isFirst: true,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Activity Feed',
  path: '[Molecules]/TimelineItem',
  type: AtomixTimelineItem,
)
Widget atomixTimelineItemActivity(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixTimelineItem(
            title: 'New Comment',
            description: 'John Doe commented on your post.',
            timestamp: DateTime.now().subtract(const Duration(hours: 2)),
            isFirst: true,
          ),
          AtomixTimelineItem(
            title: 'Profile Updated',
            description: 'You updated your profile picture.',
            timestamp: DateTime.now().subtract(const Duration(hours: 5)),
          ),
          AtomixTimelineItem(
            title: 'New Follower',
            description: 'Jane Smith started following you.',
            timestamp: DateTime.now().subtract(const Duration(days: 1)),
            isLast: true,
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixTimelineItem(
  title: 'New Comment',
  description: 'John Doe commented on your post.',
  timestamp: DateTime.now().subtract(Duration(hours: 2)),
  isFirst: true,
)''',
          ),
        ],
      ),
    ),
  );
}
