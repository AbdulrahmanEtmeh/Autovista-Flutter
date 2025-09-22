import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  moveToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  moveToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
