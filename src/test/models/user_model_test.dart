
import 'package:flutter_test/flutter_test.dart';
import 'package:login_app/models/user_model.dart';

void main() {
	group('UserModel', () {
		test('should create a UserModel instance with given email and password', () {
			// Arrange
			const email = 'test@example.com';
			const password = 'password123';

			// Act
			final user = UserModel(email: email, password: password);

			// Assert
			expect(user.email, email);
			expect(user.password, password);
		});

		test('should serialize UserModel to JSON', () {
			// Arrange
			const email = 'test@example.com';
			const password = 'password123';
			final user = UserModel(email: email, password: password);
			final expectedJson = {
				'email': email,
				'password': password,
			};

			// Act
			final json = user.toJson();

			// Assert
			expect(json, expectedJson);
		});

		test('should deserialize UserModel from JSON', () {
			// Arrange
			const email = 'test@example.com';
			const password = 'password123';
			final json = {
				'email': email,
				'password': password,
			};

			// Act
			final user = UserModel.fromJson(json);

			// Assert
			expect(user.email, email);
			expect(user.password, password);
		});
	});
}
