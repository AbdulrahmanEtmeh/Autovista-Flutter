import 'package:get/get.dart';

import '../../core/services/my_services.dart';

class AccountSettingsController extends GetxController {
  MyServices myServices = Get.find();
  String? userName;
  String? email;

  @override
  void onInit() {
    userName = myServices.sharedPreferences.getString('userName');
    email = myServices.sharedPreferences.getString('email');
    super.onInit();
  }
}
