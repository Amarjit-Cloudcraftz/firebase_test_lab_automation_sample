import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_automation_test_lab/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login and navigate to home page', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Enter the email and password.
    await tester.enterText(
        find.byKey(const Key('email_field')), 'test@example.com');
    await tester.enterText(
        find.byKey(const Key('password_field')), 'Password123');

    // Tap the login button.
    await tester.tap(find.byType(ElevatedButton));
    // Wait for the home page to load.
    await tester.pumpAndSettle();

    // Verify that the home page is displayed.
    expect(find.text('Home Page'), findsOneWidget);
  });
}
