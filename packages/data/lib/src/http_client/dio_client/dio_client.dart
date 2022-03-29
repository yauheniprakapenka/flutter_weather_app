import 'package:dio/dio.dart';

import 'dio_logging_interceptor.dart';

Dio dioClient(String baseUrl) {
  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 15000,
      receiveTimeout: 15000,
    ),
  )..interceptors.add(DioLoggingInterceptor());
}
