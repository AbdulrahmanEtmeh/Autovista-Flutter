import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class CategoriesData {
  final ApiClient apiClient;

  CategoriesData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> getCategory(
    int categoryId,
  ) async {
    return apiClient.get(
      "${AppLinks.categories}/${categoryId.toString()}",
      authenticated: true,
    );
  }
}
