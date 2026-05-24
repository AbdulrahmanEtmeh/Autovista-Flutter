import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/network/api_response.dart';
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
    update();
    var response = await favoriteData.addFavorite(
      carId,
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
              '${responseData['message'] ?? 'Favorite updated'}',
              style: const TextStyle(color: AppColors.primaryWhite),
            ),
          );
        } else if (responseData['status'] == false) {
          statusRequest = StatusRequest.failure;
        }
      },
      failure: (ApiFailure<Map<String, dynamic>> failureResponse) {},
    );
    update();
  }

  removeFavorite(int carId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.removeFavorite(
      carId,
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
              '${responseData['message'] ?? 'Favorite updated'}',
              style: const TextStyle(color: AppColors.primaryWhite),
            ),
          );
        } else if (responseData['status'] == false) {
          statusRequest = StatusRequest.failure;
        }
      },
      failure: (ApiFailure<Map<String, dynamic>> failureResponse) {},
    );
    update();
  }
}
