
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:login_app/main.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
	group('Main App Initialization', () {
		testWidgets('App starts and shows LoginScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			// Verify that the LoginScreen is displayed
			expect(find.byType(LoginScreen), findsOneWidget);
		});
	});

	group('LoginScreen Widgets', () {
		testWidgets('Email and Password forms are displayed', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			// Verify that EmailForm and PasswordForm are displayed
			expect(find.byType(EmailForm), findsOneWidget);
			expect(find.byType(PasswordForm), findsOneWidget);
		});

		testWidgets('Login Button is displayed', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			// Verify that LoginButton is displayed
			expect(find.byType(LoginButton), findsOneWidget);
		});
	});

	group('LoginCubit', () {
		MockLoginCubit loginCubit;

		setUp(() {
			loginCubit = MockLoginCubit();
		});

		blocTest<MockLoginCubit, LoginState>(
			'emitInitial should emit initial state',
			build: () => loginCubit,
			act: (cubit) => cubit.emitInitial(),
			expect: () => [isA<LoginInitial>()],
		);

		blocTest<MockLoginCubit, LoginState>(
			'login should emit loading and success states',
			build: () => loginCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [isA<LoginLoading>(), isA<LoginSuccess>()],
		);
	});
}
