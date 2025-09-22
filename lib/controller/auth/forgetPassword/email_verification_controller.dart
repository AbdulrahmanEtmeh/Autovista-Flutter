import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/function/auth_fail_alert.dart';
import 'package:graduation_project/data/source/remote/auth/forgetPassword/email_verification_data.dart';

import '../../../core/function/handling_data.dart';

abstract class EmailVerificationController extends GetxController {
  checkCode(String verificationCode);
}

class EmailVerificationControllerImp extends EmailVerificationController {
  late String verifyCode;
  String? email;

  StatusRequest? statusRequest;
  EmailVerificationData emailVerificationData =
      EmailVerificationData(Get.find());

  @override
  checkCode(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await emailVerificationData.postData(email!, verificationCode);
    // ignore: avoid_print
    print('======================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        Get.offNamed(AppRoutes.resetPassword, arguments: {'email': email});
      } else if (response['status'] == false) {
        authFailAlert(response['message']);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
