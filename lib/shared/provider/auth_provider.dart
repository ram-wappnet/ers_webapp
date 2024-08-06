import '../../export.dart';
import 'dio_base_rest_provider.dart';

class AuthProviderApi extends DioBaseRestProvider {
  static Future<dynamic>? login(
    String email,
    String password,
    String devicetoken,
  ) async {
    try {
      var dio = await DioBaseRestProvider.client;
      var response = await dio.post<Map<String, dynamic>>(
        ApiEndPoints.login,
        data: {
          "email": email,
          "password": password,
          "token": devicetoken,
        },
      );

      return response.data ?? {};
    } catch (error, s) {
      printErsLog(error.toString());
      printErsLog(s.toString());
      rethrow;
    }
  }
}
