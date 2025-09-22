import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_image_asset.dart';
import '../../core/constant/app_routes.dart';
import '../../core/function/auth_fail_alert.dart';
import '../../core/function/handling_data.dart';
import '../../core/services/my_services.dart';
import '../../core/services/auth_services.dart';
import '../../data/source/remote/auth/firebase/notification_data.dart';
import '../../data/source/remote/auth/login_data.dart';

abstract class LoginController extends GetxController {
  login();
  moveToRegister();
  moveToForgetPassword();
  googleSignIn();
  Future<void> sendFcmToken();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool passwordState = true;

  StatusRequest? statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  AuthServicesImpl authServices = Get.find();
  NotificationData notificationData = NotificationData(Get.find());

  List<String> logoContainer = [
    AppImageAsset.googleLogoImage,
    AppImageAsset.facebookLogoImage,
    AppImageAsset.twitterLogoImage
  ];

  @override
  Future<void> sendFcmToken() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();

    if (fcmToken != null) {
      var response = await notificationData.sendFcmToken(fcmToken);
      print("Send FCM Token Response: $response");
    } else {
      print("No FCM token generated");
    }
  }

  showPassword() {
    passwordState = passwordState == true ? false : true;
    update();
  }

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      // ignore: avoid_print
      print('======================== Controller $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == true) {
          myServices.sharedPreferences
              .setInt('id', response['data']['0']['id']);
          myServices.sharedPreferences
              .setString('userName', response['data']['0']['user_name']);
          myServices.sharedPreferences
              .setString('email', response['data']['0']['email']);
          myServices.sharedPreferences.setString('step', '2');
          myServices.sharedPreferences
              .setString('token', response['data']['token']);

          Get.offNamed(
            AppRoutes.home,
          );
          await sendFcmToken();
        } else if (response['status'] == false) {
          authFailAlert(response['message']);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  moveToRegister() {
    Get.offNamed(AppRoutes.register);
  }

  @override
  moveToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  googleSignIn() async {
    await authServices.signInWithGoogle();
  }
}
