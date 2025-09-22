import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/widget/shared/main_button.dart';

import '../../../core/constant/app_routes.dart';
import '../../widget/auth/component_container.dart';
import '../../widget/auth/decription_text.dart';
import '../../widget/auth/sub_title.dart';
import '../../widget/auth/success_icon.dart';
import '../../widget/shared/logo_image.dart';
import '../../widget/shared/red_lines_design_row.dart';

class SuccessRegisterScreen extends StatelessWidget {
  const SuccessRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RedLinesDesignRow(),
          SingleChildScrollView(
            child: Column(
              children: [
                LogoImage(
                  height: Get.height * 0.3,
                  width: double.infinity,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
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
                              SubTitle(text: 'Congratulations'.tr),
                              DescriptionText(
                                text: 'Successfully registered'.tr,
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: Get.height * 0.025),
                                child: MainButton(
                                  buttonText: 'Go back to sing in'.tr,
                                  onPressed: () {
                                    Get.offAllNamed(AppRoutes.login);
                                  },
                                  height: Get.height * 0.065,
                                  width: Get.width,
                                ),
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
          )
        ],
      ),
    );
  }
}
