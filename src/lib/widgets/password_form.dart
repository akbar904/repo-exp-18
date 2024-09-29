
import 'package:flutter/material.dart';

class PasswordForm extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return TextFormField(
			obscureText: true,
			decoration: InputDecoration(
				labelText: 'Password',
			),
		);
	}
}
