import 'package:get/get.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

import '../../../../core/constant/app_links.dart';
import '../../../../core/services/my_services.dart';

class SearchData {
  MyServices myServices = Get.find();
  final ApiClient apiClient;

  SearchData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> serachData(String search) async {
    final value = search.trim();
    final query = value.isEmpty
        ? 'per_page=10'
        : 'per_page=10&search=${Uri.encodeQueryComponent(value)}';
    return apiClient.get('${AppLinks.cars}?$query', authenticated: true);
  }
}
