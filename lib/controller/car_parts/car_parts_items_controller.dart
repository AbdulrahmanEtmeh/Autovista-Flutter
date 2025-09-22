import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data.dart';
import '../../data/model/car_parts_items_model.dart';
import '../../data/source/remote/carParts/car_parts_data.dart';

abstract class CarPartsItemsController extends GetxController {
  initialData();
  getData();
}

class CarPartsItemsControllerImp extends CarPartsItemsController {
  int? brandId;
  int? categoryId;
  CarPartsData carPartsData = CarPartsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<CarPartsItemsModel> carPartsItems = [];

  @override
  initialData() {
    brandId = Get.arguments['brandId'];
    categoryId = Get.arguments['categoryId'];
    getData();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await carPartsData.getCarPartsItems(brandId!, categoryId!);
    // ignore: avoid_print
    print('====================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        List responseData = response['data'];
        carPartsItems
            .addAll(responseData.map((e) => CarPartsItemsModel.fromJson(e)));
      } else if (response['status'] == false) {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
