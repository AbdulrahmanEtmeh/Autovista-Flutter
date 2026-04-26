import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class ResetPasswordData {
  final ApiClient apiClient;

  ResetPasswordData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> postData(
    String email,
    String password,
  ) async {
    return apiClient.post(
        AppLinks.resetPassword,
        {
          'email': email.trim(),
          'password': password,
        },
        isJson: true);
  }
}
