import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/widget/shared/main_button.dart';

import '../../../../controller/auth/forgetPassword/success_reset_password_controller.dart';
import '../../../widget/auth/component_container.dart';
import '../../../widget/auth/decription_text.dart';
import '../../../widget/auth/sub_title.dart';
import '../../../widget/auth/success_icon.dart';
import '../../../widget/shared/logo_image.dart';
import '../../../widget/shared/red_lines_design_row.dart';

class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
        SuccessResetPasswordControllerImp()); // Use Get.put instead of Get.lazyPut
    SuccessResetPasswordControllerImp controller = Get.find();
    return Scaffold(
      body: Stack(
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
                        width: double.infinity,
                      ),
                      ComponentContainer(
                        height: Get.height * 0.7,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: Get.height * 0.075,
                            left: Get.width * 0.075,
                            right: Get.width * 0.075,
                          ),
                          child: Column(
                            children: [
                              const SuccessIcon(),
                              SubTitle(
                                text: 'Done !'.tr,
                              ),
                              DescriptionText(
                                text: 'Your password is changed'.tr,
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: Get.height * 0.05),
                                child: MainButton(
                                    buttonText: 'Go back to sing in'.tr,
                                    onPressed: () {
                                      controller.moveToLogin();
                                    },
                                    height: Get.height * 0.065,
                                    width: Get.width),
                              )
                            ],
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
    );
  }
}
