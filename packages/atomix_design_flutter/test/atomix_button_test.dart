import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

void main() {
  group('AtomixButton', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AtomixTheme.light(),
          home: Scaffold(
            body: AtomixButton(label: 'Test Button', onPressed: () {}),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('handles tap events', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: AtomixTheme.light(),
          home: Scaffold(
            body: AtomixButton(
              label: 'Test Button',
              onPressed: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Test Button'));
      expect(tapped, true);
    });

    testWidgets('shows loading indicator when isLoading is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AtomixTheme.light(),
          home: Scaffold(
            body: AtomixButton(
              label: 'Test Button',
              onPressed: () {},
              isLoading: true,
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Test Button'), findsNothing);
    });

    testWidgets('renders with icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AtomixTheme.light(),
          home: Scaffold(
            body: AtomixButton(
              label: 'Test Button',
              onPressed: () {},
              icon: Icons.add,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('is disabled when onPressed is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AtomixTheme.light(),
          home: const Scaffold(
            body: AtomixButton(label: 'Test Button', onPressed: null),
          ),
        ),
      );

      final button = tester.widget<FilledButton>(find.byType(FilledButton));
      expect(button.onPressed, null);
    });
  });
}
