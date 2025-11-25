import 'dart:async';

Future<Map<String, dynamic>> mockLogin(String username, String password) async {
	await Future.delayed(const Duration(milliseconds: 600));

	// Simple test credentials
	if (username == 'test' && password == 'password') {
		return {
			'success': true,
			'token': 'fake-jwt-token-12345',
			'user': {
				'id': 1,
				'name': 'Test User',
				'email': 'test@example.com',
			}
		};
	}

	return {
		'success': false,
		'message': 'Invalid username or password',
	};
}

