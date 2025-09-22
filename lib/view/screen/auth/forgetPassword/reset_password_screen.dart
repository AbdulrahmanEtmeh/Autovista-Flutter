import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/view/widget/shared/main_button.dart';

import '../../../../controller/auth/forgetPassword/reset_password_controller.dart';
import '../../../../core/function/input_validation.dart';
import '../../../widget/auth/component_container.dart';
import '../../../widget/auth/decription_text.dart';
import '../../../widget/auth/sub_title.dart';
import '../../../widget/auth/auth_custom_field.dart';
import '../../../widget/auth/title_text.dart';
import '../../../widget/shared/logo_image.dart';
import '../../../widget/shared/red_lines_design_row.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Stack(
                children: [
                  const RedLinesDesignRow(),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              LogoImage(
                                height: Get.height * 0.3,
                                width: Get.width,
                              ),
                              TitleText(text: 'Reset Password'.tr),
                              SizedBox(height: Get.height * 0.1),
                              ComponentContainer(
                                height: Get.height * 0.6,
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
                                        SubTitle(text: 'New Password'.tr),
                                        SizedBox(height: Get.height * 0.02),
                                        DescriptionText(
                                            text:
                                                'Please enter your new password'
                                                    .tr),
                                        SizedBox(height: Get.height * 0.02),
                                        GetBuilder<ResetPasswordControllerImp>(
                                          builder: (controller) =>
                                              AuthCustomField(
                                            validator: (val) {
                                              return inputValidation(
                                                  val!, 6, 24, 'password');
                                            },
                                            controller: controller.password,
                                            labelText: 'password'.tr,
                                            obscureText:
                                                controller.passwordState,
                                            iconOnTap: controller.showPassword,
                                            icon: Icons.remove_red_eye,
                                          ),
                                        ),
                                        GetBuilder<ResetPasswordControllerImp>(
                                          builder: (controller) =>
                                              AuthCustomField(
                                            validator: (val) {
                                              return inputValidation(
                                                  val!, 6, 24, 'password');
                                            },
                                            controller:
                                                controller.passwordVerify,
                                            labelText: 'confirm password'.tr,
                                            obscureText:
                                                controller.passwordVerifyState,
                                            iconOnTap:
                                                controller.showPasswordVerify,
                                            icon: Icons.remove_red_eye,
                                          ),
                                        ),
                                        MainButton(
                                            buttonText: 'Reset Password'.tr,
                                            onPressed: () {
                                              controller.resetPassword();
                                            },
                                            height: Get.height * 0.065,
                                            width: Get.width)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
