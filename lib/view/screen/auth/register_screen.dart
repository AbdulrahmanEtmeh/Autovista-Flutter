import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/auth/register_controller.dart';
import 'package:graduation_project/core/class/handling_data_view.dart';
import 'package:graduation_project/core/function/app_exit_alert.dart';
import 'package:graduation_project/view/widget/auth/component_container.dart';
import 'package:graduation_project/view/widget/auth/title_text.dart';
import 'package:graduation_project/view/widget/shared/logo_image.dart';
import 'package:graduation_project/view/widget/shared/main_button.dart';
import 'package:graduation_project/view/widget/shared/red_lines_design_row.dart';

import '../../../core/constant/app_image_asset.dart';
import '../../../core/function/input_validation.dart';
import '../../widget/auth/logo_container.dart';
import '../../widget/auth/navigation_text.dart';
import '../../widget/auth/auth_custom_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // ignore: deprecated_member_use
          WillPopScope(
        onWillPop: appExitAlert,
        child: GetBuilder<RegisterControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Stack(
              children: [
                const RedLinesDesignRow(),
                LogoImage(height: Get.height * 0.175, width: Get.width * 0.25),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.15),
                      TitleText(text: 'Create Account'.tr),
                      SizedBox(height: Get.height * 0.03),
                      ComponentContainer(
                        height: Get.height * 0.8235,
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
                                        val!, 4, 20, 'username');
                                  },
                                  controller: controller.userName,
                                  labelText: 'user name'.tr,
                                  icon: Icons.person,
                                ),
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
                                GetBuilder<RegisterControllerImp>(
                                  builder: (controller) => AuthCustomField(
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
                                ),
                                // GetBuilder<RegisterControllerImp>(
                                //   builder: (controller) => AuthCustomField(
                                //     validator: (val) {
                                //       return inputValidation(
                                //           val!, 6, 24, 'password');
                                //     },
                                //     controller: controller.passwordVerify,
                                //     labelText: 'confirm password'.tr,
                                //     obscureText: controller.passwordVerifyState,
                                //     iconOnTap: controller.showPasswordVerify,
                                //     icon: Icons.remove_red_eye,
                                //   ),
                                // ),
                                SizedBox(height: Get.height * 0.015),
                                MainButton(
                                  buttonText: 'Register'.tr,
                                  onPressed: () {
                                    controller.register();
                                  },
                                  height: Get.height * 0.065,
                                  width: Get.width,
                                ),
                                SizedBox(height: Get.height * 0.035),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    LogoContainer(
                                      imageAsset: AppImageAsset.googleLogoImage,
                                      onTap: () {},
                                    ),
                                    LogoContainer(
                                        onTap: () {},
                                        imageAsset:
                                            AppImageAsset.facebookLogoImage),
                                    LogoContainer(
                                      imageAsset:
                                          AppImageAsset.twitterLogoImage,
                                      onTap: () {},
                                    )
                                  ],
                                ),
                                SizedBox(height: Get.height * 0.03),
                                NavigationText(
                                  firstText: 'Already have an account?'.tr,
                                  secondtext: 'login'.tr,
                                  onTap: () {
                                    controller.moveToLogin();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
