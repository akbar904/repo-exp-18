
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.login_app/cubits/login_cubit.dart';
import 'package:com.example.login_app/widgets/email_form.dart';
import 'package:com.example.login_app/widgets/password_form.dart';
import 'package:com.example.login_app/widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					children: [
						EmailForm(),
						PasswordForm(),
						BlocBuilder<LoginCubit, LoginState>(
							builder: (context, state) {
								if (state is LoginLoading) {
									return CircularProgressIndicator();
								} else if (state is LoginFailure) {
									return Text(
										'Login Failed',
										style: TextStyle(color: Colors.red),
									);
								}
								return LoginButton();
							},
						),
					],
				),
			),
		);
	}
}
