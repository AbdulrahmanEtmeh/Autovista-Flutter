import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/function/auth_fail_alert.dart';
import 'package:graduation_project/core/function/handling_data.dart';
import 'package:graduation_project/core/network/api_response.dart';
import 'package:graduation_project/data/source/remote/auth/forgetPassword/forget_password_data.dart';

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
      final normalizedEmail = email.text.trim();
      statusRequest = StatusRequest.loading;
      update();
      var response = await forgetPasswordData.postData(normalizedEmail);
      // ignore: avoid_print
      print('======================== Controller $response');
      statusRequest = handlingApiResponse(response);
      response.when(
        success: (ApiSuccess<Map<String, dynamic>> s) {
          if (s.data['status'] == true) {
            Get.toNamed(
              AppRoutes.emailVerification,
              arguments: {'email': normalizedEmail},
            );
          } else if (s.data['status'] == false) {
            authFailAlert(s.data['message']);
            statusRequest = StatusRequest.failure;
          }
        },
        failure: (ApiFailure<Map<String, dynamic>> f) {
          if (f.message != null && f.statusRequest == StatusRequest.failure) {
            authFailAlert(f.message!);
          }
        },
      );
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
