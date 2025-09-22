import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/services/my_services.dart';
import 'package:graduation_project/data/source/remote/auth/log_out_data.dart';

abstract class SettingsScreenController extends GetxController {
  logOut();
  moveTo(String route);
}

class SettingsScreenControllerImp extends SettingsScreenController {
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

  @override
  moveTo(String route) {
    Get.toNamed(route);
  }

  logoutFunction() {
    logOut();
  }

  @override
  logOut() {
    logOutData.postData();
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
