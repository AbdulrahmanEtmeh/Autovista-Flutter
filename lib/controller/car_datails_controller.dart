import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/function/handling_data.dart';
import 'package:graduation_project/core/network/api_response.dart';
import 'package:graduation_project/data/model/car_model.dart';
import 'package:graduation_project/data/source/remote/carDetails/car_details_data.dart';

import '../core/constant/app_colors.dart';

abstract class CarDatailsController extends GetxController {
  initialData();
  moveToPrevScreen();
  ratingStars(double carRating);
}

class CarDatailsControllerImp extends CarDatailsController {
  PageController pageController = PageController();
  CarModel carModel = CarModel();
  int? carId;
  StatusRequest statusRequest = StatusRequest.none;
  final CarDetailsData carDetailsData = CarDetailsData(Get.find());

  List<String> carDetailsListUnit = [
    'KPH',
    'HP',
    'CID',
  ];
  List<String> carDetailsListValue = [
    '290',
    '550',
    '6',
  ];
  List<String> carDetailsListTitle = [
    'Top Speed',
    'HoresePower',
    'Cylinders',
  ];

  @override
  List<Widget> ratingStars(double carRating) {
    List<Widget> stars = [];

    for (int i = 0; i < carRating.toInt(); i++) {
      stars.add(
          const Icon(Icons.star, color: AppColors.ratingStar)); // Full star
    }

    if (carRating - carRating.toInt() >= 0.5) {
      stars.add(const Icon(Icons.star_half,
          color: AppColors.ratingStar)); // Half star
    }

    int emptyStarsCount = 5 - stars.length;
    for (int i = 0; i < emptyStarsCount; i++) {
      stars.add(const Icon(
        Icons.star_outline,
        color: AppColors.homeContainers,
      ));
    }

    return stars;
  }

  @override
  initialData() {
    final args = Get.arguments;

    if (args is Map) {
      final rawCarId = args['carId'];
      if (rawCarId != null) {
        carId = int.tryParse(rawCarId.toString());
      }

      final rawCarModel = args['carModel'];
      if (rawCarModel is CarModel) {
        carModel = rawCarModel;
        carId ??= rawCarModel.id;
      }
    }

    if (carId == null) {
      statusRequest = StatusRequest.failure;
    }
  }

  Future<void> getCarDetails() async {
    if (carId == null) {
      statusRequest = StatusRequest.failure;
      update();
      return;
    }

    statusRequest = StatusRequest.loading;
    update();

    final response = await carDetailsData.getCarDetails(carId!);
    statusRequest = handlingApiResponse(response);

    response.when(
      success: (ApiSuccess<Map<String, dynamic>> successResponse) {
        final responseData = successResponse.data;
        if (responseData['status'] == true && responseData['data'] is Map) {
          final details =
              Map<String, dynamic>.from(responseData['data'] as Map);

          if (details.containsKey('is_fav') &&
              !details.containsKey('is_favorite')) {
            details['is_favorite'] = details['is_fav'] == true ? 1 : 0;
          }

          carModel = CarModel.fromJson(details);
          statusRequest = StatusRequest.success;
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
    initialData();
    getCarDetails();
    super.onInit();
  }

  @override
  moveToPrevScreen() {
    Get.back();
  }
}
