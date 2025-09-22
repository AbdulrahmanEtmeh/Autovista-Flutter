import 'package:get/get.dart';

import '../../core/class/status_request.dart';

import '../../core/constant/app_routes.dart';
import '../../data/model/car_model.dart';
import '../../data/source/remote/search/filter_data.dart';

class FilterResultController extends GetxController {
  List<CarModel> cars = [];
  StatusRequest statusRequest = StatusRequest.none;
  FilterData filterData = FilterData(Get.find());

  @override
  void onInit() {
    cars = Get.arguments['cars'];
    super.onInit();
  }

  moveToCarDetails(CarModel carModel) {
    Future.microtask(() {
      Get.toNamed(AppRoutes.carDetails, arguments: {
        'carModel': carModel,
      });
    });
  }
}
