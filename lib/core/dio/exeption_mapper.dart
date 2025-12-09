import 'package:boardingweek/core/utility/failures.dart';
import 'package:dio/dio.dart';
 

Failure mapDioError(DioException e) {
  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.sendTimeout) {
    return NetworkFailure("Network Timeout");
  }

  if (e.type == DioExceptionType.badResponse) {
    return ServerFailure("Server Error: ${e.response?.statusCode}");
  }

  return UnknownFailure("Something Went Wrong");
}

