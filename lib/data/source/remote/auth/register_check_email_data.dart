import '../../../../core/constant/app_links.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';

class RegisterCheckEmailData {
  final ApiClient apiClient;

  RegisterCheckEmailData(this.apiClient);

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
