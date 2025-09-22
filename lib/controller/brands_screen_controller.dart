import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/data/source/remote/brands/brands_data.dart';

import '../core/constant/app_routes.dart';
import '../core/function/handling_data.dart';
import '../data/model/car_model.dart';

abstract class BrandsScreenController extends GetxController {
  initialData();
  changeBrand(int value, int brandVal);
  getItems(int brandId);
  moveToCarDetails(CarModel carModel);
}

class BrandsScreenControllerImp extends BrandsScreenController {
  List carBrands = [];
  List cars = [];
  int? selectedBrand;
  int? brandId;

  BrandsData brandsData = BrandsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  initialData() {
    carBrands = Get.arguments['carBrands'];
    selectedBrand = Get.arguments['selectedBrand'];
    brandId = Get.arguments['brandId'];
    getItems(brandId!);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  changeBrand(value, brandVal) {
    selectedBrand = value;
    brandId = brandVal;
    getItems(brandId!);
    update();
  }

  @override
  getItems(brandId) async {
    cars.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await brandsData.getCarsBrands(brandId);
    // ignore: avoid_print
    print('====================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        cars.addAll(response['data']['cars']);
      } else if (response['status'] == false) {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
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
