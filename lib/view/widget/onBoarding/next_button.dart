import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onBoarding/on_boarding_controller.dart';
import '../../../core/constant/app_colors.dart';

class NextButton extends GetView<OnBoardingControllerImp> {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());

    return MaterialButton(
      onPressed: controller.next,
      color: AppColors.primaryRed,
      minWidth: Get.width * 0.1,
      height: Get.height * 0.06,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Get.height * 0.06)),
      child: const Icon(
        Icons.arrow_forward,
        color: AppColors.pureWhite,
      ),
    );
  }
}
