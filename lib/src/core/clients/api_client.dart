import 'package:dio/dio.dart';
import 'package:movies_app/src/config/app_config.dart';
import 'package:movies_app/src/core/constants/endpoints.dart';

class ApiClient {
  Dio? _instance;

  Dio get instance {
    if (_instance != null) {
      return _instance!;
    }
    _instance = _init();
    return _instance!;
  }

  _init() {
    Dio dio = Dio();
    dio.options.baseUrl = MovieEndpoints.base;
    dio.options.connectTimeout = 60 * 1000;
    dio.options.receiveTimeout = 30 * 1000;
    dio.options.receiveDataWhenStatusError = true;
    dio.options.headers["authorization"] = "Bearer ${AppConfig.bearerKey}";
    return dio;
  }
}
