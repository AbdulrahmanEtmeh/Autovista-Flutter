import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class LoginData {
  final ApiClient apiClient;

  LoginData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> postData(
    String email,
    String password,
  ) async {
    return apiClient.post(
      AppLinks.login,
      {
        'email': email,
        'password': password,
      },
    );
  }
}
