import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class CarPartsData {
  final ApiClient apiClient;
  CarPartsData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> getBrands() async {
    return apiClient.get(
      AppLinks.carPartsBrands,
      authenticated: true,
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> getCarPartsCategories() async {
    return apiClient.get(
      AppLinks.carPartsCategories,
      authenticated: true,
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> getCarPartsItems([
    int? brandId,
    int? categoryId,
  ]) async {
    final queryParts = <String>['per_page=10'];
    if (brandId != null) {
      queryParts.add('brand_id=${brandId.toString()}');
    }
    if (categoryId != null) {
      queryParts.add('category_id=${categoryId.toString()}');
    }

    final url = '${AppLinks.carPartsItemsBase}?${queryParts.join('&')}';

    return apiClient.get(
      url,
      authenticated: true,
    );
  }
}
