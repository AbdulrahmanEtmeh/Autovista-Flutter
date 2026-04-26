import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class ForgetPasswordData {
  final ApiClient apiClient;

  ForgetPasswordData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> postData(String email) async {
    return apiClient.post(
        AppLinks.forgetPassword,
        {
          'email': email.trim(),
        },
        isJson: true);
  }
}
