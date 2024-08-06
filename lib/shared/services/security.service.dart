import 'package:get_storage/get_storage.dart';

class SecurityService {
  static const String _tokenKey = "token";
  static Future<void> setToken(String value) async {
    await GetStorage().write(_tokenKey, value);
  }

  static Future<String?> getToken() async {
    String? token = GetStorage().read(_tokenKey);
    return token;
  }

  static Future<void> deleteToken() async {
    await GetStorage().remove(_tokenKey);
  }
}
