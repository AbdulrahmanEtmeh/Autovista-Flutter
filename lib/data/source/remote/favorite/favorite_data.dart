import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class FavoriteData {
  final ApiClient apiClient;
  FavoriteData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> addFavorite(int carId) async {
    return apiClient.post(
      "${AppLinks.favoriteToggle}/${carId.toString()}",
      {},
      authenticated: true,
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> removeFavorite(int carId) async {
    return addFavorite(carId);
  }

  Future<ApiResponse<Map<String, dynamic>>> getFavoriteList(int userId) async {
    return apiClient.get(
      AppLinks.favoriteViewPaged,
      authenticated: true,
    );
  }
}
