import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onBoarding/on_boarding_controller.dart';
import '../../../core/constant/app_colors.dart';

class CusotmBlackButton extends GetView<OnBoardingControllerImp> {
  const CusotmBlackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.03),
        boxShadow: const [
          BoxShadow(
            color: AppColors.redBlur,
            blurRadius: 12,
            spreadRadius: 1,
          )
        ],
      ),
      child: MaterialButton(
        onPressed: controller.next,
        color: AppColors.blackOnBoardingButton,
        minWidth: Get.width * 0.4,
        height: Get.height * 0.06,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Get.width * 0.04),
        ),
        textColor: AppColors.pureWhite,
        child: Text(
          'Get Started'.tr,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primaryWhite,
              ),
        ),
      ),
    );
  }
}
