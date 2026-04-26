import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/function/auth_fail_alert.dart';
import 'package:graduation_project/core/function/handling_data.dart';
import 'package:graduation_project/core/network/api_response.dart';
import 'package:graduation_project/data/source/remote/auth/forgetPassword/reset_password_data.dart';

import '../../../core/constant/app_routes.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController passwordVerify;

  bool passwordState = true;
  bool passwordVerifyState = true;

  StatusRequest? statusRequest;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email;

  showPassword() {
    passwordState = passwordState == true ? false : true;
    update();
  }

  showPasswordVerify() {
    passwordVerifyState = passwordVerifyState == true ? false : true;
    update();
  }

  @override
  resetPassword() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await resetPasswordData.postData(email!.trim(), password.text);
      // ignore: avoid_print
      print('======================== Controller $response');
      statusRequest = handlingApiResponse(response);
      response.when(
        success: (ApiSuccess<Map<String, dynamic>> s) {
          if (s.data['status'] == true) {
            Get.offNamed(AppRoutes.successResetPassword);
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
  void onInit() {
    password = TextEditingController();
    passwordVerify = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    passwordVerify.dispose();

    super.dispose();
  }
}
