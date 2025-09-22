import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onBoarding/on_boarding_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/source/static/static.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        children: [
          ...List.generate(
            onBordingList.length,
            (indicatorIndex) => AnimatedContainer(
              margin: EdgeInsets.only(right: Get.width * 0.04),
              duration: const Duration(microseconds: 900),
              width: Get.width * 0.045,
              height: Get.width * 0.045,
              decoration: BoxDecoration(
                color: AppColors.pureWhite,
                borderRadius: BorderRadius.circular(Get.width * 0.045),
                boxShadow: [
                  controller.currentPage == indicatorIndex
                      ? BoxShadow(
                          color: indicatorIndex == 1
                              ? AppColors.onBoardingPageIndicator
                              : AppColors.greyBlur,
                          blurRadius: 0,
                          spreadRadius: 10)
                      : const BoxShadow()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
