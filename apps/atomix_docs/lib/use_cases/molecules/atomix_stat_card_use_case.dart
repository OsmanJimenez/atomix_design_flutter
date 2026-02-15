import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Molecules]/StatCard',
  type: AtomixStatCard,
)
Widget atomixStatCardPlayground(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Total Revenue',
  );

  final value = context.knobs.string(label: 'Value', initialValue: '\$45,231');

  final trend = context.knobs.string(label: 'Trend', initialValue: '+12.5%');

  final isPositiveTrend = context.knobs.boolean(
    label: 'Is Positive Trend',
    initialValue: true,
  );

  final code =
      '''AtomixStatCard(
  label: '$label',
  value: '$value',
  icon: Icons.attach_money,
  trend: '$trend',
  isPositiveTrend: $isPositiveTrend,
)''';

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          SizedBox(
            width: 250,
            child: AtomixStatCard(
              label: label,
              value: value,
              icon: Icons.attach_money,
              trend: trend.isNotEmpty ? trend : null,
              isPositiveTrend: isPositiveTrend,
            ),
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Revenue Card',
  path: '[Molecules]/StatCard',
  type: AtomixStatCard,
)
Widget atomixStatCardRevenue(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(
            width: 250,
            child: AtomixStatCard(
              label: 'Total Revenue',
              value: '\$45,231',
              icon: Icons.attach_money,
              trend: '+12.5%',
              isPositiveTrend: true,
            ),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixStatCard(
  label: 'Total Revenue',
  value: '\\\$45,231',
  icon: Icons.attach_money,
  trend: '+12.5%',
  isPositiveTrend: true,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Users Card',
  path: '[Molecules]/StatCard',
  type: AtomixStatCard,
)
Widget atomixStatCardUsers(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(
            width: 250,
            child: AtomixStatCard(
              label: 'Active Users',
              value: '2,543',
              icon: Icons.people,
              trend: '+8.2%',
              isPositiveTrend: true,
            ),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixStatCard(
  label: 'Active Users',
  value: '2,543',
  icon: Icons.people,
  trend: '+8.2%',
  isPositiveTrend: true,
)''',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Negative Trend',
  path: '[Molecules]/StatCard',
  type: AtomixStatCard,
)
Widget atomixStatCardNegative(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(
            width: 250,
            child: AtomixStatCard(
              label: 'Bounce Rate',
              value: '42.3%',
              icon: Icons.trending_down,
              trend: '-3.1%',
              isPositiveTrend: false,
            ),
          ),
          const SizedBox(height: 24),
          const CodeSnippet(
            code: '''AtomixStatCard(
  label: 'Bounce Rate',
  value: '42.3%',
  icon: Icons.trending_down,
  trend: '-3.1%',
  isPositiveTrend: false,
)''',
          ),
        ],
      ),
    ),
  );
}
