import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/network/api_client.dart';
import 'package:graduation_project/core/network/api_response.dart';

class CartData {
  final ApiClient apiClient;
  CartData(this.apiClient);

  Future<ApiResponse<Map<String, dynamic>>> addCart(
    int partId, {
    int quantity = 1,
  }) async {
    return apiClient.post(
      AppLinks.cartAdd,
      {
        'quantity': quantity,
        'part_id': partId,
      },
      authenticated: true,
      isJson: true,
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> removeCart(int partId) async {
    return apiClient.delete(
      "${AppLinks.cartRemove}/${partId.toString()}",
      authenticated: true,
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> getCartItems() async {
    return apiClient.get(
      AppLinks.cartView,
      authenticated: true,
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> clearCart() async {
    return apiClient.delete(
      AppLinks.cartClear,
      authenticated: true,
    );
  }
}
