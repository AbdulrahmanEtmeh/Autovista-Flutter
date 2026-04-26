import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/function/auth_fail_alert.dart';
import 'package:graduation_project/core/function/handling_data.dart';
import 'package:graduation_project/core/network/api_response.dart';
import 'package:graduation_project/data/source/remote/auth/register_data.dart';

abstract class RegisterController extends GetxController {
  register();
  moveToLogin();
}

class RegisterControllerImp extends RegisterController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
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
      var response = await registerData.postData(
        name.text,
        email.text,
        phone.text,
        password.text,
      );
      print('============================= Controller $response');
      statusRequest = handlingApiResponse(response);
      response.when(
        success: (ApiSuccess<Map<String, dynamic>> successResponse) {
          final responseData = successResponse.data;
          if (responseData['status'] == true) {
            Get.offNamed(
              AppRoutes.registerCheckEmail,
              arguments: {'email': email.text},
            );
          } else if (responseData['status'] == false) {
            authFailAlert(responseData['message']);
            statusRequest = StatusRequest.failure;
          }
        },
        failure: (ApiFailure<Map<String, dynamic>> failureResponse) {
          if (failureResponse.message != null &&
              failureResponse.statusRequest == StatusRequest.failure) {
            authFailAlert(failureResponse.message!);
          }
        },
      );
      update();
    } else {}
  }

  @override
  moveToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    // passwordVerify = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    // passwordVerify.dispose();

    super.dispose();
  }
}
