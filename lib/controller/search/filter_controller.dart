// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/data/source/remote/search/filter_data.dart';

import '../../core/class/enums/transmission_type.dart';
import '../../core/class/status_request.dart';
import '../../core/function/handling_data.dart';
import '../../core/services/my_services.dart';
import '../../data/model/car_brands_model.dart';
import '../../data/model/car_categories_model.dart';
import '../../data/model/car_model.dart';

class FilterController extends GetxController {
  MyServices myServices = Get.find();
  FilterData filterData = FilterData(Get.find());
  Brands? selectedBrand;
  TransmissionType? selectedTransmissionType;
  VehicleStyle? selectedVehicleStyle;
  late TextEditingController carName;
  int isRent = 0;
  Color buyColor = AppColors.primaryRed;
  Color rentColor = AppColors.homeContainers;
  int capacity = 2;
  bool cylinderFour = false;
  bool cylinderSix = false;
  bool cylinderEight = false;
  bool cylinderTwelve = false;
  List<String> cylinderGroup = [];
  StatusRequest statusRequest = StatusRequest.none;
  List<CarModel> cars = [];

  @override
  void onInit() {
    selectedBrand = Brands.toyota;
    selectedTransmissionType = TransmissionType.automatic;
    selectedVehicleStyle = VehicleStyle.coupe;
    carName = TextEditingController();
    super.onInit();
  }

// This section is for Buy || Rent
  chooseBuy() {
    isRent = 0;
    buyColor = AppColors.primaryRed;
    rentColor = AppColors.homeContainers;
    debugPrint('=================> $isRent');
    update();
  }

  chooseRent() {
    isRent = 1;
    buyColor = AppColors.homeContainers;
    rentColor = AppColors.primaryRed;
    debugPrint('=================> $isRent');
    update();
  }

// This secton is for the fields
  changeBrand(val) {
    selectedBrand = val;
    debugPrint('=================> ${selectedBrand!.name}');
    update();
  }

  changeTransmissionType(val) {
    selectedTransmissionType = val;
    debugPrint('=================> ${selectedTransmissionType!.name}');
    update();
  }

  changeVehicleStyle(val) {
    selectedVehicleStyle = val;
    debugPrint('=================> ${selectedVehicleStyle!.name}');
    update();
  }

// This section is for the RadioListTile

  capacityChange(int val) {
    capacity = val;
    debugPrint('=================> $capacity');
    update();
  }

// This section is for the CheckBox

  void addCylinderValue(String value) {
    if (!cylinderGroup.contains(value)) {
      cylinderGroup.add(value);
    }
    update();
    print('=====================> $cylinderGroup');
  }

  void removeCylinderValue(String value) {
    cylinderGroup.remove(value);
    update();
    print('=====================> $cylinderGroup');
  }

// Reset Button

  void resetCheckBoxes() {
    cylinderFour = false;
    cylinderSix = false;
    cylinderEight = false;
    cylinderTwelve = false;
    cylinderGroup.clear();
    update();
  }

  void resetFields() {
    selectedBrand = Brands.toyota;
    carName.text = '';
    selectedTransmissionType = TransmissionType.automatic;
    selectedVehicleStyle = VehicleStyle.coupe;
    capacity = 2;
    cylinderFour = false;
    cylinderSix = false;
    cylinderEight = false;
    cylinderTwelve = false;
    cylinderGroup.clear();
    update();
  }

// Search Results

  void filterSearch() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await filterData.getData(
      selectedBrand!.name,
      carName.text,
      selectedTransmissionType!.name,
      selectedVehicleStyle!.name,
      capacity,
      cylinderGroup,
      isRent,
    );
    debugPrint('====================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        cars.clear();
        List responseBody = response['data'];
        cars.addAll(responseBody.map((e) => CarModel.fromJson(e)));
        Get.toNamed(AppRoutes.filterResult, arguments: {
          'cars': cars,
        });
      } else if (response['status'] == false) {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
