
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
	LoginCubit() : super(LoginInitial());

	void emitInitial() {
		emit(LoginInitial());
	}

	void login(String email, String password) async {
		emit(LoginLoading());
		await Future.delayed(Duration(seconds: 1)); // Simulate network delay

		// Dummy login logic for demonstration
		if (email == 'test@example.com' && password == 'password123') {
			emit(LoginSuccess());
		} else {
			emit(LoginFailure('Invalid credentials'));
		}
	}
}

class LoginState extends Equatable {
	@override
	List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
	final String error;

	LoginFailure(this.error);

	@override
	List<Object> get props => [error];
}
