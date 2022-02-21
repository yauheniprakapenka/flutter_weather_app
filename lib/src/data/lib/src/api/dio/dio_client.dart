import 'package:dio/dio.dart';

import 'dio_logging_interceptor.dart';

class DioClient {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5/',
      connectTimeout: 15000,
      receiveTimeout: 15000,
    ),
  )..interceptors.add(DioLoggingInterceptor());
}
