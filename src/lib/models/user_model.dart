
import 'package:flutter/foundation.dart';

class UserModel {
	final String email;
	final String password;

	UserModel({
		required this.email,
		required this.password,
	});

	Map<String, dynamic> toJson() {
		return {
			'email': email,
			'password': password,
		};
	}

	factory UserModel.fromJson(Map<String, dynamic> json) {
		return UserModel(
			email: json['email'],
			password: json['password'],
		);
	}
}
