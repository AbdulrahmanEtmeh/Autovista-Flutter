import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/screen/settings/my_cars_screen.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'package:graduation_project/controller/settings/my_cars_controller.dart';
import 'package:graduation_project/controller/home/home_page_controller.dart';
import 'package:graduation_project/data/source/remote/updateCar/update_car_data.dart';
import 'package:graduation_project/data/model/car_brands_model.dart';
import 'package:graduation_project/data/model/car_categories_model.dart';
import 'package:graduation_project/data/model/car_model.dart';
import 'package:graduation_project/core/class/enums/car_capacity.dart';
import 'package:graduation_project/core/class/enums/car_cylinders.dart';
import 'package:graduation_project/core/class/enums/fuel_type.dart';
import 'package:graduation_project/core/class/enums/transmission_type.dart';



abstract class UpdateCarController extends GetxController {}


class UpdateCarControllerImp extends UpdateCarController {
  
  late CarModel car;

  
  final ImagePicker _picker = ImagePicker();
  late UpdateCarData updateCarData;

  // Text Controllers
  late TextEditingController nameEnController;
  late TextEditingController nameArController;
  late TextEditingController priceController;
  late TextEditingController colorEnController;
  late TextEditingController colorArController;
  late TextEditingController marketCategoryEnController;
  late TextEditingController marketCategoryArController;
  late TextEditingController yearController;
  late TextEditingController topSpeedController;
  late TextEditingController engineHpController;
  late TextEditingController highwayMpgController;
  late TextEditingController cityMpgController;

  // Dropdown Lists 
  List<CarBrandsModel> brands = [];
  List<CarCategoriesModel> styles = [];

  //  Selected Dropdown Values 
  CarBrandsModel? selectedBrand;
  CarCategoriesModel? selectedStyle;
  CarCapacity? selectedCarCapacity;
  TransmissionType? selectedTransmissionType;
  FuelType? selectedFuelType;
  CarCylinders? selectedCylinder;

  //  State 
  bool isLoading = false;
  bool isRent = false;
  List<XFile> newImages = [];

  //  Step & Validation State 
  int currentStep = 0;
  Map<String, String?> errors = {};

  // Lifecycle 

  @override
  void onInit() {
    super.onInit();
    car = Get.arguments['car'] as CarModel;
    updateCarData = UpdateCarData();
    _initControllers();
    _prefillFromCar();
    _loadBrandsAndStyles();
  }

  @override
  void onClose() {
    nameEnController.dispose();
    nameArController.dispose();
    priceController.dispose();
    colorEnController.dispose();
    colorArController.dispose();
    marketCategoryEnController.dispose();
    marketCategoryArController.dispose();
    yearController.dispose();
    topSpeedController.dispose();
    engineHpController.dispose();
    highwayMpgController.dispose();
    cityMpgController.dispose();
    super.onClose();
  }

  //  Init Helpers

  void _initControllers() {
    nameEnController = TextEditingController();
    nameArController = TextEditingController();
    priceController = TextEditingController();
    colorEnController = TextEditingController();
    colorArController = TextEditingController();
    marketCategoryEnController = TextEditingController();
    marketCategoryArController = TextEditingController();
    yearController = TextEditingController();
    topSpeedController = TextEditingController();
    engineHpController = TextEditingController();
    highwayMpgController = TextEditingController();
    cityMpgController = TextEditingController();
  }

  void _prefillFromCar() {
    nameEnController.text = car.name ?? '';
    nameArController.text = car.name ?? '';
    priceController.text = car.price?.toStringAsFixed(0) ?? '';
    colorEnController.text = car.color ?? '';
    colorArController.text = car.color ?? '';
    marketCategoryEnController.text = car.marketCategory ?? '';
    marketCategoryArController.text = car.marketCategory ?? '';
    yearController.text = car.year ?? '';
    topSpeedController.text = car.topSpeed?.toString() ?? '';
    engineHpController.text = car.engineHp?.toString() ?? '';
    highwayMpgController.text = car.highwayMpg?.toString() ?? '';
    cityMpgController.text = car.cityMpg?.toString() ?? '';
    isRent = car.isRent ?? false;

    selectedTransmissionType = TransmissionType.values.firstWhereOrNull(
          (t) => t.title.toLowerCase() == (car.gearType?.toLowerCase() ?? ''),
        ) ?? TransmissionType.automatic;

    selectedFuelType = FuelType.values.firstWhereOrNull(
          (f) => f.title.toLowerCase() == (car.fuelType?.toLowerCase() ?? ''),
        ) ?? FuelType.regular_unleaded;

    selectedCarCapacity = CarCapacity.values.firstWhereOrNull(
          (c) => c.passengers == car.capacity,
        ) ?? CarCapacity.four;

    selectedCylinder = CarCylinders.values.firstWhereOrNull(
          (c) => c.cylinder == car.cylinders,
        ) ?? CarCylinders.four;
  }

  Future<void> _loadBrandsAndStyles() async {
    final homeController = Get.find<HomePageControllerImp>();

    brands = homeController.carBrands
        .map((item) => CarBrandsModel.fromJson(item))
        .toList();

    styles = homeController.carCategories
        .map((item) => CarCategoriesModel.fromJson(item))
        .toList();

    selectedBrand = brands.firstWhereOrNull((b) => b.id == car.brandId)
        ?? (brands.isNotEmpty ? brands.first : null);

    selectedStyle = styles.firstWhereOrNull((s) => s.id == car.styleId)
        ?? (styles.isNotEmpty ? styles.first : null);

    update();
  }

  //  Navigation 

  void goNext() {
    bool valid = false;
    if (currentStep == 0) {
      valid = validateStep1();
    } else if (currentStep == 1) {
      valid = validateStep2();
    } else if (currentStep == 2) {
      if (validateStep3()) submitUpdate();
      return;
    }
    if (valid) {
      currentStep++;
      update();
    }
  }

  void goBack() {
    errors.clear();
    currentStep--;
    update();
  }

  //  Validation 
  bool validateStep1() {
    errors.clear();
    if (nameEnController.text.trim().isEmpty)   errors['nameEn'] = 'Please enter the name in English *';
    if (nameArController.text.trim().isEmpty)   errors['nameAr'] = 'Please enter the name in Arabic *';
    if (priceController.text.trim().isEmpty)    errors['price']  = 'Please enter the price *';
    if (selectedBrand == null)                  errors['brand']  = 'Please select a brand *';
    if (selectedStyle == null)                  errors['style']  = 'Please select a style *';
    if (yearController.text.trim().isEmpty)     errors['year']   = 'Please enter the manufacturing year *';
    update();
    return errors.isEmpty;
  }

  bool validateStep2() {
    errors.clear();
    if (selectedCarCapacity == null)                errors['capacity']     = 'Please select car capacity *';
    if (selectedTransmissionType == null)           errors['transmission'] = 'Please select transmission type *';
    if (selectedFuelType == null)                   errors['fuel']         = 'Please select fuel type *';
    if (topSpeedController.text.trim().isEmpty)     errors['topSpeed']     = 'Please enter top speed *';
    if (engineHpController.text.trim().isEmpty)     errors['engineHp']     = 'Please enter engine horse power *';
    if (selectedCylinder == null)                   errors['cylinder']     = 'Please select cylinders count *';
    update();
    return errors.isEmpty;
  }

  bool validateStep3() {
    errors.clear();
    if (highwayMpgController.text.trim().isEmpty)       errors['highwayMpg'] = 'Please enter highway MPG *';
    if (cityMpgController.text.trim().isEmpty)          errors['cityMpg']    = 'Please enter city MPG *';
    if (colorEnController.text.trim().isEmpty)          errors['colorEn']    = 'Please enter color in English *';
    if (colorArController.text.trim().isEmpty)          errors['colorAr']    = 'Please enter color in Arabic *';
    if (marketCategoryEnController.text.trim().isEmpty) errors['marketEn']   = 'Please enter market category in English *';
    if (marketCategoryArController.text.trim().isEmpty) errors['marketAr']   = 'Please enter market category in Arabic *';
    final hasOldImages = car.photos != null && car.photos!.isNotEmpty;
    if (!hasOldImages && newImages.isEmpty)             errors['images']     = 'The car must have at least one image *';
    update();
    return errors.isEmpty;
  }

  //  Dropdown Changers 
  void changeBrand(CarBrandsModel value) { selectedBrand = value; update(); }
  void changeStyle(CarCategoriesModel value) { selectedStyle = value; update(); }
  void changeCarCapacity(CarCapacity value) { selectedCarCapacity = value; update(); }
  void changeTransmissionType(TransmissionType value) { selectedTransmissionType = value; update(); }
  void changeFuelType(FuelType value) { selectedFuelType = value; update(); }
  void changeCylinder(CarCylinders value) { selectedCylinder = value; update(); }
  void changeRentStatus(bool value) { isRent = value; update(); }

  //  Image Management 

  Future<void> pickImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      newImages.addAll(images);
      update();
    }
  }

  void removeExistingImage(int index) {
    car.photos!.removeAt(index);
    update();
  }

  void removeNewImage(int index) {
    newImages.removeAt(index);
    update();
  }

  //  Submit Update 

  Future<void> submitUpdate() async {
    if (nameEnController.text.trim().isEmpty ||
        priceController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all required fields',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return;
    }

    isLoading = true;
    update();

    try {
      final request = updateCarData.createRequest(car.id!);

      request.fields.addAll({
        '_method': 'PUT',
        'name_en': nameEnController.text.trim(),
        'name_ar': nameArController.text.trim(),
        'color_en': colorEnController.text.trim(),
        'color_ar': colorArController.text.trim(),
        'market_category_en': marketCategoryEnController.text.trim(),
        'market_category_ar': marketCategoryArController.text.trim(),
        'fuel_type_en': selectedFuelType!.title,
        'fuel_type_ar': selectedFuelType!.titleAr,
        'price': priceController.text.trim(),
        'brand_id': selectedBrand!.id.toString(),
        'style_id': selectedStyle!.id.toString(),
        'gear_type': selectedTransmissionType!.title,
        'cylinders': selectedCylinder!.cylinder.toString(),
        'capacity': selectedCarCapacity!.passengers.toString(),
        'is_rent': isRent ? '1' : '0',
        'year': yearController.text.trim(),
        'top_speed': topSpeedController.text.trim(),
        'engine_hp': engineHpController.text.trim(),
        'highway_mpg': highwayMpgController.text.trim(),
        'city_mpg': cityMpgController.text.trim(),
      });

      for (final xFile in newImages) {
        request.files.add(
          await http.MultipartFile.fromPath('images[]', xFile.path),
        );
      }

      final response = await updateCarData.updateCar(request);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();

        if (Get.context != null) {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(
              content: Text(
                'Car updated successfully!',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 3),
            ),
          );
        }

        _refreshDataInBackground();

      } else {
        final responseBody = await response.stream.bytesToString();
        final result = jsonDecode(responseBody);
        Get.snackbar(
          'Error',
          result['message']?.toString() ?? 'Something went wrong',
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred: $e',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading = false;
      update();
    }
  }

  //  Background Refresher 
  void _refreshDataInBackground() async {
    try {
      Get.find<HomePageControllerImp>().getData();
    } catch (_) {}

    try {
      final myCarsCtrl = Get.find<MyCarsController>();
      await myCarsCtrl.getMyCars();
      myCarsCtrl.update();
    } catch (_) {}
  }
}