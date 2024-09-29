
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.login_app/screens/login_screen.dart';
import 'package:com.example.login_app/cubits/login_cubit.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display email form', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));
			expect(find.byType(EmailForm), findsOneWidget);
		});

		testWidgets('should display password form', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));
			expect(find.byType(PasswordForm), findsOneWidget);
		});

		testWidgets('should display login button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));
			expect(find.byType(LoginButton), findsOneWidget);
		});
	});

	group('LoginScreen Cubit Tests', () {
		late LoginCubit loginCubit;

		setUp(() {
			loginCubit = MockLoginCubit();
		});

		blocTest<LoginCubit, LoginState>(
			'initial state is LoginInitial',
			build: () => loginCubit,
			expect: () => [],
		);

		blocTest<LoginCubit, LoginState>(
			'emits [LoginLoading, LoginSuccess] when login is successful',
			build: () => loginCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [LoginLoading(), LoginSuccess()],
		);

		blocTest<LoginCubit, LoginState>(
			'emits [LoginLoading, LoginFailure] when login fails',
			build: () => loginCubit,
			act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
			expect: () => [LoginLoading(), LoginFailure()],
		);
	});
}
