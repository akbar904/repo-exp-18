
import 'package:flutter/material.dart';

class EmailForm extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.all(16.0),
			child: TextField(
				decoration: InputDecoration(
					labelText: 'Email',
					hintText: 'Enter your email',
					border: OutlineInputBorder(),
				),
				keyboardType: TextInputType.emailAddress,
			),
		);
	}
}
