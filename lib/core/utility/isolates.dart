import 'dart:convert';
import 'package:flutter/foundation.dart';

Future<List<Map<String, dynamic>>> parseNotificationsInIsolate(
  String responseBody,
) {
  return compute(_decodeJson, responseBody);
}

List<Map<String, dynamic>> _decodeJson(String responseBody) {
  final raw = jsonDecode(responseBody);
  return raw['data'];
}
