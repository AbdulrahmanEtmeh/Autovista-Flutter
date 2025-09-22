import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/function/auth_fail_alert.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data.dart';
import '../../data/source/remote/auth/register_check_email_data.dart';

abstract class RegisterCheckEmailController extends GetxController {
  checkCode(String verificationCode);
}

class RegisterCheckEmailControllerImp extends RegisterCheckEmailController {
  String? email;

  StatusRequest? statusRequest;
  RegisterCheckEmailData registerCheckEmailData =
      RegisterCheckEmailData(Get.find());

  @override
  checkCode(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await registerCheckEmailData.postData(email!, verificationCode);
    // ignore: avoid_print
    print('======================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        Get.offNamed(AppRoutes.successRegister);
      } else if (response['status'] == false) {
        authFailAlert(response['message']);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    // Get.offNamed(AppRoutes.successRegister);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
