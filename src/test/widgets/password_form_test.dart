
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:login_app/widgets/password_form.dart';

void main() {
	group('PasswordForm Widget Tests', () {
		testWidgets('should display a text field for password input', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: PasswordForm())));
			
			expect(find.byType(TextFormField), findsOneWidget);
		});
		
		testWidgets('should display "Password" as the label text', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: PasswordForm())));
			
			expect(find.text('Password'), findsOneWidget);
		});
		
		testWidgets('should hide password by default', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: PasswordForm())));
			
			TextFormField textFormField = tester.widget(find.byType(TextFormField));
			expect(textFormField.obscureText, isTrue);
		});
	});
}
