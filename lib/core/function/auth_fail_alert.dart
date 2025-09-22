import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_colors.dart';

Future<bool> authFailAlert(String middleText) {
  Get.defaultDialog(
    backgroundColor: AppColors.primaryWhite,
    title: 'Warning'.tr,
    titleStyle: TextStyle(
      color: AppColors.primaryRed,
      fontSize: Get.height * 0.02,
      fontWeight: FontWeight.w700,
    ),
    middleText: middleText,
    middleTextStyle: TextStyle(
      color: AppColors.pureBlack,
      fontSize: Get.height * 0.015,
      fontWeight: FontWeight.w500,
    ),
    actions: [
      MaterialButton(
        height: Get.height * 0.05,
        minWidth: Get.width * 0.15,
        color: AppColors.primaryRed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          Get.back();
        },
        child: Text(
          'Retry'.tr,
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: Get.height * 0.015,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ],
  );
  return Future.value(true);
}
