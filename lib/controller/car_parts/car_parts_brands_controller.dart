import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/data/model/car_brands_model.dart';
import 'package:graduation_project/data/source/remote/carParts/car_parts_data.dart';
import 'package:graduation_project/controller/home/home_page_controller.dart';
import 'package:graduation_project/core/network/api_response.dart';

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

  bool _loadBrandsFromHomeCache() {
    if (!Get.isRegistered<HomePageControllerImp>()) {
      return false;
    }

    final homeController = Get.find<HomePageControllerImp>();
    if (homeController.carBrands.isEmpty) {
      return false;
    }

    carBrands.clear();
    for (final brand in homeController.carBrands) {
      if (brand is Map<String, dynamic>) {
        carBrands.add(CarBrandsModel.fromJson(brand));
      }
    }

    if (carBrands.isNotEmpty && selectedIndex == 0) {
      selectedIndex = carBrands.first.id ?? 0;
    }

    statusRequest = StatusRequest.success;
    return carBrands.isNotEmpty;
  }

  @override
  initialData() {
    if (!_loadBrandsFromHomeCache()) {
      getData();
    } else {
      update();
    }
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
    final hasBrand = carBrands.any((element) => element.id == brandId);
    if (brandId != 0 && hasBrand) {
      final selectedBrand = carBrands.firstWhere(
        (element) => element.id == brandId,
      );
      Get.toNamed(AppRoutes.carPartsCategories,
          arguments: {'brandId': brandId, 'brandName': selectedBrand.name});
    }
  }

  @override
  getData() async {
    if (_loadBrandsFromHomeCache()) {
      update();
      return;
    }

    statusRequest = StatusRequest.loading;
    update();
    var response = await carPartsData.getBrands();
    // ignore: avoid_print
    print('====================== Controller $response');
    statusRequest = handlingApiResponse(response);
    response.when(
      success: (ApiSuccess<Map<String, dynamic>> successResponse) {
        final responseData = successResponse.data;
        if (responseData['status'] == true) {
          carBrands.clear();
          final brandsList = responseData['data'];
          if (brandsList is List) {
            carBrands.addAll(brandsList.map((e) => CarBrandsModel.fromJson(e)));
          }
          if (carBrands.isNotEmpty && selectedIndex == 0) {
            selectedIndex = carBrands.first.id ?? 0;
          }
        } else if (responseData['status'] == false) {
          statusRequest = StatusRequest.failure;
        }
      },
      failure: (ApiFailure<Map<String, dynamic>> failureResponse) {},
    );
    update();
  }
}
