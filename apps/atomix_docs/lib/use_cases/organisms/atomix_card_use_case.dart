import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(name: 'Filled', type: AtomixCard)
Widget atomixCardFilled(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: AtomixCard(
        variant: AtomixCardVariant.filled,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filled Card',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('This is a filled card with default styling.'),
            ],
          ),
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Outlined', type: AtomixCard)
Widget atomixCardOutlined(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: AtomixCard(
        variant: AtomixCardVariant.outlined,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Outlined Card',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('This is an outlined card with a border.'),
            ],
          ),
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Elevated', type: AtomixCard)
Widget atomixCardElevated(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: AtomixCard(
        variant: AtomixCardVariant.elevated,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Elevated Card',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('This is an elevated card with shadow.'),
            ],
          ),
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Tappable', type: AtomixCard)
Widget atomixCardTappable(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: AtomixCard(
        variant: AtomixCardVariant.filled,
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tappable Card',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Tap this card to trigger an action.'),
            ],
          ),
        ),
      ),
    ),
  );
}
