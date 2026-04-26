import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/network/api_response.dart';
import 'package:graduation_project/core/services/my_services.dart';
import 'package:graduation_project/data/source/remote/categories/categories_data.dart';

import '../core/constant/app_routes.dart';
import '../core/function/handling_data.dart';
import '../data/model/car_model.dart';

abstract class CategoriesScreenController extends GetxController {
  initialData();
  changeCategory(int value, int catVal);
  getItems(int catId);
  moveToCarDetails(CarModel carModel);
}

class CategoriesScreenControllerImp extends CategoriesScreenController {
  List carCategories = [];
  List cars = [];
  int? selectedCategory;
  int? catId;

  MyServices myServices = Get.find();
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  initialData() {
    carCategories = Get.arguments['categories'];
    selectedCategory = Get.arguments['selectedCategory'];
    catId = Get.arguments['categoryId'];
    getItems(catId!);
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
    getItems(catId!);
    update();
  }

  @override
  getItems(catId) async {
    cars.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.getCarsCategories(catId);
    // ignore: avoid_print
    print('====================== Controller $response');
    statusRequest = handlingApiResponse(response);
    response.when(
      success: (ApiSuccess<Map<String, dynamic>> successResponse) {
        final responseData = successResponse.data;
        if (responseData['status'] == true) {
          cars.addAll(responseData['data']['cars']);
        } else if (responseData['status'] == false) {
          statusRequest = StatusRequest.failure;
        }
      },
      failure: (ApiFailure<Map<String, dynamic>> failureResponse) {},
    );
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
