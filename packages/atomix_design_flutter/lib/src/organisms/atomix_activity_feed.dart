import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixActivityFeed extends StatelessWidget {
  final List<AtomixActivity> activities;

  const AtomixActivityFeed({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: activities.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final activity = activities[index];
        return AtomixTimelineItem(
          title: activity.title,
          description: activity.description,
          timestamp: activity.timestamp,
          icon: activity.icon,
          isFirst: index == 0,
          isLast: index == activities.length - 1,
          dotColor: activity.color,
        );
      },
    );
  }
}

class AtomixActivity {
  final String title;
  final String? description;
  final DateTime timestamp;
  final Widget? icon;
  final Color? color;

  const AtomixActivity({
    required this.title,
    this.description,
    required this.timestamp,
    this.icon,
    this.color,
  });
}
