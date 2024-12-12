import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_local_repositories.g.dart';

@Riverpod(keepAlive: true)
AuthLocalRepositrories authLocalRepositrories(AuthLocalRepositroriesRef ref) {
  return AuthLocalRepositrories();
}

class AuthLocalRepositrories {
  late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void setToken(String? token) {
    if (token != null) {
      _sharedPreferences.setString('x-auth-token', token);
    }
  }

  String? getToken() {
    return _sharedPreferences.getString('x-auth-token');
  }
}
