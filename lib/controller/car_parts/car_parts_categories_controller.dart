import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/data/model/car_parts_category_model.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data.dart';
import '../../data/source/remote/carParts/car_parts_data.dart';

abstract class CarPartsCategoriesController extends GetxController {
  initialData();
  getData();
  moveToCarPartsItems(int categoryId);
}

class CarPartsCategoriesControllerImp extends CarPartsCategoriesController {
  int? brandId;
  CarPartsData carPartsData = CarPartsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<CarPartsCategoryModel> carPartsCategories = [];
  int selectedIndex = 0;

  @override
  initialData() {
    brandId = Get.arguments['brandId'];
    getData();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  void selectCategory(int id) {
    selectedIndex = id;
    update();
    // ignore: avoid_print
    print('========================>>> CategoryIndex $selectedIndex');
  }

  @override
  moveToCarPartsItems(categoryId) {
    if (categoryId != 0 && categoryId <= carPartsCategories.length) {
      Get.toNamed(AppRoutes.carPartsItems, arguments: {
        'brandId': brandId,
        'categoryId': categoryId,
      });
    }
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await carPartsData.getCarPartsCategories();
    // ignore: avoid_print
    print('====================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        List responseData = response['data'];
        carPartsCategories
            .addAll(responseData.map((e) => CarPartsCategoryModel.fromJson(e)));
      } else if (response['status'] == false) {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
