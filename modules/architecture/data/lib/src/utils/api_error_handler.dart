import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

Failure handleApirError(Exception e) {
  if (e is DioError) {
    return Failure(
      message: '${e.response?.statusMessage}. ${e.response?.data['message']}',
      statusCode: e.response?.statusCode,
    );
  }
  return Failure(message: '$e');
}
