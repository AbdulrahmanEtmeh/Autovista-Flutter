import 'dart:convert';
import 'package:graduation_project/controller/settings/my_cars_controller.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:graduation_project/core/class/enums/car_capacity.dart';
import 'package:graduation_project/core/class/enums/car_cylinders.dart';
import 'package:graduation_project/core/class/enums/fuel_type.dart';
import 'package:graduation_project/core/class/enums/transmission_type.dart';
import 'package:graduation_project/controller/home/home_page_controller.dart';
import 'package:graduation_project/data/model/car_brands_model.dart';
import 'package:graduation_project/data/model/car_categories_model.dart';
import 'package:graduation_project/data/source/remote/addCar/add_car_data.dart';

abstract class AddCarController extends GetxController {}

class AddCarControllerImp extends AddCarController {

  final ImagePicker _picker = ImagePicker();
  late AddCarData addCarData;

  //  Text Controllers
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

  // State 
  bool isLoading = false;
  bool isRent = false;
  List<XFile> selectedImages = [];

  //  Step & Validation State (replaces setState in the view) 
  int currentStep = 0;
  Map<String, String?> errors = {};

  //  Lifecycle 

  @override
  void onInit() {
    super.onInit();

    nameEnController             = TextEditingController();
    nameArController             = TextEditingController();
    priceController              = TextEditingController();
    colorEnController            = TextEditingController();
    colorArController            = TextEditingController();
    marketCategoryEnController   = TextEditingController();
    marketCategoryArController   = TextEditingController();
    yearController               = TextEditingController();
    topSpeedController           = TextEditingController();
    engineHpController           = TextEditingController();
    highwayMpgController         = TextEditingController();
    cityMpgController            = TextEditingController();

    selectedCarCapacity      = CarCapacity.four;
    selectedTransmissionType = TransmissionType.automatic;
    selectedFuelType         = FuelType.regular_unleaded;
    selectedCylinder         = CarCylinders.four;

    addCarData = AddCarData();

    getBrands();
    getStyles();
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

  //  Data Loaders 

  Future<void> getBrands() async {
    try {
      final homeController = Get.find<HomePageControllerImp>();
      brands = homeController.carBrands
          .map((item) => CarBrandsModel.fromJson(item))
          .toList();
      if (brands.isNotEmpty) selectedBrand = brands.first;
      update();
    } catch (_) {}
  }

  Future<void> getStyles() async {
    try {
      final homeController = Get.find<HomePageControllerImp>();
      styles = homeController.carCategories
          .map((item) => CarCategoriesModel.fromJson(item))
          .toList();
      if (styles.isNotEmpty) selectedStyle = styles.first;
      update();
    } catch (_) {}
  }

  //  Navigation 

  void goNext() {
    bool valid = false;
    if (currentStep == 0) {
      valid = validateStep1();
    } else if (currentStep == 1) {
      valid = validateStep2();
    } else if (currentStep == 2) {
      if (validateStep3()) submitCar();
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
    if (nameEnController.text.trim().isEmpty)  errors['nameEn'] = 'Please enter the name in English *';
    if (nameArController.text.trim().isEmpty)  errors['nameAr'] = 'Please enter the name in Arabic *';
    if (priceController.text.trim().isEmpty)   errors['price']  = 'Please enter the price *';
    if (selectedBrand == null)                 errors['brand']  = 'Please select a brand *';
    if (selectedStyle == null)                 errors['style']  = 'Please select a style *';
    if (yearController.text.trim().isEmpty)    errors['year']   = 'Please enter the manufacturing year *';
    update();
    return errors.isEmpty;
  }

  bool validateStep2() {
    errors.clear();
    if (selectedCarCapacity == null)               errors['capacity']     = 'Please select car capacity *';
    if (selectedTransmissionType == null)          errors['transmission'] = 'Please select transmission type *';
    if (selectedFuelType == null)                  errors['fuel']         = 'Please select fuel type *';
    if (topSpeedController.text.trim().isEmpty)    errors['topSpeed']     = 'Please enter top speed *';
    if (engineHpController.text.trim().isEmpty)    errors['engineHp']     = 'Please enter engine horse power *';
    if (selectedCylinder == null)                  errors['cylinder']     = 'Please select cylinders count *';
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
    if (selectedImages.isEmpty)                         errors['images']     = 'Please upload at least one car image *';
    update();
    return errors.isEmpty;
  }

  //  Dropdown Changers 

  void changeBrand(CarBrandsModel value)           { selectedBrand = value; update(); }
  void changeStyle(CarCategoriesModel value)        { selectedStyle = value; update(); }
  void changeCarCapacity(CarCapacity value)         { selectedCarCapacity = value; update(); }
  void changeTransmissionType(TransmissionType value) { selectedTransmissionType = value; update(); }
  void changeFuelType(FuelType value)               { selectedFuelType = value; update(); }
  void changeCylinder(CarCylinders value)           { selectedCylinder = value; update(); }
  void changeRentStatus(bool value)                 { isRent = value; update(); }

  //  Image Management 

  Future<void> pickImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      selectedImages.addAll(images);
      update();
    }
  }

  void removeImage(int index) {
    selectedImages.removeAt(index);
    update();
  }

  // Submit Car 

  Future<void> submitCar() async {
    if (selectedImages.isEmpty) {
      Get.snackbar('Error', 'Please select at least one image',
          backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
      return;
    }

    if (nameEnController.text.trim().isEmpty ||
        priceController.text.trim().isEmpty ||
        yearController.text.trim().isEmpty ||
        topSpeedController.text.trim().isEmpty ||
        engineHpController.text.trim().isEmpty ||
        highwayMpgController.text.trim().isEmpty ||
        cityMpgController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please fill in all required fields',
          backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
      return;
    }

    isLoading = true;
    update();

    try {
      final request = addCarData.createRequest();

      request.fields.addAll({
        'name_en':               nameEnController.text.trim(),
        'name_ar':               nameArController.text.trim(),
        'color_en':              colorEnController.text.trim(),
        'color_ar':              colorArController.text.trim(),
        'market_category_en':   marketCategoryEnController.text.trim(),
        'market_category_ar':   marketCategoryArController.text.trim(),
        'fuel_type_en':          selectedFuelType!.title,
        'fuel_type_ar':          selectedFuelType!.titleAr,
        'price':                 priceController.text.trim(),
        'brand_id':              selectedBrand!.id.toString(),
        'style_id':              selectedStyle!.id.toString(),
        'gear_type':             selectedTransmissionType!.title,
        'cylinders':             selectedCylinder!.cylinder.toString(),
        'capacity':              selectedCarCapacity!.passengers.toString(),
        'is_rent':               isRent ? '1' : '0',
        'year':                  yearController.text.trim(),
        'top_speed':             topSpeedController.text.trim(),
        'engine_hp':             engineHpController.text.trim(),
        'highway_mpg':           highwayMpgController.text.trim(),
        'city_mpg':              cityMpgController.text.trim(),
      });

      for (final xFile in selectedImages) {
        request.files.add(
          await http.MultipartFile.fromPath('images[]', xFile.path),
        );
      }

      final response = await addCarData.addCar(request);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();

        if (Get.context != null) {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(
              content: Text('Car added successfully!',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 3),
            ),
          );
        }

        _refreshDataInBackground();
        _resetForm();

      } else {
        final responseBody = await response.stream.bytesToString();
        final result = jsonDecode(responseBody);
        Get.snackbar('Error', result['message']?.toString() ?? 'Something went wrong',
            backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: $e',
          backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
    } finally {
      isLoading = false;
      update();
    }
  }

  //  Background Refresher 

  void _refreshDataInBackground() async {
    try { Get.find<HomePageControllerImp>().getData(); } catch (_) {}
    try {
      final myCarsCtrl = Get.find<MyCarsController>();
      await myCarsCtrl.getMyCars();
      myCarsCtrl.update();
    } catch (_) {}
  }

  //  Reset Form 

  void _resetForm() {
    nameEnController.clear();
    nameArController.clear();
    priceController.clear();
    colorEnController.clear();
    colorArController.clear();
    marketCategoryEnController.clear();
    marketCategoryArController.clear();
    yearController.clear();
    topSpeedController.clear();
    engineHpController.clear();
    highwayMpgController.clear();
    cityMpgController.clear();

    selectedCarCapacity      = CarCapacity.four;
    selectedTransmissionType = TransmissionType.automatic;
    selectedFuelType         = FuelType.regular_unleaded;
    selectedCylinder         = CarCylinders.four;

    if (brands.isNotEmpty) selectedBrand = brands.first;
    if (styles.isNotEmpty) selectedStyle = styles.first;

    isRent = false;
    selectedImages.clear();
    currentStep = 0;
    errors.clear();

    update();
  }
}