import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_colors.dart';
import '../../core/function/handling_data.dart';
import '../../core/services/my_services.dart';
import '../../data/source/remote/cart/cart_data.dart';

class CartController extends GetxController {
  List data = [];
  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  addCart(int partId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    // update();
    var response = await cartData.addCart(
      partId,
    );
    // ignore: avoid_print
    print('====================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        Get.rawSnackbar(
          title: 'Notification',
          messageText: Text(
            '${response['message']}',
            style: const TextStyle(color: AppColors.primaryWhite),
          ),
        );
        // data.addAll(response['data']['cars']);
      } else if (response['status'] == false) {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
