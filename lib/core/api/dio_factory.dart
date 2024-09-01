import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> initDio() async {
    Duration timeout = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = timeout;
      dio!.options.receiveTimeout = timeout;
      addInterceptors(dio!);
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addInterceptors(Dio dio) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }
}
