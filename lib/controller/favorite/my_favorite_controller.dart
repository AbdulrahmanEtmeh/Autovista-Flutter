import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/network/api_response.dart';
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
    update();
    var response = await favoriteData.getFavoriteList(
      myServices.sharedPreferences.getInt('id')!,
    );
    statusRequest = handlingApiResponse(response);
    response.when(
      success: (ApiSuccess<Map<String, dynamic>> successResponse) {
        final responseData = successResponse.data;
        if (responseData['status'] == true) {
          final rawData = responseData['data'];
          final favoriteCars = rawData is List ? rawData : <dynamic>[];

          data.addAll(
            favoriteCars
                .whereType<Map<String, dynamic>>()
                .map((e) => CarModel.fromJson(e)),
          );
        } else if (responseData['status'] == false) {
          statusRequest = StatusRequest.failure;
        }
      },
      failure: (ApiFailure<Map<String, dynamic>> failureResponse) {},
    );
    update();
  }

  deleteFromFavorite(int carId) async {
    await favoriteData.removeFavorite(carId);
    data.removeWhere((element) => element.id == carId);
    update();
  }

  moveToCarDetails(CarModel carModel) {
    Future.microtask(() {
      Get.toNamed(AppRoutes.carDetails, arguments: {
        'carId': carModel.id,
      });
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
