import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/function/auth_fail_alert.dart';
import 'package:graduation_project/data/source/remote/auth/forgetPassword/forget_password_data.dart';

import '../../../core/function/handling_data.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  moveBackToLogin();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;

  StatusRequest? statusRequest;
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());

  @override
  checkEmail() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await forgetPasswordData.postData(email.text);
      // ignore: avoid_print
      print('======================== Controller $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == true) {
          Get.toNamed(
            AppRoutes.emailVerification,
            arguments: {'email': email.text},
          );
        } else if (response['status'] == false) {
          authFailAlert(response['message']);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  moveBackToLogin() {
    Get.back();
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
