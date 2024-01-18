import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiDio extends DioForNative {
  ApiDio() {
    _configureOptions();
  }

  @override
  HttpClientAdapter get httpClientAdapter {
    return IOHttpClientAdapter()
      ..createHttpClient = () {
        final client = HttpClient();
        return client
          ..badCertificateCallback = (
              X509Certificate cert,
              String host,
              int port,
              ) {
            return true;
          };
      };
  }

  void _configureOptions() {
    options
      ..sendTimeout = const Duration(seconds: 10)
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10)
      ..baseUrl = "https://www.themealdb.com/api/json";
  }
}
