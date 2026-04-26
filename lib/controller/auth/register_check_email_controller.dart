import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/function/auth_fail_alert.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data.dart';
import '../../core/network/api_response.dart';
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
    final normalizedCode = verificationCode.trim();
    final normalizedEmail = email?.trim();

    if (normalizedEmail == null || normalizedEmail.isEmpty) {
      authFailAlert('email_not_found');
      statusRequest = StatusRequest.failure;
      update();
      return;
    }

    statusRequest = StatusRequest.loading;
    update();
    print('[RegisterCheckEmailController] Verifying: $normalizedEmail');
    print(
        '[RegisterCheckEmailController] Code length: ${normalizedCode.length}');
    var response =
        await registerCheckEmailData.postData(normalizedEmail, normalizedCode);
    // ignore: avoid_print
    print('======================== Controller $response');
    statusRequest = handlingApiResponse(response);
    response.when(
      success: (ApiSuccess<Map<String, dynamic>> s) {
        if (s.data['status'] == true) {
          Get.offNamed(AppRoutes.successRegister);
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

  @override
  void onInit() {
    email = Get.arguments?['email']?.toString();
    super.onInit();
  }
}
