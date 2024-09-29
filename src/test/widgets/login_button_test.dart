
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:login_app/widgets/login_button.dart';

void main() {
	group('LoginButton Widget Tests', () {
		testWidgets('renders LoginButton with correct text', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LoginButton(),
					),
				),
			);

			// Act & Assert
			expect(find.text('Login'), findsOneWidget);
		});

		testWidgets('triggers onPressed callback when tapped', (WidgetTester tester) async {
			// Arrange
			var callbackTriggered = false;
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LoginButton(
							onPressed: () {
								callbackTriggered = true;
							},
						),
					),
				),
			);

			// Act
			await tester.tap(find.byType(LoginButton));
			await tester.pump(); // Rebuild the widget

			// Assert
			expect(callbackTriggered, isTrue);
		});
	});
}
