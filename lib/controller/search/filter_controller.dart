// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/network/api_response.dart';
import 'package:graduation_project/data/source/remote/search/filter_data.dart';

import '../../core/class/enums/transmission_type.dart';
import '../../core/class/status_request.dart';
import '../../core/function/handling_data.dart';
import '../../core/services/my_services.dart';
import '../../data/model/car_brands_model.dart';
import '../../data/model/car_categories_model.dart';
import '../../data/model/car_model.dart';
import '../../data/source/remote/home/home_data.dart';

class FilterController extends GetxController {
  MyServices myServices = Get.find();
  FilterData filterData = FilterData(Get.find());
  HomeData homeData = HomeData(Get.find());
  CarBrandsModel? selectedBrand;
  TransmissionType? selectedTransmissionType;
  CarCategoriesModel? selectedVehicleStyle;
  late TextEditingController carName;
  int? isRent;
  Color buyColor = AppColors.homeContainers;
  Color rentColor = AppColors.homeContainers;
  int? capacity;
  bool cylinderFour = false;
  bool cylinderSix = false;
  bool cylinderEight = false;
  bool cylinderTwelve = false;
  List<String> cylinderGroup = [];
  StatusRequest statusRequest = StatusRequest.none;
  List<CarModel> cars = [];
  List<CarBrandsModel> brands = [];
  List<CarCategoriesModel> styles = [];

  @override
  void onInit() {
    selectedBrand = null;
    selectedTransmissionType = null;
    selectedVehicleStyle = null;
    isRent = null;
    capacity = null;
    carName = TextEditingController();
    _loadLookups();
    super.onInit();
  }

  @override
  void dispose() {
    carName.dispose();
    super.dispose();
  }

  Future<void> _loadLookups() async {
    final brandsResponse = await homeData.getBrands();
    brandsResponse.when(
      success: (successResponse) {
        final responseData = successResponse.data;
        if (responseData['status'] == true && responseData['data'] is List) {
          brands = (responseData['data'] as List)
              .whereType<Map<String, dynamic>>()
              .map((e) => CarBrandsModel.fromJson(e))
              .toList();
        }
      },
      failure: (failureResponse) {},
    );

    final stylesResponse = await homeData.getStyles();
    stylesResponse.when(
      success: (successResponse) {
        final responseData = successResponse.data;
        if (responseData['status'] == true && responseData['data'] is List) {
          styles = (responseData['data'] as List)
              .whereType<Map<String, dynamic>>()
              .map((e) => CarCategoriesModel.fromJson(e))
              .toList();
        }
      },
      failure: (failureResponse) {},
    );

    update();
  }

  String? _minSelectedCylinders() {
    if (cylinderGroup.isEmpty) return null;
    final values = cylinderGroup
        .map((e) => int.tryParse(e))
        .whereType<int>()
        .toList()
      ..sort();
    if (values.isEmpty) return null;
    return values.first.toString();
  }

  bool _hasAnyFilterSelected() {
    return (carName.text.trim().isNotEmpty) ||
        selectedBrand != null ||
        selectedTransmissionType != null ||
        selectedVehicleStyle != null ||
        isRent != null ||
        capacity != null ||
        cylinderGroup.isNotEmpty;
  }

  List<CarModel> _extractCarsFromResponseData(dynamic payload) {
    List<dynamic> responseBody = [];
    if (payload is List) {
      responseBody = payload;
    } else if (payload is Map<String, dynamic>) {
      final nestedCars = payload['cars'];
      if (nestedCars is List) {
        responseBody = nestedCars;
      }
    }

    return responseBody
        .whereType<Map<String, dynamic>>()
        .map((e) => CarModel.fromJson(e))
        .toList();
  }

  bool _matchesClientFilter(CarModel car, Map<String, dynamic> filters) {
    final search = filters['search']?.toString().toLowerCase();
    if (search != null && search.isNotEmpty) {
      final carNameText = (car.name ?? '').toLowerCase();
      if (!carNameText.contains(search)) return false;
    }

    final gearType = filters['gear_type']?.toString().toLowerCase();
    if (gearType != null && gearType.isNotEmpty) {
      final carGear = (car.gearType ?? '').toLowerCase();
      if (carGear != gearType) return false;
    }

    final isRentRaw = filters['is_rent']?.toString();
    if (isRentRaw != null && isRentRaw.isNotEmpty) {
      final expectedRent = isRentRaw.toLowerCase() == 'true';
      if (car.isRent != expectedRent) return false;
    }

    final brandId = int.tryParse(filters['brand_id']?.toString() ?? '');
    if (brandId != null && car.brandId != brandId) return false;

    final styleId = int.tryParse(filters['style_id']?.toString() ?? '');
    if (styleId != null && car.styleId != styleId) return false;

    final minCylinders = int.tryParse(filters['cylinders']?.toString() ?? '');
    if (minCylinders != null) {
      final carCylinders = car.cylinders ?? 0;
      if (carCylinders < minCylinders) return false;
    }

    final minCapacity = int.tryParse(filters['capacity']?.toString() ?? '');
    if (minCapacity != null) {
      final carCapacity = car.capacity ?? 0;
      if (carCapacity < minCapacity) return false;
    }

    return true;
  }

  Future<List<CarModel>> _fallbackClientFiltering(
      Map<String, dynamic> filters) async {
    final userId = myServices.sharedPreferences.getInt('id') ?? 0;
    final response = await homeData.getData(userId);

    List<CarModel> allCars = [];
    response.when(
      success: (successResponse) {
        final data = successResponse.data;
        if (data['status'] == true) {
          allCars = _extractCarsFromResponseData(data['data']);
        }
      },
      failure: (failureResponse) {},
    );

    return allCars.where((car) => _matchesClientFilter(car, filters)).toList();
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
    debugPrint('=================> ${selectedBrand?.name}');
    update();
  }

  changeTransmissionType(val) {
    selectedTransmissionType = val;
    debugPrint('=================> ${selectedTransmissionType?.name}');
    update();
  }

  changeVehicleStyle(val) {
    selectedVehicleStyle = val;
    debugPrint('=================> ${selectedVehicleStyle?.name}');
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
    selectedBrand = null;
    carName.text = '';
    selectedTransmissionType = null;
    selectedVehicleStyle = null;
    isRent = null;
    buyColor = AppColors.homeContainers;
    rentColor = AppColors.homeContainers;
    capacity = null;
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
    final filters = <String, dynamic>{
      'search': carName.text.trim().isEmpty ? null : carName.text.trim(),
      'gear_type': selectedTransmissionType?.title.toLowerCase(),
      'is_rent': isRent == null ? null : (isRent == 1 ? 'true' : 'false'),
      'brand_id': selectedBrand?.id,
      'style_id': selectedVehicleStyle?.id,
      'cylinders': _minSelectedCylinders(),
      'capacity': capacity,
    };

    var response = await filterData.getData(
      filters,
    );
    debugPrint('====================== Controller $response');
    statusRequest = handlingApiResponse(response);
    response.when(
      success: (ApiSuccess<Map<String, dynamic>> successResponse) {
        final responseData = successResponse.data;
        if (responseData['status'] == true) {
          cars.clear();
          cars.addAll(_extractCarsFromResponseData(responseData['data']));

          // Some backend deployments may return empty arrays unexpectedly for valid filters.
          if (cars.isEmpty && _hasAnyFilterSelected()) {
            _fallbackClientFiltering(filters).then((fallbackCars) {
              cars
                ..clear()
                ..addAll(fallbackCars);
              Get.toNamed(AppRoutes.filterResult, arguments: {
                'cars': cars,
              });
              update();
            });
          } else {
            Get.toNamed(AppRoutes.filterResult, arguments: {
              'cars': cars,
            });
          }
        } else if (responseData['status'] == false) {
          statusRequest = StatusRequest.failure;
        }
      },
      failure: (ApiFailure<Map<String, dynamic>> failureResponse) {},
    );
    update();
  }
}
