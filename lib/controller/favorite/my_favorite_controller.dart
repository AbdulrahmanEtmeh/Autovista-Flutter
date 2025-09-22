import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/services/my_services.dart';
import 'package:graduation_project/data/model/car_model.dart';

import '../../core/constant/app_routes.dart';
import '../../core/function/handling_data.dart';
import '../../data/source/remote/favorite/favorite_data.dart';

class MyFavoriteController extends GetxController {
  List<CarModel> data = [];
  late StatusRequest statusRequest;
  // MyFavoriteData favoriteViewData = MyFavoriteData(Get.find());
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    // update();
    var response = await favoriteData.getFavoriteList(
      myServices.sharedPreferences.getInt('id')!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        List responseData = response['data'][0];
        data.addAll(responseData.map((e) => CarModel.fromJson(e)));
      } else if (response['status'] == false) {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(int carId) {
    // ignore: unused_local_variable
    var response = favoriteData.removeFavorite(carId);
    data.removeWhere((element) => element.id == carId);
    update();
  }

  moveToCarDetails(CarModel carModel) {
    Future.microtask(() {
      Get.toNamed(AppRoutes.carDetails, arguments: {
        'carModel': carModel,
      });
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
