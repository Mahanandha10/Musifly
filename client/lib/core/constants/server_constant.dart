import 'dart:io';

class ServerConstant {
  static String serverURL = 
     Platform.isAndroid ? 'http://192.168.43.207:8000' : 'http://127.0.0.1:8000';
}
