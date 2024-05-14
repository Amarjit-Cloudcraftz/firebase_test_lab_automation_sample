import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_automation_test_lab/main.dart';

void main() {
  group('Login Page Tests', () {
    testWidgets('Email validation', (WidgetTester tester) async {
      // Build the LoginPage widget
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      // Find the email text field
      final emailField = find.byKey(const Key('email_field'));

      // Enter an invalid email address
      await tester.enterText(emailField, 'invalid_email');

      // Trigger validation by tapping the login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Verify that an error message is displayed
      expect(find.text('Please enter a valid email address'), findsOneWidget);

      // Enter a valid email address
      await tester.enterText(emailField, 'valid@email.com');

      // Trigger validation by tapping the login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Verify that no error message is displayed
      expect(find.text('Please enter a valid email address'), findsNothing);
    });

    testWidgets('Password validation', (WidgetTester tester) async {
      // Build the LoginPage widget
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      // Find the password text field
      final passwordField = find.byKey(const Key('password_field'));

      // Enter an invalid password
      await tester.enterText(passwordField, 'invalid_password');

      // Trigger validation by tapping the login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Verify that an error message is displayed
      expect(
          find.text(
              'Password must be at least 8 characters long and contain at least one letter and one number'),
          findsOneWidget);

      // Enter a valid password
      await tester.enterText(passwordField, 'ValidPassword123');

      // Trigger validation by tapping the login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Verify that no error message is displayed
      expect(
          find.text(
              'Password must be at least 8 characters long and contain at least one letter and one number'),
          findsNothing);
    });

    testWidgets('Successful login', (WidgetTester tester) async {
      // Build the LoginPage widget
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      // Find the email and password text fields
      final emailField = find.byKey(const Key('email_field'));
      final passwordField = find.byKey(const Key('password_field'));

      // Enter valid credentials
      await tester.enterText(emailField, 'valid@email.com');
      await tester.enterText(passwordField, 'ValidPassword123');

      // Trigger validation by tapping the login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify that the Home Page is displayed
      expect(find.text('Home Page'), findsOneWidget);
    });
  });
}
