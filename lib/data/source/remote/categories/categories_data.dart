import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class CategoriesData {
  final ApiClient apiClient;

  CategoriesData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> getCarsCategories(
    int styleId,
  ) async {
    return apiClient.get(
      "${AppLinks.categories}/${styleId.toString()}/cars",
      authenticated: true,
    );
  }
}
