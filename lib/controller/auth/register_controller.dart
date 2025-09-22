import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/function/auth_fail_alert.dart';
import 'package:graduation_project/core/function/handling_data.dart';
import 'package:graduation_project/data/source/remote/auth/register_data.dart';

abstract class RegisterController extends GetxController {
  register();
  moveToLogin();
}

class RegisterControllerImp extends RegisterController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController password;
  // late TextEditingController passwordVerify;

  bool passwordState = true;
  bool passwordVerifyState = true;

  StatusRequest? statusRequest = StatusRequest.none;
  RegisterData registerData = RegisterData(Get.find());

  showPassword() {
    passwordState = passwordState == true ? false : true;
    update();
  }

  showPasswordVerify() {
    passwordVerifyState = passwordVerifyState == true ? false : true;
    update();
  }

  @override
  register() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await registerData.postData(userName.text, email.text, password.text);
      print('============================= Controller $response');
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == true) {
          Get.offNamed(
            AppRoutes.registerCheckEmail,
            arguments: {'email': email.text},
          );
        } else if (response['status'] == false) {
          authFailAlert(response['message']);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  moveToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    userName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    // passwordVerify = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    password.dispose();
    // passwordVerify.dispose();

    super.dispose();
  }
}
