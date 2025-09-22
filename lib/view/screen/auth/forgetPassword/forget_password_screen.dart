import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/auth/forgetPassword/forget_password_controller.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/view/widget/shared/main_button.dart';

import '../../../../core/function/input_validation.dart';
import '../../../widget/auth/auth_back_button.dart';
import '../../../widget/auth/component_container.dart';
import '../../../widget/auth/decription_text.dart';
import '../../../widget/auth/sub_title.dart';
import '../../../widget/auth/auth_custom_field.dart';
import '../../../widget/auth/title_text.dart';
import '../../../widget/shared/logo_image.dart';
import '../../../widget/shared/red_lines_design_row.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Stack(
                children: [
                  const RedLinesDesignRow(),
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: Get.width * 0.05),
                            child: AuthBackButton(onPressed: () {
                              controller.moveBackToLogin();
                            }),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                LogoImage(
                                  height: Get.height * 0.3,
                                  width: double.infinity,
                                ),
                                TitleText(text: 'Forget Password ?'.tr),
                                SizedBox(height: Get.width * 0.1),
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
                                          SubTitle(text: 'Verify Email'.tr),
                                          SizedBox(height: Get.height * 0.02),
                                          DescriptionText(
                                              text:
                                                  'Please enter your Email to recive a verification code'
                                                      .tr),
                                          SizedBox(height: Get.height * 0.02),
                                          AuthCustomField(
                                            validator: (val) {
                                              return inputValidation(
                                                  val!, 5, 100, 'email');
                                            },
                                            controller: controller.email,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            labelText: 'email'.tr,
                                            icon: Icons.email_outlined,
                                          ),
                                          MainButton(
                                            buttonText:
                                                'Send Verfication Code'.tr,
                                            onPressed: () {
                                              controller.checkEmail();
                                            },
                                            height: Get.height * 0.065,
                                            width: Get.width,
                                          ),
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
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
