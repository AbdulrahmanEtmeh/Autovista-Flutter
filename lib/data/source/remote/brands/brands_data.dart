import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class BrandsData {
  final ApiClient apiClient;

  BrandsData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> getCarsBrands(int brandId) async {
    return apiClient.get(
      "${AppLinks.brands}/${brandId.toString()}/cars",
      authenticated: true,
    );
  }
}
