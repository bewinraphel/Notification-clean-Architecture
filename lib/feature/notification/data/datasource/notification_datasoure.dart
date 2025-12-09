import 'package:dio/dio.dart';

import 'dart:convert';
import 'package:flutter/foundation.dart';

List<Map<String, dynamic>> _parseAndDecode(String responseBody) {
  final decoded = jsonDecode(responseBody);
  return List<Map<String, dynamic>>.from(decoded['data']);
}

class NotificationRemoteDataSource {
  final Dio dio;
  NotificationRemoteDataSource(this.dio);

  Future<List<Map<String, dynamic>>> getAll() async {
    final response = await dio.get("test-notifications.json");

    return await compute(_parseAndDecode, response.data as String);
  }
}
