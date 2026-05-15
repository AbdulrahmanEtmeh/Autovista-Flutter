import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';

import '../core/constant/app_routes.dart';
import '../data/model/car_model.dart';

abstract class CategoriesScreenController extends GetxController {
  initialData();
  changeCategory(int value, int catVal);
  filterCarsByCategory(int categoryId);
  moveToCarDetails(CarModel carModel);
}

class CategoriesScreenControllerImp extends CategoriesScreenController {
  List carCategories = [];
  List allCars = [];
  List cars = [];
  int? selectedCategory;
  int? catId;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  initialData() {
    carCategories = Get.arguments['categories'] ?? [];
    selectedCategory = Get.arguments['selectedCategory'] ?? 0;
    catId = Get.arguments['categoryId'];
    allCars = Get.arguments['cars'] ?? [];

    if (catId != null) {
      filterCarsByCategory(catId!);
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  changeCategory(value, catVal) {
    selectedCategory = value;
    catId = catVal;
    filterCarsByCategory(catVal);
  }

  @override
  filterCarsByCategory(int categoryId) {
    statusRequest = StatusRequest.loading;
    update();

    int? parseId(dynamic value) {
      if (value == null) return null;
      return int.tryParse(value.toString());
    }

    final filteredCars = <dynamic>[];
    if (allCars.isNotEmpty) {
      for (final carData in allCars) {
        if (carData is Map<String, dynamic>) {
          int? carCategoryId;

          final style = carData['style'];
          if (style is Map<String, dynamic>) {
            carCategoryId = parseId(style['id']);
          } else {
            carCategoryId = parseId(
              carData['style_id'] ??
                  carData['styleId'] ??
                  carData['category_id'] ??
                  carData['categoryId'],
            );
          }

          if (carCategoryId == categoryId) {
            filteredCars.add(carData);
          }
        }
      }
    }

    cars = filteredCars;
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  moveToCarDetails(CarModel carModel) {
    Future.microtask(() {
      Get.toNamed(AppRoutes.carDetails, arguments: {
        'carId': carModel.id,
      });
    });
  }
}
