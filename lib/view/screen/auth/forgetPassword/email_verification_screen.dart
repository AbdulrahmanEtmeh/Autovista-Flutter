import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import '../../../../controller/auth/forgetPassword/email_verification_controller.dart';

import '../../../widget/auth/component_container.dart';
import '../../../widget/auth/decription_text.dart';
import '../../../widget/auth/custom_otp.dart';
import '../../../widget/auth/sub_title.dart';
import '../../../widget/auth/title_text.dart';
import '../../../widget/shared/logo_image.dart';
import '../../../widget/shared/red_lines_design_row.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmailVerificationControllerImp());
    return Scaffold(
      body: GetBuilder<EmailVerificationControllerImp>(
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
                                height: Get.height * 0.35,
                                width: double.infinity,
                              ),
                              TitleText(text: 'Email Verification'.tr),
                              SizedBox(height: Get.height * 0.1),
                              ComponentContainer(
                                height: Get.height * 0.55,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: Get.height * 0.1,
                                    left: Get.width * 0.03,
                                    right: Get.width * 0.03,
                                  ),
                                  child: Column(
                                    children: [
                                      SubTitle(text: 'Verify Email'.tr),
                                      SizedBox(height: Get.height * 0.02),
                                      DescriptionText(
                                          text:
                                              '${'Please enter the digit code sent to'.tr}\n${controller.email}'),
                                      SizedBox(height: Get.height * 0.02),
                                      CustomOtp(
                                        onCodeChanged: (String code) {},
                                        onSubmit: (String verificationCode) {
                                          controller
                                              .checkCode(verificationCode);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
