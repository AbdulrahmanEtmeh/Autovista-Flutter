import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

Future<bool> appExitAlert() {
  Get.defaultDialog(
    backgroundColor: AppColors.primaryWhite,
    title: 'Alert'.tr,
    titleStyle: Theme.of(Get.context!)
        .textTheme
        .headlineMedium!
        .copyWith(color: AppColors.primaryRed, fontWeight: FontWeight.bold),
    middleText: 'Are you sure you want to close the app ?'.tr,
    middleTextStyle: Theme.of(Get.context!)
        .textTheme
        .titleLarge!
        .copyWith(color: AppColors.pureBlack, fontWeight: FontWeight.w500),
    actions: [
      TextButton(
        onPressed: () {
          exit(0);
        },
        child: Text(
          'Yes'.tr,
          style: Theme.of(Get.context!).textTheme.titleMedium!.copyWith(
              color: AppColors.primaryRed, fontWeight: FontWeight.w500),
        ),
      ),
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          'Cancel'.tr,
          style: Theme.of(Get.context!).textTheme.titleMedium!.copyWith(
              color: AppColors.primaryRed, fontWeight: FontWeight.w500),
        ),
      )
    ],
  );
  return Future.value(true);
}
