import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  factory DioClient() => _instance;

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://raw.githubusercontent.com/sayanp23/test-api/main/",

        // receiveTimeout: const Duration(seconds: 10),
        // connectTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      LogInterceptor(responseBody: false, requestBody: true),
    );
  }
}
