import 'dart:convert';
import 'package:client/core/constants/server_constant.dart';
import 'package:client/core/failure/failure.dart';
import 'package:client/features/auth/model/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_remote_repositories.g.dart';

@riverpod
AuthRemoteRepositories authRemoteRepositories(AuthRemoteRepositoriesRef ref) {
  return AuthRemoteRepositories();
}

class AuthRemoteRepositories {
  Future<Either<AppFailure, UserModel>> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      // signup logic
      final response = await http.post(
        Uri.parse(
          '${ServerConstant.serverURL}/auth/signup',
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
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 201) {
        //handle error
        //{'detail':"error message"}
        return Left(AppFailure(resBodyMap['detail']));
      }

      return Right(UserModel.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      // login logic
      final response = await http.post(
        Uri.parse(
          '${ServerConstant.serverURL}/auth/login',
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
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        return Left(AppFailure(resBodyMap['detail']));
      }
      return Right(UserModel.fromMap(resBodyMap['user']).copyWith(
        token: resBodyMap['token'],
      ));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
//current user data
Future<Either<AppFailure, UserModel>> getCurrentUserData(String token) async {
    try {
      // login logic
      final response = await http.get(
        Uri.parse(
          '${ServerConstant.serverURL}/auth/',
        ),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },// your JSON data
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        return Left(AppFailure(resBodyMap['detail']));
      }
      return Right(UserModel.fromMap(resBodyMap).copyWith(
        token: token,
      ));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

}
