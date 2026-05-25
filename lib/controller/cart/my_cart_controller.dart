// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/network/api_response.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/data/model/car_parts_items_model.dart';

import '../../core/function/handling_data.dart';
import '../../data/source/remote/cart/cart_data.dart';

class MyCartController extends GetxController {
  List<CarPartsItemsModel> data = [];
  late StatusRequest statusRequest;

  CartData cartData = CartData(Get.find());

  int totalItems = 0;
  double price = 0;
  double vat = 0;
  double totalPrice = 0;

  double _toDouble(dynamic value) {
    if (value == null) return 0;
    return double.tryParse(value.toString()) ?? 0;
  }

  void _applyCartPayload(Map<String, dynamic> payload) {
    final payloadParts = payload['parts'];
    final parts = payloadParts is List ? payloadParts : <dynamic>[];

    totalItems = payload['total_items'] is int
        ? payload['total_items'] as int
        : int.tryParse(payload['total_items']?.toString() ?? '0') ?? 0;
    totalPrice = _toDouble(payload['total_price']);
    price = _toDouble(payload['price']);
    vat = _toDouble(payload['vat']);

    if (price == 0) {
      final computedPrice =
          parts.whereType<Map<String, dynamic>>().fold<double>(0, (sum, item) {
        return sum + _toDouble(item['total_part_price']);
      });
      price = computedPrice > 0 ? computedPrice : totalPrice;
    }

    vat = vat > 0 ? vat : 0;

    data
      ..clear()
      ..addAll(
        parts
            .whereType<Map<String, dynamic>>()
            .map((e) => CarPartsItemsModel.fromJson(e)),
      );
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCartItems();
    statusRequest = handlingApiResponse(response);
    response.when(
      success: (ApiSuccess<Map<String, dynamic>> successResponse) {
        final responseData = successResponse.data;
        if (responseData['status'] == true) {
          final payload = responseData['data'];
          if (payload is Map<String, dynamic>) {
            _applyCartPayload(payload);
          }
        } else if (responseData['status'] == false) {
          statusRequest = StatusRequest.failure;
        }
      },
      failure: (ApiFailure<Map<String, dynamic>> failureResponse) {},
    );
    update();
  }

  removeCart(int partId) async {
    statusRequest = StatusRequest.loading;
    update();

    final response = await cartData.removeCart(partId);
    statusRequest = handlingApiResponse(response);

    response.when(
      success: (ApiSuccess<Map<String, dynamic>> successResponse) {
        final responseData = successResponse.data;
        if (responseData['status'] == true) {
          final payload = responseData['data'];
          if (payload is Map<String, dynamic>) {
            _applyCartPayload(payload);
          }
        } else {
          statusRequest = StatusRequest.failure;
        }
      },
      failure: (ApiFailure<Map<String, dynamic>> failureResponse) {},
    );

    update();
  }

  clearCart() async {
    statusRequest = StatusRequest.loading;
    update();

    final response = await cartData.clearCart();
    statusRequest = handlingApiResponse(response);

    response.when(
      success: (ApiSuccess<Map<String, dynamic>> successResponse) {
        final responseData = successResponse.data;
        if (responseData['status'] == true) {
          final payload = responseData['data'];
          if (payload is Map<String, dynamic>) {
            _applyCartPayload(payload);
          } else {
            data.clear();
            totalItems = 0;
            price = 0;
            vat = 0;
            totalPrice = 0;
          }

          Get.rawSnackbar(
            title: 'Notification',
            messageText: Text(
              '${responseData['message'] ?? 'Cart cleared successfully'}',
              style: const TextStyle(color: AppColors.primaryWhite),
            ),
          );
        } else {
          statusRequest = StatusRequest.failure;
        }
      },
      failure: (ApiFailure<Map<String, dynamic>> failureResponse) {},
    );

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  moveToPayment() {
    Get.toNamed(AppRoutes.payment, arguments: {
      'price': price,
      'vat': vat,
      'totalPrice': totalPrice,
    });
  }
}
