import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

void main() {
  group('AtomixTextField', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AtomixTheme.light(),
          home: const Scaffold(
            body: AtomixTextField(label: 'Test Field', hint: 'Enter text'),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('displays label and hint', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AtomixTheme.light(),
          home: const Scaffold(
            body: AtomixTextField(label: 'Email', hint: 'Enter your email'),
          ),
        ),
      );

      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('shows error text when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AtomixTheme.light(),
          home: const Scaffold(
            body: AtomixTextField(label: 'Email', errorText: 'Invalid email'),
          ),
        ),
      );

      expect(find.text('Invalid email'), findsOneWidget);
    });

    testWidgets('shows helper text when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AtomixTheme.light(),
          home: const Scaffold(
            body: AtomixTextField(
              label: 'Password',
              helperText: 'At least 8 characters',
            ),
          ),
        ),
      );

      expect(find.text('At least 8 characters'), findsOneWidget);
    });

    testWidgets('obscures text when obscureText is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AtomixTheme.light(),
          home: const Scaffold(
            body: AtomixTextField(label: 'Password', obscureText: true),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, true);
    });

    testWidgets('is disabled when enabled is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AtomixTheme.light(),
          home: const Scaffold(
            body: AtomixTextField(label: 'Disabled', enabled: false),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.enabled, false);
    });
  });
}
