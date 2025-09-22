import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/enums/driven_wheels.dart';
import 'package:graduation_project/core/class/enums/fuel_type.dart';
import 'package:graduation_project/core/class/enums/market_category.dart';
import 'package:graduation_project/core/class/enums/number_of_doors.dart';
import 'package:graduation_project/core/class/enums/vehicle_size.dart';

import '../../core/class/enums/transmission_type.dart';
import '../../core/class/status_request.dart';
import '../../data/model/car_brands_model.dart';
import '../../data/model/car_categories_model.dart';

class PricePredictionController extends GetxController {
  Brands? selectedBrand;
  FuelType? selectedFuelType;
  TransmissionType? selectedTransmissionType;
  DrivenWheels? selectedDrivenWheels;
  NumberOfDoors? selectedDoors;
  MarketCategory? selectedMarketCategory;
  VehicleSize? selectedVehicleSize;
  VehicleStyle? selectedVehicleStyle;
  late TextEditingController carName;
  late TextEditingController makeYear;
  late TextEditingController engineHp;
  late TextEditingController engineCylinder;
  late TextEditingController highwayMpg;
  late TextEditingController cityMpg;
  late TextEditingController popularity;
  double predictedPrice = 0;

  StatusRequest statusRequest = StatusRequest.none;
  // PricePredictionData predictionData = PricePredictionData(Get.find());

  changeBrand(val) {
    selectedBrand = val;
    update();
  }

  changeFuelType(val) {
    selectedFuelType = val;
    update();
  }

  changeTransmissionType(val) {
    selectedTransmissionType = val;
    update();
  }

  changeDrivenWheels(val) {
    selectedDrivenWheels = val;
    update();
  }

  changeNumberOfDoors(val) {
    selectedDoors = val;
    update();
  }

  changeMarketCategoty(val) {
    selectedMarketCategory = val;
    update();
  }

  changeVehicleSize(val) {
    selectedVehicleSize = val;
    update();
  }

  changeVehicleStyle(val) {
    selectedVehicleStyle = val;
    update();
  }

  @override
  void onInit() {
    selectedBrand = Brands.toyota;
    selectedFuelType = FuelType.regular_unleaded;
    selectedTransmissionType = TransmissionType.automatic;
    selectedDrivenWheels = DrivenWheels.rear_wheel_drive;
    selectedDoors = NumberOfDoors.four;
    selectedMarketCategory = MarketCategory.luxury;
    selectedVehicleSize = VehicleSize.large;
    selectedVehicleStyle = VehicleStyle.coupe;
    carName = TextEditingController();
    makeYear = TextEditingController();
    engineHp = TextEditingController();
    engineCylinder = TextEditingController();
    highwayMpg = TextEditingController();
    cityMpg = TextEditingController();
    popularity = TextEditingController();

    super.onInit();
  }

  predictPrice() {
    predictedPrice = 4047.23;
    update();
  }

  // getData() async {
  //   // statusRequest = StatusRequest.loading;
  //   // update();
  //   var response = await predictionData.postData(
  //       selectedBrand!.title,
  //       carName.text,
  //       makeYear.text,
  //       selectedFuelType!.title,
  //       engineHp.text,
  //       engineCylinder.text,
  //       selectedTransmissionType!.title,
  //       selectedDrivenWheels!.title,
  //       selectedDoors!.doors,
  //       selectedMarketCategory!.title,
  //       selectedVehicleSize!.title,
  //       selectedVehicleStyle!.title,
  //       highwayMpg.text,
  //       cityMpg.text,
  //       popularity.text);
  //   // ignore: avoid_print
  //   print('====================== Controller $response');
  //   statusRequest = handlingData(response);
  //   predictedPrice = response['prediction'][0];
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == true) {
  //       predictedPrice = response['prediction'][0];
  //     } else if (response['status'] == false) {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  // getData() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await predictionData.postData(
  //     selectedBrand!.title,
  //     carName.text,
  //     makeYear.text,
  //     selectedFuelType!.title,
  //     engineHp.text,
  //     engineCylinder.text,
  //     selectedTransmissionType!.title,
  //     selectedDrivenWheels!.title,
  //     selectedDoors!.doors,
  //     selectedMarketCategory!.title,
  //     selectedVehicleSize!.title,
  //     selectedVehicleStyle!.title,
  //     highwayMpg.text,
  //     cityMpg.text,
  //     popularity.text,
  //   );
  //   // ignore: avoid_print
  //   print('====================== Controller $response');
  //   if (response is Right) {
  //     Map<String, dynamic> data = response.value;
  //     predictedPrice = data["prediction"][0];
  //     statusRequest = StatusRequest.success;
  //   } else {
  //     statusRequest = StatusRequest.failure;
  //   }
  //   update();
  // }
}
