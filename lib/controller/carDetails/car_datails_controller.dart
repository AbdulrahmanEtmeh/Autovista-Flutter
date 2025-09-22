import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/data/model/car_model.dart';

import '../../core/constant/app_colors.dart';

abstract class CarDatailsController extends GetxController {
  initialData();
  moveToPrevScreen();
  ratingStars(double carRating);
}

class CarDatailsControllerImp extends CarDatailsController {
  PageController pageController = PageController();
  CarModel carModel = CarModel();

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
    carModel = Get.arguments['carModel'];
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  moveToPrevScreen() {
    Get.back();
  }
}
