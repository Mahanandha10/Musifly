import 'dart:io';
import 'package:client/core/constants/server_constant.dart';
import 'package:client/core/failure/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<Either<AppFailure, String>> uploadSong(
    File selectedImage,
    File selectedAudio,
  ) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('${ServerConstant.serverURL}/song/upload'),
      );
      request
        ..files.addAll([
          await http.MultipartFile.fromPath('song', selectedAudio.path),
          await http.MultipartFile.fromPath('thumbnail', selectedImage.path),
        ])
        ..fields.addAll({
          'artist': 'TaylorSwift',
          'song_name': 'LovemeDo',
          'hex_code': 'FFFFFF',
        })
        ..headers.addAll(
          {
            'x-auth-token':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjAyOTYzMGEwLWU3YzYtNDljNC05MzQyLTM1MDg1ZWQxODYxZSJ9.epvfv6fER-u7FE1WW5TmlI8loXvUC1a5LP9kUTqdQIY'
          },
        );
      final res = await request.send();
      if (res.statusCode != 201) {
        return Left(AppFailure(await res.stream.bytesToString()));
      }
      return Right(await res.stream.bytesToString());
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
