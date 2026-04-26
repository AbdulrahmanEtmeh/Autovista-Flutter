import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class FilterData {
  final ApiClient apiClient;

  FilterData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> getData(
    String brandName,
    String name,
    String gearType,
    String styleName,
    int capacity,
    List cylinders,
    int rent,
  ) async {
    final body = {
      'brandName': brandName,
      'name': name,
      'gearType': gearType,
      'styleName': styleName,
      'capacity': capacity.toString(),
      'cylinders': cylinders,
      'rent': rent.toString(),
    };

    return apiClient.post(
      AppLinks.filter,
      body,
      isJson: true,
      authenticated: true,
    );
  }
}
