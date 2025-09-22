import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/function/handling_data.dart';
import 'package:graduation_project/core/services/my_services.dart';
import 'package:graduation_project/data/model/car_model.dart';
import 'package:graduation_project/data/source/remote/home/home_data.dart';

import '../../core/constant/app_colors.dart';

abstract class HomePageController extends GetxController {
  initialData();
  appBarMoveToFavorite();
  getData();
  moveToCategries(List categories, int selectedCategory, int categoryId);
  moveToBrands(List brands, int selectedBrand, int brandId);
  moveToCarDetails(CarModel carModel);
  ratingStars({required double carRating, required double iconSize});
}

class HomePageControllerImp extends HomePageController {
  late final String userName;
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List cars = [];
  List carCategories = [];
  List carBrands = [];

  @override
  initialData() {
    userName = myServices.sharedPreferences.getString('userName') ?? '';
    // search = TextEditingController();
    getData();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  appBarMoveToFavorite() {
    Get.toNamed(AppRoutes.favorite);
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await homeData.getData(myServices.sharedPreferences.getInt('id')!);
    // ignore: avoid_print
    print('====================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        cars.addAll(response['data']['cars']);
        carCategories.addAll(response['data']['styles']);
        carBrands.addAll(response['data']['brands']);
      } else if (response['status'] == false) {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  List<Widget> ratingStars(
      {required double carRating, required double iconSize}) {
    List<Widget> stars = [];

    for (int i = 0; i < carRating.toInt(); i++) {
      stars.add(Icon(
        Icons.star,
        color: AppColors.ratingStar,
        size: iconSize,
      )); // Full star
    }

    if (carRating - carRating.toInt() >= 0.5) {
      stars.add(Icon(
        Icons.star_half,
        color: AppColors.ratingStar,
        size: iconSize,
      )); // Half star
    }

    int emptyStarsCount = 5 - stars.length;
    for (int i = 0; i < emptyStarsCount; i++) {
      stars.add(Icon(
        Icons.star_outline,
        color: AppColors.selectedBrand,
        size: iconSize,
      ));
    }

    return stars;
  }

  @override
  moveToCategries(categories, selectedCategory, categoryId) {
    Get.toNamed(
      AppRoutes.categories,
      arguments: {
        'categories': categories,
        'selectedCategory': selectedCategory,
        'categoryId': categoryId,
      },
    );
  }

  @override
  moveToBrands(List brands, int selectedBrand, int brandId) {
    Get.toNamed(AppRoutes.brands, arguments: {
      'carBrands': brands,
      'selectedBrand': selectedBrand,
      'brandId': brandId,
    });
  }

  @override
  moveToCarDetails(CarModel carModel) {
    Future.microtask(() {
      Get.toNamed(AppRoutes.carDetails, arguments: {
        'carModel': carModel,
      });
    });
  }
}
