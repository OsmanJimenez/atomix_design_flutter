import 'package:flutter_test/flutter_test.dart';
import 'package:atomix_docs/main.dart';

void main() {
  testWidgets('Widgetbook app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WidgetbookApp());

    // Verify that Widgetbook is displayed.
    // Since Widgetbook is a complex widget, we just check if it's there.
    expect(find.byType(WidgetbookApp), findsOneWidget);
  });
}
