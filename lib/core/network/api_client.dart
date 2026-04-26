import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/function/check_internet.dart';
import 'package:graduation_project/core/network/api_response.dart';
import 'package:graduation_project/core/services/my_services.dart';

class ApiClient {
  ApiClient({MyServices? myServices}) : myServices = myServices ?? Get.find();

  final MyServices myServices;

  // ─── Clean unified methods ────────────────────────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> get(
    String url, {
    bool authenticated = false,
  }) async {
    try {
      final hasInternet = await checkInternet();
      if (hasInternet != true) {
        print('[ApiClient] No internet connection');
        return const ApiFailure(statusRequest: StatusRequest.offlineFailure);
      }

      print('[ApiClient] GET $url');

      final response = await http
          .get(Uri.parse(url), headers: _headers(authenticated: authenticated))
          .timeout(const Duration(seconds: 30));

      print('[ApiClient] Status Code: ${response.statusCode}');
      print(
          '[ApiClient] Raw Response (first 500 chars): ${response.body.substring(0, response.body.length > 500 ? 500 : response.body.length)}');

      final responseBody = _decodeBody(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiSuccess(responseBody, statusCode: response.statusCode);
      }

      return ApiFailure(
        statusRequest: _mapStatusCode(response.statusCode),
        message: responseBody['message']?.toString(),
        statusCode: response.statusCode,
        error: responseBody,
      );
    } catch (error) {
      print('[ApiClient] Exception: $error');
      return ApiFailure(
        statusRequest: StatusRequest.serverException,
        error: error,
      );
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> post(
    String url,
    Map<String, dynamic> body, {
    bool isJson = false,
    bool authenticated = false,
  }) async {
    try {
      final hasInternet = await checkInternet();
      if (hasInternet != true) {
        print('[ApiClient] No internet connection');
        return const ApiFailure(statusRequest: StatusRequest.offlineFailure);
      }

      print('[ApiClient] POST $url');
      print('[ApiClient] Request Body: $body');

      final headers = _headers(authenticated: authenticated, isJson: isJson);

      final response = await http
          .post(
            Uri.parse(url),
            headers: headers,
            body: isJson
                ? jsonEncode(body)
                : body.map((k, v) => MapEntry(k, v.toString())),
          )
          .timeout(const Duration(seconds: 30));

      print('[ApiClient] Status Code: ${response.statusCode}');
      print(
          '[ApiClient] Raw Response (first 500 chars): ${response.body.substring(0, response.body.length > 500 ? 500 : response.body.length)}');

      final responseBody = _decodeBody(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiSuccess(responseBody, statusCode: response.statusCode);
      }

      return ApiFailure(
        statusRequest: _mapStatusCode(response.statusCode),
        message: responseBody['message']?.toString(),
        statusCode: response.statusCode,
        error: responseBody,
      );
    } catch (error) {
      print('[ApiClient] Exception: $error');
      return ApiFailure(
        statusRequest: StatusRequest.serverException,
        error: error,
      );
    }
  }

  Map<String, dynamic> _decodeBody(String body) {
    if (body.isEmpty) {
      return <String, dynamic>{};
    }

    try {
      final decoded = jsonDecode(body);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
      if (decoded is Map) {
        return Map<String, dynamic>.from(decoded);
      }
      return <String, dynamic>{'data': decoded};
    } catch (e) {
      // If JSON parsing fails, it's likely an HTML error page
      print('[ApiClient] JSON Parse Error: $e');
      print('[ApiClient] Raw Response: $body');

      // Check if it's HTML
      if (body.contains('<!DOCTYPE') || body.contains('<html')) {
        return <String, dynamic>{
          'error': 'Server returned HTML (likely error page)',
          'rawResponse':
              body.substring(0, body.length > 200 ? 200 : body.length),
        };
      }

      return <String, dynamic>{
        'error': 'Failed to parse response: $e',
        'rawResponse': body,
      };
    }
  }

  StatusRequest _mapStatusCode(int statusCode) {
    if (statusCode == 401 || statusCode == 403) {
      return StatusRequest.failure;
    }
    if (statusCode >= 500) {
      return StatusRequest.serverFailure;
    }
    return StatusRequest.failure;
  }

  Map<String, String> _headers({
    bool authenticated = false,
    bool isJson = false,
  }) {
    return {
      'Accept': 'application/json',
      if (isJson) 'Content-Type': 'application/json',
      if (authenticated)
        'Authorization':
            'Bearer ${myServices.sharedPreferences.getString('token')}',
    };
  }
}
