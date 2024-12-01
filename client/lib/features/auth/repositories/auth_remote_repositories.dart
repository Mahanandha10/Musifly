import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRemoteRepositories {
  Future<void> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      // signup logic
      final response = await http.post(
        Uri.parse(
          'http://127.0.0.1:8000/auth/signup',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'name': username,
            'email': email,
            'password': password,
          },
        ), // your JSON data
      );
      print(response.body);
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try{
 // login logic
    final response = await http.post(
      Uri.parse(
        'http://127.0.0.1:8000/auth/login',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ), // your JSON data
    );
    print(response.body);
    print(response.statusCode);
 
    }catch(e){
      print(e);
    }
    }
}
