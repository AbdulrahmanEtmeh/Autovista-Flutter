import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/app_image_asset.dart';
import '../../core/constant/app_routes.dart';
import '../../core/function/auth_fail_alert.dart';
import '../../core/function/handling_data.dart';
import '../../core/network/api_response.dart';
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
      statusRequest = handlingApiResponse(response);
      response.when(
        success: (ApiSuccess<Map<String, dynamic>> successResponse) async {
          final responseData = successResponse.data;
          if (responseData['status'] == true) {
            final user = responseData['data']['user'];
            final accessToken = responseData['data']['access_token'];

            myServices.sharedPreferences.setInt('id', user['id']);
            myServices.sharedPreferences
                .setString('userName', user['name'] ?? '');
            myServices.sharedPreferences
                .setString('email', user['email'] ?? '');
            myServices.sharedPreferences.setString('step', '2');
            myServices.sharedPreferences.setString('token', accessToken ?? '');

            Get.offNamed(
              AppRoutes.home,
            );
            await sendFcmToken();
          } else if (responseData['status'] == false) {
            authFailAlert(responseData['message']);
            statusRequest = StatusRequest.failure;
          }
        },
        failure: (ApiFailure<Map<String, dynamic>> failureResponse) {
          print('[LoginController] API Failure');
          print('[LoginController] Status: ${failureResponse.statusRequest}');
          print('[LoginController] Message: ${failureResponse.message}');
          print('[LoginController] StatusCode: ${failureResponse.statusCode}');
          print('[LoginController] Error: ${failureResponse.error}');

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
