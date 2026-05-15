import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';

import '../core/constant/app_routes.dart';
import '../data/model/car_model.dart';

abstract class BrandsScreenController extends GetxController {
  initialData();
  changeBrand(int value, int brandVal);
  filterCarsByBrand(int brandId);
  moveToCarDetails(CarModel carModel);
}

class BrandsScreenControllerImp extends BrandsScreenController {
  List carBrands = [];
  List allCars = [];
  List cars = [];
  int? selectedBrand;
  int? brandId;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  initialData() {
    carBrands = Get.arguments['carBrands'] ?? [];
    selectedBrand = Get.arguments['selectedBrand'] ?? 0;
    brandId = Get.arguments['brandId'];
    allCars = Get.arguments['cars'] ?? [];

    if (brandId != null) {
      filterCarsByBrand(brandId!);
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  changeBrand(value, brandVal) {
    print('DEBUG: changeBrand called with value=$value, brandVal=$brandVal');
    selectedBrand = value;
    brandId = brandVal;
    filterCarsByBrand(brandVal);
    update();
  }

  @override
  filterCarsByBrand(int brandId) {
    print('DEBUG: filterCarsByBrand called with brandId=$brandId');
    print('DEBUG: allCars count=${allCars.length}');
    statusRequest = StatusRequest.loading;
    update();

    List<dynamic> filteredCars = [];
    if (allCars.isNotEmpty) {
      for (final carData in allCars) {
        if (carData is Map<String, dynamic>) {
          int? carBrandId;

          final brand = carData['brand'];
          if (brand is Map<String, dynamic>) {
            carBrandId = int.tryParse(brand['id'].toString());
          } else {
            carBrandId = int.tryParse(
                (carData['brand_id'] ?? carData['brandId']).toString());
          }

          if (carBrandId == brandId) {
            filteredCars.add(carData);
          }
        }
      }
    }

    cars = filteredCars;
    print('DEBUG: Filtered cars count=${cars.length} for brandId=$brandId');
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
