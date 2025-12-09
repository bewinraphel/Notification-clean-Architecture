import 'dart:io';
import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio dio;

  factory DioClient() => _instance;

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://raw.githubusercontent.com/sayanp23/test-api/main/",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 12),
        sendTimeout: const Duration(seconds: 12),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Accept": "application/json",
        },
      ),
    );

    dio.interceptors.addAll([_loggerInterceptor(), _errorInterceptor()]);
  }

  // ******************** LOGGER ********************
  Interceptor _loggerInterceptor() {
    return LogInterceptor(
      requestBody: true,
      responseBody: false,
      requestHeader: true,
      responseHeader: false,
    );
  }

  // ******************** ERROR HANDLING ********************
  Interceptor _errorInterceptor() {
    return InterceptorsWrapper(
      onError: (DioException e, handler) {
        final msg = _mapError(e);
        handler.next(
          DioException(requestOptions: e.requestOptions, error: msg),
        );
      },
    );
  }

  String _mapError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timed out";
      case DioExceptionType.receiveTimeout:
        return "Receiving data timed out";
      case DioExceptionType.sendTimeout:
        return "Sending data timed out";
      case DioExceptionType.badCertificate:
        return "Bad SSL certificate";
      case DioExceptionType.cancel:
        return "Request cancelled";
      case DioExceptionType.badResponse:
        return _handleStatusCode(e.response);
      case DioExceptionType.connectionError:
        return "No Internet connection";
      case DioExceptionType.unknown:
      default:
        return "Unexpected error occurred";
    }
  }

  String _handleStatusCode(Response? response) {
    if (response == null) return "No response from server";
    switch (response.statusCode) {
      case 400:
        return "Bad request";
      case 401:
        return "Unauthorized access";
      case 403:
        return "Forbidden";
      case 404:
        return "Not found";
      case 500:
        return "Server error";
      default:
        return "Unexpected server error";
    }
  }
}
