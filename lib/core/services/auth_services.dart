import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/source/remote/auth/firebase/google_login_data.dart';
import '../class/status_request.dart';
import '../constant/app_routes.dart';
import '../function/auth_fail_alert.dart';
import '../function/handling_data.dart';
import 'my_services.dart';

class AuthServicesImpl extends GetxController {
  StatusRequest? statusRequest = StatusRequest.none;
  GoogleLoginData googleLoginData = GoogleLoginData(Get.find());

  MyServices myServices = Get.find();

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // ✅ Always sign out first to force showing the account picker
      await googleSignIn.signOut();

      // Now this will always show the "Choose account" dialog
      final gUser = await googleSignIn.signIn();
      if (gUser == null) return false; // User cancelled

      final gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user;
      if (user != null) {
        debugPrint(
            '✅ Google Sign-In successful: ${user.displayName}, ${user.email}');

        // Get Firebase ID token
        final idToken = await user.getIdToken();

        // Send to backend
        await _sendToBackend(idToken!, user);

        return true;
      } else {
        debugPrint('❌ Google Sign-In failed');
        return false;
      }
    } catch (e) {
      debugPrint('Google Sign-In Exception: $e');
      return false;
    }
  }

  Future<void> _sendToBackend(String idToken, User user) async {
    statusRequest = StatusRequest.loading;
    // update();
    var response = await googleLoginData.postData(idToken, user);
    // ignore: avoid_print
    print('======================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == true) {
        myServices.sharedPreferences.setInt('id', response['data']['0']['id']);
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
      } else if (response['status'] == false) {
        authFailAlert(response['message']);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
