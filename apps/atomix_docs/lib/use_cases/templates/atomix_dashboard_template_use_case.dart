import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Templates]/Dashboard',
  type: AtomixDashboardTemplate,
)
Widget atomixDashboardTemplatePlayground(BuildContext context) {
  final showSidebar = context.knobs.boolean(
    label: 'Show Sidebar',
    initialValue: true,
  );

  final code =
      '''AtomixDashboardTemplate(
  sidebar: ${showSidebar ? 'SideMenu()' : 'null'},
  header: Header(),
  body: DashboardBody(),
)''';

  return Column(
    children: [
      Expanded(
        child: AtomixDashboardTemplate(
          sidebar: showSidebar
              ? Container(
                  width: 250,
                  color: Theme.of(context).cardColor,
                  child: const AtomixSideMenu(
                    header: 'Atomix Admin',
                    items: [
                      AtomixSideMenuItem(
                        label: 'Dashboard',
                        icon: Icons.dashboard,
                        isSelected: true,
                      ),
                      AtomixSideMenuItem(label: 'Users', icon: Icons.people),
                      AtomixSideMenuItem(
                        label: 'Settings',
                        icon: Icons.settings,
                      ),
                    ],
                  ),
                )
              : null,
          header: const AtomixHeader(
            title: 'Dashboard',
            items: [
              AtomixHeaderItem(label: 'Overview', isActive: true),
              AtomixHeaderItem(label: 'Analytics'),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 1.5,
              children: const [
                AtomixStatCard(
                  label: 'Total Users',
                  value: '2,543',
                  trend: '+12%',
                  isPositiveTrend: true,
                ),
                AtomixStatCard(
                  label: 'Revenue',
                  value: '\$45,230',
                  trend: '+8%',
                  isPositiveTrend: true,
                ),
                AtomixStatCard(
                  label: 'Sessions',
                  value: '12,042',
                  trend: '-3%',
                  isPositiveTrend: false,
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
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
  );
}

@widgetbook.UseCase(
  name: 'Standard Desktop',
  path: '[Templates]/Dashboard',
  type: AtomixDashboardTemplate,
)
Widget atomixDashboardTemplateDesktop(BuildContext context) {
  return Column(
    children: [
      Expanded(
        child: AtomixDashboardTemplate(
          sidebar: Container(
            width: 250,
            color: Theme.of(context).cardColor,
            child: const AtomixSideMenu(
              header: 'Enterprise CMS',
              items: [
                AtomixSideMenuItem(
                  label: 'Main Dashboard',
                  icon: Icons.home,
                  isSelected: true,
                ),
                AtomixSideMenuItem(label: 'Content', icon: Icons.article),
                AtomixSideMenuItem(label: 'Team Members', icon: Icons.group),
                AtomixSideMenuItem(label: 'Billing', icon: Icons.payment),
              ],
            ),
          ),
          header: const AtomixHeader(
            title: 'Project Alpha',
            actions: [
              AtomixButton(
                label: 'Export',
                variant: AtomixButtonVariant.secondary,
                onPressed: null,
              ),
              SizedBox(width: 12),
              AtomixButton(
                label: 'Add Item',
                variant: AtomixButtonVariant.primary,
                onPressed: null,
              ),
            ],
            items: [],
          ),
          body: const Padding(
            padding: EdgeInsets.all(24),
            child: AtomixCard(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: Text('Main Content Area')),
              ),
            ),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(24),
        child: const CodeSnippet(
          code: '''AtomixDashboardTemplate(
  sidebar: AtomixSideMenu(...),
  header: AtomixHeader(...),
  body: Padding(...),
)''',
        ),
      ),
    ],
  );
}
