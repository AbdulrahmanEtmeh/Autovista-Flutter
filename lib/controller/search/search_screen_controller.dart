import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/data/source/remote/search/search_data.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data.dart';
import '../../data/model/car_model.dart';

abstract class SearchScreenController extends GetxController {
  void onFiltrationButtonPressed();
  void search();
  onSerachItems();
}

class SearchScreenControllerImp extends SearchScreenController {
  StatusRequest statusRequest = StatusRequest.none;
  SearchData searchData = SearchData(Get.find());
  TextEditingController? searchFieldController;
  List<CarModel> listCars = [];
  bool isSearch = false;

  @override
  void onInit() {
    searchFieldController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    searchFieldController!.dispose();
    super.dispose();
  }

  @override
  void onFiltrationButtonPressed() {
    Get.toNamed(AppRoutes.filter);
    listCars.clear();
    searchFieldController!.clear();
    update();
  }

  @override
  void search() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchData.serachData(
      searchFieldController!.text,
    );
    // ignore: avoid_print
    print('====================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        listCars.clear();
        List responseBody = response['data']['cars'];
        listCars.addAll(responseBody.map((e) => CarModel.fromJson(e)));
      } else if (response['status'] == false) {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  onSerachItems() {
    // isSearch = true;
    if (searchFieldController!.text.isNotEmpty) {
      search();
    } else {
      listCars.clear();
      update();
    }
  }
}
