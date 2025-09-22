import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/services/my_services.dart';
import 'package:graduation_project/data/source/remote/favorite/favorite_data.dart';

import '../../core/function/handling_data.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};
  // key => carId
  // Value 0 or 1

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  List data = [];
  late StatusRequest statusRequest;
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();

  addFavorite(int carId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    // update();
    var response = await favoriteData.addFavorite(
      carId,
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

  removeFavorite(int carId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    // update();
    var response = await favoriteData.removeFavorite(
      carId,
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
