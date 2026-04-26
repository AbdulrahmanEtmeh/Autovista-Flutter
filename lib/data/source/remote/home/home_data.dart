import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

import '../../../../core/services/my_services.dart';

class HomeData {
  MyServices myServices = Get.find();
  final ApiClient apiClient;

  HomeData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> getData(int userId) async {
    return apiClient.get(AppLinks.cars, authenticated: true);
  }

  Future<ApiResponse<Map<String, dynamic>>> getStyles() async {
    return apiClient.get('${AppLinks.styles}?per_page=10', authenticated: true);
  }

  Future<ApiResponse<Map<String, dynamic>>> getBrands() async {
    return apiClient.get(AppLinks.brands, authenticated: true);
  }

  Future<ApiResponse<Map<String, dynamic>>> serachData(String search) async {
    return apiClient.get("${AppLinks.homeSearch}$search", authenticated: true);
  }
}
