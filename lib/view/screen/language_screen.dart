import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/function/app_exit_alert.dart';
import 'package:graduation_project/core/localization/locale_controller.dart';

import '../../core/constant/app_colors.dart';
import '../widget/shared/logo_image.dart';
import '../widget/shared/red_lines_design_row.dart';
import '../widget/language/language_button.dart';

class LanguageScreen extends GetView<LocaleController> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: appExitAlert,
        child: Stack(
          children: [
            const RedLinesDesignRow(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * 0.05),
                        LogoImage(
                          height: Get.height * 0.4,
                          width: Get.width,
                        ),
                        Text(
                          'lang title'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: AppColors.pureWhite,
                                  fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: Get.height * 0.05),
                        LanguageButton(
                          buttonText: 'lang name ar'.tr,
                          onPressed: () {
                            controller.changeLanguage('ar');
                            Get.toNamed(AppRoutes.onBoarding);
                          },
                        ),
                        SizedBox(height: Get.height * 0.02),
                        LanguageButton(
                          buttonText: 'lang name en'.tr,
                          onPressed: () {
                            controller.changeLanguage('en');
                            Get.toNamed(AppRoutes.onBoarding);
                          },
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
