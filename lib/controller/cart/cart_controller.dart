import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/network/api_response.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_colors.dart';
import '../../core/function/handling_data.dart';
import '../../data/source/remote/cart/cart_data.dart';
import 'my_cart_controller.dart';

class CartController extends GetxController {
  List data = [];
  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());

  int _parseInt(dynamic value) {
    if (value == null) return 0;
    return int.tryParse(value.toString()) ?? 0;
  }

  int _extractCurrentQuantity(Map<String, dynamic> payload, int partId) {
    final partsRaw = payload['parts'];
    if (partsRaw is! List) {
      return 0;
    }

    for (final item in partsRaw) {
      if (item is Map<String, dynamic>) {
        final id = _parseInt(item['id']);
        if (id == partId) {
          return _parseInt(item['quantity']);
        }
      }
    }

    return 0;
  }

  Future<int> _resolveNextQuantity(int partId) async {
    // Prefer in-memory cart state if cart screen controller is active.
    if (Get.isRegistered<MyCartController>()) {
      final myCartController = Get.find<MyCartController>();
      for (final item in myCartController.data) {
        if (item.id == partId) {
          return (item.quantity ?? 0) + 1;
        }
      }
      return 1;
    }

    // Otherwise fetch cart once to discover current quantity.
    final cartResponse = await cartData.getCartItems();
    var currentQuantity = 0;
    cartResponse.when(
      success: (successResponse) {
        final responseData = successResponse.data;
        final payload = responseData['data'];
        if (responseData['status'] == true && payload is Map<String, dynamic>) {
          currentQuantity = _extractCurrentQuantity(payload, partId);
        }
      },
      failure: (failureResponse) {},
    );

    return currentQuantity + 1;
  }

  addCart(int partId, {int quantity = 1}) async {
    final nextQuantity = await _resolveNextQuantity(partId);

    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
      partId,
      quantity: quantity > 0 ? nextQuantity : 1,
    );
    // ignore: avoid_print
    print('====================== Controller $response');
    statusRequest = handlingApiResponse(response);
    response.when(
      success: (ApiSuccess<Map<String, dynamic>> successResponse) {
        final responseData = successResponse.data;
        if (responseData['status'] == true) {
          Get.rawSnackbar(
            title: 'Notification',
            messageText: Text(
              '${responseData['message'] ?? 'Cart updated'}',
              style: const TextStyle(color: AppColors.primaryWhite),
            ),
          );

          if (Get.isRegistered<MyCartController>()) {
            Get.find<MyCartController>().getData();
          }
        } else if (responseData['status'] == false) {
          statusRequest = StatusRequest.failure;
        }
      },
      failure: (ApiFailure<Map<String, dynamic>> failureResponse) {},
    );
    update();
  }
}
