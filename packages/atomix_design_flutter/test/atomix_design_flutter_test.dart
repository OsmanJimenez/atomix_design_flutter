import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

void main() {
  testWidgets('AtomixButton displays label and responds to taps', (
    WidgetTester tester,
  ) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AtomixButton(
            label: 'Test Button',
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);
    await tester.tap(find.text('Test Button'));
    expect(tapped, isTrue);
  });
}
