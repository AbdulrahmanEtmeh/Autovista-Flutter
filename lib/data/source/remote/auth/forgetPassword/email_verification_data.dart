import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class EmailVerificationData {
  final ApiClient apiClient;

  EmailVerificationData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> postData(
    String email,
    String verifyCode,
  ) async {
    final normalizedCode = int.tryParse(verifyCode.trim()) ?? verifyCode.trim();

    return apiClient.post(
        AppLinks.registerCheckEmail,
        {
          'email': email.trim(),
          'code': normalizedCode,
        },
        isJson: true);
  }
}
