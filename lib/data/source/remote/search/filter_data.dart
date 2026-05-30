import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class FilterData {
  final ApiClient apiClient;

  FilterData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> getData(
    Map<String, dynamic> filters,
  ) async {
    final queryParts = <String>['per_page=10'];

    void addParam(String key, dynamic value) {
      if (value == null) return;
      final text = value.toString().trim();
      if (text.isEmpty) return;
      queryParts.add(
          '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(text)}');
    }

    addParam('search', filters['search']);
    addParam('gear_type', filters['gear_type']);
    addParam('is_rent', filters['is_rent']);
    addParam('brand_id', filters['brand_id']);
    addParam('style_id', filters['style_id']);
    addParam('cylinders', filters['cylinders']);
    addParam('capacity', filters['capacity']);
    addParam('color', filters['color']);
    addParam('price', filters['price']);

    final url = '${AppLinks.cars}?${queryParts.join('&')}';

    return apiClient.get(
      url,
      authenticated: true,
    );
  }
}
