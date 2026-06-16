import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/home/home_page_controller.dart';
import 'package:graduation_project/core/services/my_services.dart';
import 'package:graduation_project/data/model/car_model.dart';
import 'package:graduation_project/data/source/remote/deletCar/delet_car_data.dart';
import 'package:graduation_project/data/source/remote/home/home_data.dart';

class MyCarsController extends GetxController {
  final HomeData homeData = HomeData(Get.find());
  final DeleteCarData deleteCarData = DeleteCarData();
  final MyServices myServices = Get.find();

  List<CarModel> myCars = [];
  bool isLoading = false;

  @override
  void onInit() {
    getMyCars();
    super.onInit();
  }
  //  Fetch My Cars
  Future<void> getMyCars() async {
    isLoading = true;
    update();
    final currentUserId = myServices.sharedPreferences.getInt('id');
    final response = await homeData.getData(currentUserId!);
    response.when(
      success: (successResponse) {
        final carsList = successResponse.data['data'];
        myCars.clear();
        for (final item in carsList) {
          final car = CarModel.fromJson(item);
          if (car.ownerId == currentUserId) {
            myCars.add(car);
          }
        }
      },
      failure: (_) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: const Text('Failed to load your cars'),
            backgroundColor: Colors.red.withOpacity(0.8),
          ),
        );
      },
    );

    isLoading = false;
    update();
  }
  
  
  //  Delete Car
 
  Future<void> deleteCar(int carId) async {
    if (isLoading) return;
    
    final confirmed = await showDialog<bool>(
      context: Get.context!,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xff2A3339),
        title: const Text('Delete Car', style: TextStyle(color: Colors.white)),
        content: const Text('Are you sure you want to delete this car?', style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel', style: TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    isLoading = true;
    update();

    // التحديث اللحظي الموضعي (Optimistic Update)
    final carIndex = myCars.indexWhere((car) => car.id == carId);
    CarModel? removedCar;
    if (carIndex != -1) {
      removedCar = myCars[carIndex];
      myCars.removeAt(carIndex);
      update();
    }

    try {
      final response = await deleteCarData.deleteCar(carId);

      if (response.statusCode == 200 || response.statusCode == 204) {
        
        // ───────────────────────────────────────────────────────────────────────
        // 🚀 الحل الموحد: تحديث صفحة الهوم في الخلفية بنفس أسلوب كود الإضافة تماماً
        // ───────────────────────────────────────────────────────────────────────
        try { 
          Get.find<HomePageControllerImp>().getData(); 
        } catch (_) {}

        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: const Text('Car deleted successfully'),
            backgroundColor: Colors.green.withOpacity(0.8),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        // التراجع وإعادة السيارة لمكانها في حال فشل السيرفر
        if (carIndex != -1 && removedCar != null) {
          myCars.insert(carIndex, removedCar);
        }
        update();

        String errorMessage = 'Failed to delete car';
        try {
          final result = jsonDecode(response.body);
          errorMessage = result['message']?.toString() ?? errorMessage;
        } catch (_) {}

        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red.withOpacity(0.8),
          ),
        );
      }
    } catch (e) {
      // التراجع في حال حدوث خطأ في الاتصال
      if (carIndex != -1 && removedCar != null) {
        myCars.insert(carIndex, removedCar);
      }
      update();

      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text('An unexpected error occurred: $e'),
          backgroundColor: Colors.red.withOpacity(0.8),
        ),
      );
    } finally {
      isLoading = false;
      update();
    }
  }
}
