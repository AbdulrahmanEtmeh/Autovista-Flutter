import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/enums/car_capacity.dart';
import 'package:graduation_project/core/class/enums/car_cylinders.dart';
import 'package:graduation_project/core/class/enums/fuel_type.dart';

import '../../core/class/enums/transmission_type.dart';
import '../../core/services/my_services.dart';
import '../../data/model/car_brands_model.dart';
import '../../data/model/car_categories_model.dart';

abstract class AddCarController extends GetxController {}

class AddCarControllerImp extends AddCarController {
  MyServices myServices = Get.find();
  late TextEditingController namecontroller;
  late TextEditingController priceController;
  late TextEditingController engineHpcontroller;
  CarCapacity? selectedCarCapacity;
  TransmissionType? selectedTransmissionType;
  FuelType? selectedFuelType;
  CarCylinders? selectedCylindre;
  Brands? selectedBrand;
  VehicleStyle? selectedVehicleStyle;

  @override
  void onInit() {
    namecontroller = TextEditingController();
    priceController = TextEditingController();
    engineHpcontroller = TextEditingController();
    selectedCarCapacity = CarCapacity.four;
    selectedTransmissionType = TransmissionType.automatic;
    selectedFuelType = FuelType.regular_unleaded;
    selectedCylindre = CarCylinders.four;
    selectedBrand = Brands.toyota;
    selectedVehicleStyle = VehicleStyle.sedan;

    super.onInit();
  }

  @override
  void dispose() {
    namecontroller;
    priceController;
    engineHpcontroller;
    super.dispose();
  }

  changeBrand(val) {
    selectedBrand = val;
    debugPrint('=================> ${selectedBrand!.name}');
    update();
  }

  changeVehicleStyle(val) {
    selectedVehicleStyle = val;
    debugPrint('=================> ${selectedVehicleStyle!.name}');
    update();
  }

  changeCarCapacity(val) {
    selectedCarCapacity = val;
    debugPrint('=============> ${selectedCarCapacity!.passengers}');
    update();
  }

  changeTransmissionType(val) {
    selectedTransmissionType = val;
    debugPrint('=================> ${selectedTransmissionType!.name}');
    update();
  }

  changeFuelType(val) {
    selectedFuelType = val;
    debugPrint('=============> ${selectedFuelType!.title}');
    update();
  }

  changeCylinders(val) {
    selectedCylindre = val;
    debugPrint('==============> ${selectedCylindre!.name}');
    update();
  }
}
