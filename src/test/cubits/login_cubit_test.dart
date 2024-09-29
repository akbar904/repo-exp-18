
// test/cubits/login_cubit_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:lib/cubits/login_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginCubit extends Mock implements LoginCubit {}

void main() {
	group('LoginCubit', () {
		late LoginCubit loginCubit;

		setUp(() {
			loginCubit = LoginCubit();
		});

		tearDown(() {
			loginCubit.close();
		});

		test('initial state is LoginInitial', () {
			expect(loginCubit.state, equals(LoginInitial()));
		});

		blocTest<LoginCubit, LoginState>(
			'emitInitial emits [LoginInitial]',
			build: () => loginCubit,
			act: (cubit) => cubit.emitInitial(),
			expect: () => [LoginInitial()],
		);

		blocTest<LoginCubit, LoginState>(
			'login emits [LoginLoading, LoginSuccess] when login is successful',
			build: () => loginCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [LoginLoading(), LoginSuccess()],
		);

		blocTest<LoginCubit, LoginState>(
			'login emits [LoginLoading, LoginFailure] when login fails',
			build: () => loginCubit,
			act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
			expect: () => [LoginLoading(), LoginFailure('Invalid credentials')],
		);
	});
}
