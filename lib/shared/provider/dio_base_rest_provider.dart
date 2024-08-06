import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../config/environment.dart';
import '../../utils/const_files/general_constants.dart';
import '../services/security.service.dart';

class DioBaseRestProvider {
  static bool _sessionExpiredShown = false;

  static Future<Dio> get client async {
    var token = await SecurityService.getToken();

    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    if (token?.isNotEmpty ?? false) {
      headers.putIfAbsent("Authorization", () => "Bearer $token");
    }

    // base URL
    var dio = Dio(
      BaseOptions(
        baseUrl: Environment().config.baseUrl,
        contentType: "application/json",
        connectTimeout:
            const Duration(milliseconds: GeneralConstants.requestTimeout),
        receiveTimeout:
            const Duration(milliseconds: GeneralConstants.requestTimeout),
        headers: headers,
      ),
    );

    // when app is in debug mode LogInterceptor will work and also  send Error,Request and Response ToSlack work
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: true,
        request: false,
        responseHeader: false,
        requestBody: true,
      ));
    }
    // send Error,Request and Response ToSlack work
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          if (_sessionExpiredShown == false) {
            _sessionExpiredShown = true;
            //IMPLEMNT LOGOUT AND SHOW SESSION EXPIRE POPUP
            /*   await AuthManager().clearProfileUserDataAndLogout();
            AnimatedSnackBar.removeAll();
            ShowCustomToast()
                .showErrorToast(Keys.sessionExpired.tr)
                .whenComplete(() => _sessionExpiredShown = false); */
          }
          return handler.next(error);
        }

        return handler.next(error);
      },
    ));

    return dio;
  }
}
