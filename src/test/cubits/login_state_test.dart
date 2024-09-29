
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:login_app/cubits/login_state.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
	group('LoginState', () {
		test('supports value comparisons', () {
			expect(
				LoginState(),
				LoginState(),
			);
		});
	});

	group('LoginCubit', () {
		late LoginCubit loginCubit;

		setUp(() {
			loginCubit = MockLoginCubit();
		});

		tearDown(() {
			loginCubit.close();
		});

		blocTest<LoginCubit, LoginState>(
			'emits [LoginInitial] when loginCubit is created',
			build: () => loginCubit,
			expect: () => [LoginInitial()],
		);

		blocTest<LoginCubit, LoginState>(
			'emits [LoginLoading, LoginSuccess] when login is called successfully',
			build: () => loginCubit,
			act: (cubit) {
				when(() => cubit.login(any(), any())).thenAnswer((_) async {});
				cubit.login('email@example.com', 'password123');
			},
			expect: () => [LoginLoading(), LoginSuccess()],
		);

		blocTest<LoginCubit, LoginState>(
			'emits [LoginLoading, LoginFailure] when login fails',
			build: () => loginCubit,
			act: (cubit) {
				when(() => cubit.login(any(), any())).thenThrow(Exception('login failed'));
				cubit.login('email@example.com', 'password123');
			},
			expect: () => [LoginLoading(), LoginFailure('login failed')],
		);
	});
}
