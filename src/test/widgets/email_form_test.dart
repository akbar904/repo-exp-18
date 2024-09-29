
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/widgets/email_form.dart';

void main() {
	group('EmailForm Widget Tests', () {
		testWidgets('should display the email input field', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: EmailForm(),
					),
				),
			);

			// Act & Assert
			expect(find.byType(TextField), findsOneWidget);
			expect(find.text('Email'), findsOneWidget);
		});

		testWidgets('should display hint text in the email input field', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: EmailForm(),
					),
				),
			);

			// Act & Assert
			expect(find.byType(TextField), findsOneWidget);
			expect(find.byWidgetPredicate((Widget widget) {
				return widget is TextField && widget.decoration.hintText == 'Enter your email';
			}), findsOneWidget);
		});
	});
}
