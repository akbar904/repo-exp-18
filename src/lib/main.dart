
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/login_cubit.dart';
import 'screens/login_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Login App',
			home: BlocProvider(
				create: (context) => LoginCubit(),
				child: LoginScreen(),
			),
		);
	}
}
