import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/services/my_services.dart';

import '../core/constant/app_routes.dart';
import '../data/source/remote/auth/log_out_data.dart';

class MyDrawerController extends GetxController {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  LogOutData logOutData = LogOutData(Get.find());
  MyServices myServices = Get.find();
  String? userName;
  String? email;

  @override
  void onInit() {
    userName = myServices.sharedPreferences.getString('userName');
    email = myServices.sharedPreferences.getString('email');
    super.onInit();
  }

  void drawerNavigation(String route) {
    Get.back();
    Get.toNamed(route);
  }

  logOut() {
    logOutData.postData();
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
