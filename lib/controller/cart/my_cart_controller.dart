// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/services/my_services.dart';
import 'package:graduation_project/data/model/car_parts_items_model.dart';

import '../../core/function/handling_data.dart';
import '../../data/source/remote/cart/cart_data.dart';

class MyCartController extends GetxController {
  List<CarPartsItemsModel> data = [];
  late StatusRequest statusRequest;

  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  double price = 0;
  double vat = 0;
  double totalPrice = 0;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCartItems();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        List responseData = response['data']['cart']['parts'];
        data.addAll(responseData.map((e) => CarPartsItemsModel.fromJson(e)));
        price = response['data']['price'];
        vat = response['data']['vat'];
        totalPrice = response['data']['total_price'];
      } else if (response['status'] == false) {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeCart(int partId) async {
    await cartData.removeCart(partId);
    getData();
    if (data.isEmpty) {
      price = 0;
      vat = 0;
      totalPrice = 0;
      update();
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  moveToPayment() {
    Get.toNamed(AppRoutes.payment, arguments: {
      'price': price,
      'vat': vat,
      'totalPrice': totalPrice,
    });
  }
}
