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
    return apiClient.get("${AppLinks.homeSearch}$search", authenticated: true);
  }
}
