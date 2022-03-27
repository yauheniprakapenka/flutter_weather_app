import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('''
===============================
Request:
${options.method}:
${options.uri}
${options.headers.entries}
${options.data}
''');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint('''
===============================
Error: 
${err.requestOptions.method}:
${err.requestOptions.uri}
${err.requestOptions.headers.entries}
${err.requestOptions.data}
${err.response?.statusCode} ${err.response?.statusMessage}
${err.error}
${err.response?.data}
''');
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('''
===============================
Response: 
${response.requestOptions.method}:
${response.requestOptions.uri}
${response.requestOptions.headers.entries}
${response.requestOptions.data}
${response.statusCode} ${response.statusMessage}
${response.data}
''');
    super.onResponse(response, handler);
  }
}
