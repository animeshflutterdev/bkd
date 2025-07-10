import 'dart:async';

import 'package:http/http.dart' as http;

import 'api_endpoints.dart';

class ApiService {
  static Duration get _timeout => const Duration(minutes: 1);

  static Map<String, String> get _headers =>
      {'Content-Type': 'application/json'};

  // GET request
  static Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    try {
      final mergedHeaders = {..._headers, if (headers != null) ...headers};
      final response = await http
          .get(
            Uri.parse(ApiEndpoints.getFullUrl(endpoint)),
            headers: mergedHeaders,
          )
          .timeout(_timeout);
      return response;
    } on TimeoutException {
      throw TimeoutException('Request timed out after $_timeout');
    } catch (e) {
      throw Exception('Failed to make GET request: $e');
    }
  }

  // POST request
  static Future<http.Response> post(String endpoint,
      {Map<String, dynamic>? body}) async {
    try {
      final response = await http
          .post(
            Uri.parse(ApiEndpoints.getFullUrl(endpoint)),
            headers: _headers,
            body: body,
          )
          .timeout(_timeout);
      return response;
    } on TimeoutException {
      throw TimeoutException('Request timed out after $_timeout');
    } catch (e) {
      throw Exception('Failed to make POST request: $e');
    }
  }

  // PUT request
  static Future<http.Response> put(String endpoint,
      {Map<String, dynamic>? body}) async {
    try {
      final response = await http
          .put(
            Uri.parse(ApiEndpoints.getFullUrl(endpoint)),
            headers: _headers,
            body: body,
          )
          .timeout(_timeout);
      return response;
    } on TimeoutException {
      throw TimeoutException('Request timed out after $_timeout');
    } catch (e) {
      throw Exception('Failed to make PUT request: $e');
    }
  }

  // DELETE request
  static Future<http.Response> delete(String endpoint) async {
    try {
      final response = await http
          .delete(
            Uri.parse(ApiEndpoints.getFullUrl(endpoint)),
            headers: _headers,
          )
          .timeout(_timeout);
      return response;
    } on TimeoutException {
      throw TimeoutException('Request timed out after $_timeout');
    } catch (e) {
      throw Exception('Failed to make DELETE request: $e');
    }
  }

  // Helper method to handle response
  static dynamic handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      throw Exception('Failed with status code: ${response.statusCode}');
    }
  }
}
