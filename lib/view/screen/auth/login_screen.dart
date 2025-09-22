import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/function/app_exit_alert.dart';
import '../../../core/function/input_validation.dart';
import '../../widget/auth/component_container.dart';
import '../../widget/auth/logo_container.dart';
import '../../widget/auth/navigation_text.dart';
import '../../widget/auth/auth_custom_field.dart';
import '../../widget/auth/title_text.dart';
import '../../widget/auth/forget_password.dart';
import '../../widget/shared/logo_image.dart';
import '../../widget/shared/main_button.dart';
import '../../widget/shared/red_lines_design_row.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: appExitAlert,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Stack(
              children: [
                const RedLinesDesignRow(),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      LogoImage(
                        height: Get.height * 0.25,
                        width: double.infinity,
                      ),
                      TitleText(text: 'welocme_back'.tr),
                      SizedBox(height: Get.height * 0.04),
                      GetBuilder<LoginControllerImp>(
                        builder: (controller) => SingleChildScrollView(
                          child: ComponentContainer(
                            height: Get.height * 0.675,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: Get.height * 0.075,
                                left: Get.width * 0.075,
                                right: Get.width * 0.075,
                              ),
                              child: Form(
                                key: controller.formState,
                                child: Column(
                                  children: [
                                    AuthCustomField(
                                      validator: (val) {
                                        return inputValidation(
                                            val!, 5, 100, 'email');
                                      },
                                      controller: controller.email,
                                      keyboardType: TextInputType.emailAddress,
                                      labelText: 'email'.tr,
                                      icon: Icons.email_outlined,
                                    ),
                                    AuthCustomField(
                                      validator: (val) {
                                        return inputValidation(
                                            val!, 6, 24, 'password');
                                      },
                                      controller: controller.password,
                                      labelText: 'password'.tr,
                                      obscureText: controller.passwordState,
                                      iconOnTap: controller.showPassword,
                                      icon: Icons.remove_red_eye,
                                    ),
                                    ForgetPassword(
                                      text: 'Forget password ?'.tr,
                                      onTap: () {
                                        controller.moveToForgetPassword();
                                      },
                                    ),
                                    SizedBox(height: Get.height * 0.0275),
                                    MainButton(
                                      onPressed: () {
                                        controller.login();
                                      },
                                      buttonText: 'Sign in'.tr,
                                      height: Get.height * 0.065,
                                      width: Get.width,
                                    ),
                                    SizedBox(height: Get.height * 0.035),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: List.generate(
                                        controller.logoContainer.length,
                                        (index) => LogoContainer(
                                          imageAsset:
                                              controller.logoContainer[index],
                                          onTap: () {
                                            if (index == 0) {
                                              controller.googleSignIn();
                                            } else if (index == 1) {
                                              // Facebook Sign-In logic here
                                            } else if (index == 2) {
                                              // Twitter Sign-In logic here
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.03),
                                    NavigationText(
                                      firstText: 'dont have an account ?'.tr,
                                      secondtext: 'sign up'.tr,
                                      onTap: () {
                                        controller.moveToRegister();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
