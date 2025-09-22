import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/data/model/car_brands_model.dart';
import 'package:graduation_project/data/source/remote/carParts/car_parts_data.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data.dart';

abstract class CarPartsBrandsController extends GetxController {
  initialData();
  moveToCarPartsCategories(int brandId);
  getData();
}

class CarPartsBrandsControllerImp extends CarPartsBrandsController {
  CarPartsData carPartsData = CarPartsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<CarBrandsModel> carBrands = [];
  int selectedIndex = 0;

  @override
  initialData() {
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
    print('========================>>> BrandIndex $selectedIndex');
  }

  @override
  moveToCarPartsCategories(brandId) {
    if (brandId != 0 && brandId <= carBrands.length) {
      Get.toNamed(AppRoutes.carPartsCategories,
          arguments: {'brandId': brandId});
    }
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await carPartsData.getBrands();
    // ignore: avoid_print
    print('====================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        List responseData = response['data'];
        carBrands.addAll(responseData.map((e) => CarBrandsModel.fromJson(e)));
      } else if (response['status'] == false) {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
