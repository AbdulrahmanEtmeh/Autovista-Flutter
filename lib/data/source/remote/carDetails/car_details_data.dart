import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class CarDetailsData {
  final ApiClient apiClient;

  CarDetailsData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> getCarDetails(int carId) async {
    return apiClient.get(
      '${AppLinks.carDetails}/$carId',
      authenticated: true,
    );
  }
}
