import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/network/api_response.dart';
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
  String? brandName;
  CarPartsData carPartsData = CarPartsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<CarPartsCategoryModel> carPartsCategories = [];
  int selectedIndex = 0;

  @override
  initialData() {
    int? parseId(dynamic value) {
      if (value == null) return null;
      return int.tryParse(value.toString());
    }

    brandId = parseId(Get.arguments['brandId']);
    brandName = Get.arguments['brandName']?.toString();
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
    final parsedCategoryId = int.tryParse(categoryId.toString());
    final hasCategory =
        carPartsCategories.any((element) => element.id == parsedCategoryId);
    if ((parsedCategoryId ?? 0) != 0 && hasCategory) {
      Get.toNamed(AppRoutes.carPartsItems, arguments: {
        'brandId': brandId,
        'brandName': brandName,
        'categoryId': parsedCategoryId,
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
    statusRequest = handlingApiResponse(response);
    response.when(
      success: (ApiSuccess<Map<String, dynamic>> successResponse) {
        final responseData = successResponse.data;
        if (responseData['status'] == true) {
          carPartsCategories.clear();
          final categoriesList = responseData['data'];
          if (categoriesList is List) {
            carPartsCategories.addAll(
              categoriesList.map((e) => CarPartsCategoryModel.fromJson(e)),
            );
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
