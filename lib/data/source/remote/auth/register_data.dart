import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class RegisterData {
  final ApiClient apiClient;

  RegisterData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> postData(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    return apiClient.post(
      AppLinks.register,
      {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      },
    );
  }
}
