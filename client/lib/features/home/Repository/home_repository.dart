import 'dart:io';
import 'package:client/core/constants/server_constant.dart';
import 'package:http/http.dart' as http;

class HomeRepository{
  Future<void> uploadSong(
    File selectedImage, 
    File selectedAudio,
    ) async{
    final request = http.MultipartRequest('POST',Uri.parse('${ServerConstant.serverURL}/song/upload'),
    );
    request..files.addAll([
      await http.MultipartFile.fromPath('song', selectedAudio.path),
       await http.MultipartFile.fromPath('thumbnail', selectedImage.path),
    ])..fields.addAll({
      'artist': 'TaylorSwift',
      'song_name':'LovemeDo',
      'hex_code':'FFFFFF',
    })..headers.addAll({
      'x-auth-token':'eyJhbGciOsiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImJlNzRlZGZjLTI0OTctNDhhYy1iYmY5LTUzY2Y4NjVjYTc2MSJ9.WMlWkpFDAYwc8Oy_glNy0C3xxrtfLGnd9tWo22KImM8'
    },);
    final res = await request.send();
    print(res);
  }
}